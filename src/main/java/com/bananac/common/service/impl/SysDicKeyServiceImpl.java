package com.bananac.common.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bananac.common.dao.SysDicKeyDao;
import com.bananac.common.service.SysDicKeyService;

/**
 *   业务接口实现类
 * @author xiaojf 294825811@qq.com
 */
@Transactional
@Service(value="sysDicKeyService")
public class SysDicKeyServiceImpl implements SysDicKeyService {
    @Resource(name="sysDicKeyDao")
    private SysDicKeyDao sysDicKeyDao;    //数据访问接口
}
