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

}
