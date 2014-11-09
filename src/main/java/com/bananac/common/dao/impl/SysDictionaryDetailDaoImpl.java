package com.bananac.common.dao.impl;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.bananac.system.dao.impl.BaseDaoImpl;
import com.bananac.common.dao.SysDictionaryDetailDao;
import com.bananac.common.model.SysDictionaryDetail;
/**
 *    数据访问接口实现类
 * @author xiaojf 294825811@qq.com
 */
@Repository(value="sysDictionaryDetailDao")
public class SysDictionaryDetailDaoImpl extends BaseDaoImpl<SysDictionaryDetail> implements SysDictionaryDetailDao {

}
