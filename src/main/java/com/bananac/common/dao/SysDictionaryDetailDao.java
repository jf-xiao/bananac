package com.bananac.common.dao;

import com.bananac.system.dao.BaseDao;
import com.bananac.common.model.SysDictionaryDetail;
/**
 *   数据访问接口
 * @author xiaojf 294825811@qq.com
 */
public interface SysDictionaryDetailDao extends BaseDao<SysDictionaryDetail> {

    /**
     * 根据字典明细的目录主键删除明细记录
     * @param ids 主键
     */
    void deleteByDicIds(String ids);

    /**
     * 启用
     * @param ids
     */
    void enabled(String ids);

    /**
     * 停用
     * @param ids
     */
    void disabled(String ids);

}
