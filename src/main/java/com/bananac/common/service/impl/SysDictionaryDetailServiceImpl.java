package com.bananac.common.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bananac.common.dao.SysDictionaryDetailDao;
import com.bananac.common.service.SysDictionaryDetailService;

/**
 *   业务接口实现类
 * @author xiaojf 294825811@qq.com
 */
@Transactional
@Service(value="sysDictionaryDetailService")
public class SysDictionaryDetailServiceImpl implements SysDictionaryDetailService {
    @Resource(name="sysDictionaryDetailDao")
    private SysDictionaryDetailDao sysDictionaryDetailDao;    //数据访问接口
}
