package com.bananac.common.dao.impl;

import org.springframework.stereotype.Repository;

import com.bananac.common.dao.SysDictionaryDetailDao;
import com.bananac.common.model.SysDictionaryDetail;
import com.bananac.system.dao.impl.BaseDaoImpl;
/**
 *  数据访问接口实现类
 * @author xiaojf 294825811@qq.com
 */
@Repository(value="sysDictionaryDetailDao")
public class SysDictionaryDetailDaoImpl extends BaseDaoImpl<SysDictionaryDetail> implements SysDictionaryDetailDao {

    @Override
    public void deleteByDicIds(String ids) {
        String sql = "delete from SysDictionaryDetail where dictionaryId in (:ids)";
        super.getSessionFactory().getCurrentSession().createQuery(sql).setParameterList("ids", ids.split(",")).executeUpdate();
    }

    @Override
    public void enabled(String ids) {
        String sql = "update SysDictionaryDetail set enabled = '1' where id in (:ids)";
        super.getSessionFactory().getCurrentSession().createQuery(sql).setParameterList("ids", ids.split(",")).executeUpdate();
    }

    @Override
    public void disabled(String ids) {
        String sql = "update SysDictionaryDetail set enabled = '0' where id in (:ids)";
        super.getSessionFactory().getCurrentSession().createQuery(sql).setParameterList("ids", ids.split(",")).executeUpdate();
    }

}
