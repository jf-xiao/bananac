package com.bananac.common.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        Map<String, Object> params = new HashMap<String, Object>();
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

        sysDictionaryDao.saveOrUpdate(list);

        Message message = new Message();
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
