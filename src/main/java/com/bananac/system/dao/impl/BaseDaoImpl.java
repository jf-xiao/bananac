package com.bananac.system.dao.impl;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.persistence.Id;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.bananac.system.bean.Page;
import com.bananac.system.dao.BaseDao;

/**
 * 公共数据访问接口实现
 * 
 * @author xiaojf 294825811@qq.com
 * @param <T>
 */
public class BaseDaoImpl<T> implements BaseDao<T> {
    @Resource(name = "sessionFactory")
    private SessionFactory sessionFactory; // 会话工厂

    private Class<T> clazz;

    public BaseDaoImpl() {
        ParameterizedType parameterizedType = (ParameterizedType) this.getClass().getGenericSuperclass();
        clazz = (Class<T>) parameterizedType.getActualTypeArguments()[0];
    }

    @Override
    public void add(T domain) {
        Session session = sessionFactory.getCurrentSession();
        session.save(domain);
    }

    @Override
    public void add(List<T> domains) {
        Session session = sessionFactory.getCurrentSession();
        for (T domain : domains) {
            session.save(domain);
        }
    }

    @Override
    public void delete(List<String> ids) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "delete from " + clazz.getSimpleName() + " t where t." + this.getPkName() + " in (:ids) ";
        session.createQuery(hql).setParameterList("ids", ids).executeUpdate();
    }

    @Override
    public void delete(String id) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "delete from " + clazz.getSimpleName() + " t where t." + this.getPkName() + " = :id ";
        session.createQuery(hql).setParameter("id", id).executeUpdate();
    }

    @Override
    public void deleteWithCache(String id) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(this.get(id));
    }

    @Override
    public void deleteWithCache(List<String> ids) {
        for (String id : ids) {
            this.delete(id);
        }
    }

    @Override
    public void update(T domain) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(domain);
    }

    @Override
    public void update(List<T> domains) {
        if (domains != null) {
            for (T domain : domains) {
                this.update(domain);
            }
        }
    }

    @Override
    public T get(String id) {
        Session session = sessionFactory.getCurrentSession();
        return (T) session.get(clazz, id);
    }

    @Override
    public List<T> find(String hql, Map<String, Object> params) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery(hql);
        if (params != null) {
            for (String key : params.keySet()) {
                query.setParameter(key, params.get(key));
            }
        }
        return query.list();
    }

    @Override
    public List<T> get(List<String> ids) {
        List<T> domains = new ArrayList<T>();
        for (String id : ids) {
            domains.add(this.get(id));
        }
        return domains;
    }

    @Override
    public List<T> getAll() {
        Session session = sessionFactory.getCurrentSession();
        String hql = "from " + clazz.getSimpleName();
        return session.createQuery(hql).list();
    }

    @Override
    public void execute(String hql) {
        Session session = sessionFactory.getCurrentSession();
        session.createQuery(hql).executeUpdate();
    }

    @Override
    public void execute(String hql, Map<String, Object> params) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery(hql);
        if (params != null) {
            for (String key : params.keySet()) {
                if (params.get(key) instanceof Collection) {
                    query.setParameterList(key, (Collection) params.get(key));
                    continue;
                }

                query.setParameter(key, params.get(key));
            }
        }
        query.executeUpdate();
    }

    @Override
    public List<T> findByPage(int pageNo, int pageSize) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "from " + clazz.getSimpleName();
        return session.createQuery(hql).setFirstResult((pageSize - 1) * pageNo).setMaxResults(pageSize).list();
    }

    @Override
    public Object unique(String hql, Map<String, Object> params) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery(hql);
        if (params != null) {
            for (String key : params.keySet()) {
                if (params.get(key) instanceof Collection) {
                    query.setParameterList(key, (Collection) params.get(key));
                    continue;
                }

                query.setParameter(key, params.get(key));
            }
        }
        return query.uniqueResult();
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    /**
     * 获取域对象主键名称
     * 
     * @return 主键名称
     */
    private String getPkName() {
        String pkName = "";
        Field[] fields = clazz.getDeclaredFields();
        for (Field field : fields) {
            field.isAnnotationPresent(Id.class);
            pkName = field.getName();
            break;
        }
        return pkName;
    }

    @Override
    public List<T> findByExample(T domain) {
        Session session = sessionFactory.getCurrentSession();
        List<T> list = session.createCriteria(clazz).add(Example.create(domain)).list();
        return list;
    }

    @Override
    public List<T> findByExample(T domain, Page page) {
        Session session = sessionFactory.getCurrentSession();
        List<T> list = session.createCriteria(clazz).add(Example.create(domain))
                .setFirstResult((page.getPage() - 1) * page.getRows()).setMaxResults(page.getRows()).list();
        return list;
    }

    public void saveOrUpdate(List<T> domains) {
        Session session = sessionFactory.getCurrentSession();
        if (domains != null) {
            for (T domain : domains) {
                session.saveOrUpdate(domain);
            }
        }
    }

    @Override
    public List<T> find(String hql) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery(hql).list();
    }

    @Override
    public List<T> findByPage(String hql, Page page, Map<String, Object> params) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery(hql);
        if (params != null) {
            for (String key : params.keySet()) {
                if (params.get(key) instanceof Collection) {
                    query.setParameterList(key, (Collection) params.get(key));
                    continue;
                }

                query.setParameter(key, params.get(key));
            }
        }
        return query.setFirstResult((page.getRows() - 1) * page.getPage()).setMaxResults(page.getRows()).list();
    }

}