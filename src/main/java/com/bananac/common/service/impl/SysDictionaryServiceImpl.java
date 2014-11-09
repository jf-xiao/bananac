package com.bananac.common.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bananac.common.dao.SysDictionaryDao;
import com.bananac.common.service.SysDictionaryService;

/**
 *   业务接口实现类
 * @author xiaojf 294825811@qq.com
 */
@Transactional
@Service(value="sysDictionaryService")
public class SysDictionaryServiceImpl implements SysDictionaryService {
    @Resource(name="sysDictionaryDao")
    private SysDictionaryDao sysDictionaryDao;    //数据访问接口
}
