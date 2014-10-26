package com.bananac.common.dao.listener;

import org.hibernate.HibernateException;
import org.hibernate.event.spi.SaveOrUpdateEvent;
import org.hibernate.event.spi.SaveOrUpdateEventListener;
/**
 * @author xiaojf 294825811@qq.com
 */
public class MySaveOrUpdateEventListener implements SaveOrUpdateEventListener {

    @Override
    public void onSaveOrUpdate(SaveOrUpdateEvent event) throws HibernateException {
        event.getResultId();
    }

}
