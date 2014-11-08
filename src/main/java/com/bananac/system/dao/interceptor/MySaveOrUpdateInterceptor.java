package com.bananac.system.dao.interceptor;

import java.io.Serializable;
import java.util.Date;

import org.hibernate.EmptyInterceptor;
import org.hibernate.type.Type;

/**
 * 自动为保存操作更新 创建时间以及修改时间
 * @author xiaojf 294825811@qq.com
 */
public class MySaveOrUpdateInterceptor extends EmptyInterceptor {
    @Override
    public boolean onSave(Object entity, Serializable id, Object[] state, String[] propertyNames, Type[] types) {

        for (int i = 0; i < propertyNames.length; i++) {
            // 创建时间
            if ("createTime".equals(propertyNames[i])) {
                if (state[i] == null || "".equals(state[i])) {
                    state[i] = new Date();
                }
            }
            // 修改时间
            if ("updateTime".equals(propertyNames[i])) {
                state[i] = new Date();
            }
            // 逻辑删除
            if ("logDel".equals(propertyNames[i])) {
                if (state[i] == null || "".equals(state[i])) {
                    state[i] = 0;
                }
            }
            // 是否可用
            if ("enabled".equals(propertyNames[i])) {
                if (state[i] == null || "".equals(state[i])) {
                    state[i] = 1;
                }
            }
        }

        return super.onSave(entity, id, state, propertyNames, types);
    }

}
