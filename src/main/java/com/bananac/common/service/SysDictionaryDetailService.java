package com.bananac.common.service;

import java.util.List;

import com.bananac.common.model.SysDictionaryDetail;
import com.bananac.system.bean.Message;
import com.bananac.system.bean.Page;

/**
 *   业务接口
 * @author xiaojf 294825811@qq.com
 */
public interface SysDictionaryDetailService {

    /**
     * 获取
     * @param dictionaryDetail 查询条件
     * @param page 分页
     * @return
     */
    Message get(SysDictionaryDetail dictionaryDetail, Page page);

    /**
     * 删除
     * @param ids 主键
     * @return
     */
    Message delete(String ids);

    /**
     * 新增或更新
     * @param list
     * @return
     */
    Message saveOrUpdate(List<SysDictionaryDetail> list);

    /**
     * 启用
     * @param ids 主键
     * @return
     */
    Message enabled(String ids);

    /**
     * 停用
     * @param ids
     * @return
     */
    Message disabled(String ids);

}
