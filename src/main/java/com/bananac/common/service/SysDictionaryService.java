package com.bananac.common.service;

import java.util.List;

import com.bananac.common.model.SysDictionary;
import com.bananac.system.bean.Message;
import com.bananac.system.bean.Page;

/**
 *   业务接口
 * @author xiaojf 294825811@qq.com
 */
public interface SysDictionaryService {

    /**
     * 分页查询
     * @param dictionary 查询条件
     * @param page 分页
     * @return
     */
    Message get(SysDictionary dictionary, Page page);

    /**
     * 删除记录 
     * @param ids 主键
     * @return
     */
    Message delete(String ids);

    /**
     * 保存或者更新记录
     * @param list
     */
    Message saveOrUpdate(List<SysDictionary> list);

    /**
     * 启用
     * @param ids 记录主键
     * @return
     */
    Message enabled(String ids);

    /**
     * 停用
     * @param ids 记录主键
     * @return
     */
    Message disabled(String ids);

}
