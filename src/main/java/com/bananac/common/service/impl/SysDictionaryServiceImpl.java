package com.bananac.common.service.impl;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bananac.common.dao.SysDictionaryDao;
import com.bananac.common.dao.SysDictionaryDetailDao;
import com.bananac.common.model.SysDictionary;
import com.bananac.common.service.SysDictionaryService;
import com.bananac.system.bean.Message;
import com.bananac.system.bean.Page;

/**
 * 业务接口实现类
 * 
 * @author xiaojf 294825811@qq.com
 */
@Transactional
@Service(value = "sysDictionaryService")
public class SysDictionaryServiceImpl implements SysDictionaryService {
    @Resource(name = "sysDictionaryDao")
    private SysDictionaryDao sysDictionaryDao; // 数据访问接口

    @Resource(name = "sysDictionaryDetailDao")
    private SysDictionaryDetailDao sysDictionaryDetailDao; // 数据访问接口

    @Override
    public Message get(SysDictionary dictionary, Page page) {
        List<SysDictionary> dictionaries = sysDictionaryDao.findByExample(dictionary, page);
        int count = sysDictionaryDao.findByExample(dictionary).size();
        Message message = new Message();
        message.setTotal(count);
        message.setPage(page.getPage());
        message.setRows(dictionaries);
        return message;
    }

    @Override
    public Message delete(String ids) {
        // 删除字典明细
        sysDictionaryDetailDao.deleteByDicIds(ids);
        // 删除字典目录记录
        sysDictionaryDao.delete(Arrays.asList(ids.split(",")));
        Message message = new Message();
        message.setSuccess(true);
        return message;
    }

    @Override
    public Message saveOrUpdate(List<SysDictionary> list) {
        Message message = new Message();
        
        for(SysDictionary dictionary : list){
            String id = dictionary.getId();
            //校验新增记录的编码和名称
            if(id == null || "".equals(id)){
                //校验编号是否存在
                if(dictionary.getCode() == null || "".equals(dictionary.getCode())){
                    message.setSuccess(false);
                    message.setMessage("编码不能为空");
                    return message;
                }
                int size = sysDictionaryDao.find("from SysDictionary where code = '"+dictionary.getCode()+"'").size();
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
                
                size = sysDictionaryDao.find("from SysDictionary where name = '"+dictionary.getName()+"'").size();
                if(size > 0){
                    message.setSuccess(false);
                    message.setMessage("名称【"+dictionary.getName()+"】不能重复");
                    return message;
                }
            }
        }

        sysDictionaryDao.saveOrUpdate(list);

        message.setSuccess(true);
        return message;
    }

    @Override
    public Message enabled(String ids) {
        sysDictionaryDao.enabled(ids);
        Message message = new Message();
        message.setSuccess(true);
        return message;
    }

    @Override
    public Message disabled(String ids) {
        sysDictionaryDao.disabled(ids);
        Message message = new Message();
        message.setSuccess(true);
        return message;
    }
}
