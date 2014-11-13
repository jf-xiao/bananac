package com.bananac.common.dao.impl;

import org.springframework.stereotype.Repository;

import com.bananac.common.dao.SysDictionaryDao;
import com.bananac.common.model.SysDictionary;
import com.bananac.system.dao.impl.BaseDaoImpl;
/**
 *    数据访问接口实现类
 * @author xiaojf 294825811@qq.com
 */
@Repository(value="sysDictionaryDao")
public class SysDictionaryDaoImpl extends BaseDaoImpl<SysDictionary> implements SysDictionaryDao {

    @Override
    public void enabled(String ids) {
        super.getSessionFactory().getCurrentSession().
        createQuery("update SysDictionary set enabled = '1' where id in (:ids)").setParameterList("ids", ids.split(",")).executeUpdate();
    }

    @Override
    public void disabled(String ids) {
        super.getSessionFactory().getCurrentSession().
        createQuery("update SysDictionary set enabled = '0' where id in (:ids)").setParameterList("ids", ids.split(",")).executeUpdate();
    }

    
}
