package com.bananac.common.service.impl;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bananac.common.dao.SysDictionaryDetailDao;
import com.bananac.common.model.SysDictionaryDetail;
import com.bananac.common.service.SysDictionaryDetailService;
import com.bananac.system.bean.Message;
import com.bananac.system.bean.Page;

/**
 *   业务接口实现类
 * @author xiaojf 294825811@qq.com
 */
@Transactional
@Service(value="sysDictionaryDetailService")
public class SysDictionaryDetailServiceImpl implements SysDictionaryDetailService {
    @Resource(name="sysDictionaryDetailDao")
    private SysDictionaryDetailDao sysDictionaryDetailDao;    //数据访问接口

    @Override
    public Message get(SysDictionaryDetail dictionaryDetail, Page page) {
        List<SysDictionaryDetail> dictionaries = sysDictionaryDetailDao.findByExample(dictionaryDetail, page);
        int count = sysDictionaryDetailDao.findByExample(dictionaryDetail).size();
        Message message = new Message();
        message.setTotal(count);
        message.setPage(page.getPage());
        message.setRows(dictionaries);
        return message;
    }

    @Override
    public Message delete(String ids) {
        sysDictionaryDetailDao.delete(Arrays.asList(ids.split(",")));
        Message message = new Message();
        message.setSuccess(true);
        return message;
    }

    @Override
    public Message saveOrUpdate(List<SysDictionaryDetail> list) {
        Message message = new Message();
        
        for(SysDictionaryDetail dictionary : list){
            String id = dictionary.getId();
            //校验新增记录的编码和名称
            if(id == null || "".equals(id)){
                //校验编号是否存在
                if(dictionary.getCode() == null || "".equals(dictionary.getCode())){
                    message.setSuccess(false);
                    message.setMessage("编码不能为空");
                    return message;
                }
                int size = sysDictionaryDetailDao.find("from SysDictionaryDetail where code = '"+dictionary.getCode()+"' and dictionaryId = '"+dictionary.getDictionaryId()+"'").size();
                if(size > 0){
                    message.setSuccess(false);
                    message.setMessage("编码【"+dictionary.getCode()+"】不能重复");
                    return message;
                }
                //校验名称是否存在
                if(dictionary.getName() == null || "".equals(dictionary.getName())){
                    message.setSuccess(false);
                    message.setMessage("名称不能为空");
                    return message;
                }
                size = sysDictionaryDetailDao.find("from SysDictionaryDetail where name = '"+dictionary.getName()+"' and dictionaryId = '"+dictionary.getDictionaryId()+"'").size();
                if(size > 0){
                    message.setSuccess(false);
                    message.setMessage("名称【"+dictionary.getName()+"】不能重复");
                    return message;
                }
            }
        }
        
        sysDictionaryDetailDao.saveOrUpdate(list);

        message.setSuccess(true);
        return message;
    }

    @Override
    public Message enabled(String ids) {
        sysDictionaryDetailDao.enabled(ids);
        Message message = new Message();
        message.setSuccess(true);
        return message;
    }

    @Override
    public Message disabled(String ids) {
        sysDictionaryDetailDao.disabled(ids);
        Message message = new Message();
        message.setSuccess(true);
        return message;
    }
}
