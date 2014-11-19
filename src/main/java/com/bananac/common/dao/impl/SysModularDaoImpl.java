package com.bananac.common.dao.impl;

import org.springframework.stereotype.Repository;

import com.bananac.common.dao.SysModularDao;
import com.bananac.common.model.SysModular;
import com.bananac.system.dao.impl.BaseDaoImpl;
/**
 *    数据访问接口实现类
 * @author xiaojf 294825811@qq.com
 */
@Repository(value="sysModularDao")
public class SysModularDaoImpl extends BaseDaoImpl<SysModular> implements SysModularDao {

}
