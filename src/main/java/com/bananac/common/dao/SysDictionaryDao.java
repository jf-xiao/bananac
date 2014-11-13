package com.bananac.common.dao;

import com.bananac.common.model.SysDictionary;
import com.bananac.system.dao.BaseDao;
/**
 *   数据访问接口
 * @author xiaojf 294825811@qq.com
 */
public interface SysDictionaryDao extends BaseDao<SysDictionary> {

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
