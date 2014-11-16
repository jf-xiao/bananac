package com.bananac.common.service.impl;

import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bananac.common.dao.SysModularDao;
import com.bananac.common.model.SysModular;
import com.bananac.common.service.SysModularService;
import com.bananac.system.bean.Message;
import com.bananac.system.bean.Page;
import com.bananac.system.bean.TreeGrid;
import com.bananac.system.util.BeanToMapUtil;
import com.bananac.system.util.StringUtil;

/**
 *   业务接口实现类
 * @author xiaojf 294825811@qq.com
 */
@Transactional
@Service(value="sysModularService")
public class SysModularServiceImpl implements SysModularService {
    @Resource(name="sysModularDao")
    private SysModularDao sysModularDao;    //数据访问接口

    @Override
    public Message get(SysModular sysModular, Page page) throws IntrospectionException, IllegalAccessException, InvocationTargetException {
        Message message = new Message();
        //查询结果
        List<SysModular> list = null;
        if(StringUtil.isNullOrEmpty(sysModular.getId())){//如果上级节点ID为空, 则查询顶级节点
            String hql = "from SysModular where parentId ='' or parentId is null";
            list = sysModularDao.find(hql);
        }else{//查询某个节点的子节点
            String hql = "from SysModular where parentId = :parentId";
            Map<String,Object> params = new HashMap<String, Object>();
            params.put("parentId", sysModular.getId());
            list = sysModularDao.find(hql,params);
        }
        List<Map<String,String>> resultList = new ArrayList<Map<String,String>>();
        //判断是否有子节点
        for(SysModular modular : list){
            String hql = "select count(*) from SysModular where parentId = :parentId";
            Map<String,Object> params = new HashMap<String, Object>();
            params.put("parentId", modular.getId());
            Long result =  (Long) sysModularDao.unique(hql, params);
            if(result == 0){//没有子节点
                modular.setState(TreeGrid.NONE_CHILDREN_NODE);
            }else{//有子节点
                modular.setState(TreeGrid.EXIST_CHILDREN_NODE);
            }
            
            Map<String,String> map = BeanToMapUtil.convertBean(modular);
            map.put("_parentId", modular.getParentId());
            resultList.add(map);
        }
        
        //总记录数
        String countHql = "select count(*) from SysModular where parentId ='' or parentId is null";
        long total = (Long) sysModularDao.unique(countHql, null);
        
        message.setRows(resultList);
        message.setTotal(Integer.parseInt(total+""));
        message.setSuccess(true);
        return message;
    }

}
