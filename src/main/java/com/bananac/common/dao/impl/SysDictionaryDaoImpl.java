package com.bananac.common.dao.impl;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.bananac.system.dao.impl.BaseDaoImpl;
import com.bananac.common.dao.SysDictionaryDao;
import com.bananac.common.model.SysDictionary;
/**
 *    数据访问接口实现类
 * @author xiaojf 294825811@qq.com
 */
@Repository(value="sysDictionaryDao")
public class SysDictionaryDaoImpl extends BaseDaoImpl<SysDictionary> implements SysDictionaryDao {

}