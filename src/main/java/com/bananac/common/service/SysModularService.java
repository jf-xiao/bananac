package com.bananac.common.service;

import java.beans.IntrospectionException;
import java.lang.reflect.InvocationTargetException;

import com.bananac.common.model.SysModular;
import com.bananac.system.bean.Message;
import com.bananac.system.bean.Page;

/**
 *   业务接口
 * @author xiaojf 294825811@qq.com
 */
public interface SysModularService {

    /**
     * 获取
     * @param sysModular 查询条件
     * @param page 分页信息
     * @return
     * @throws InvocationTargetException 
     * @throws IllegalAccessException 
     * @throws IntrospectionException 
     */
    Message get(SysModular sysModular, Page page) throws IntrospectionException, IllegalAccessException, InvocationTargetException;

    /**
     * 保存
     * @param sysModular
     * @return
     */
    Message save(SysModular sysModular);
    
    /**
     * 删除
     * @param ids
     * @return
     */
    Message delete(String ids);
    
    /**
     * 启用
     * @param ids
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
