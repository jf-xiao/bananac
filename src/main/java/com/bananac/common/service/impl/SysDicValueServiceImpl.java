package com.bananac.common.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bananac.common.dao.SysDicValueDao;
import com.bananac.common.service.SysDicValueService;

/**
 *   业务接口实现类
 * @author xiaojf 294825811@qq.com
 */
@Transactional
@Service(value="sysDicValueService")
public class SysDicValueServiceImpl implements SysDicValueService {
    @Resource(name="sysDicValueDao")
    private SysDicValueDao sysDicValueDao;    //数据访问接口
}
