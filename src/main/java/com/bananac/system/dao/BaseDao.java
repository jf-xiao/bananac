package com.bananac.system.dao;

import java.util.List;
import java.util.Map;

import com.bananac.system.bean.Page;
/**
 * 公共数据访问接口
 * @author xiaojf 294825811@qq.com
 * @param <T>
 */
public interface BaseDao<T> {
    /**
     * 新增
     * @param domain 对象
     */
    public void add(T domain);
    
    /**
     * 新增
     * @param domains 对象集合
     */
    public void add(List<T> domains);
    
    /**
     * 删除（如果被删除的域对象有加载到二级缓存中，推荐使用deleteWithCache，删除后将根据ID局部更新二级缓存中的域对象，性能较优；
     * 如果使用delete方法，将全部更新与域对象相同类型或者相关的缓存对象）
     * @param id 主键
     */
    public void delete(String id);
    
    /**
     * 删除（如果被删除的域对象有加载到二级缓存中，推荐使用deleteWithCache，删除后将根据ID局部更新二级缓存中的域对象，性能较优；
     * 如果使用delete方法，将全部更新与域对象相同类型或者相关的缓存对象）
     * @param ids 主键集合
     */
    public void delete(List<String> ids);
    
    /**
     * 删除（如果被删除的域对象有加载到二级缓存中，推荐使用deleteWithCache，删除后将根据ID局部更新二级缓存中的域对象，性能较优；
     * 如果使用delete方法，将全部更新与域对象相同类型或者相关的缓存对象）
     * @param id 主键
     */
    public void deleteWithCache(String id);
    
    /**
     * 删除（如果被删除的域对象有加载到二级缓存中，推荐使用deleteWithCache，删除后将根据ID局部更新二级缓存中的域对象，性能较优；
     * 如果使用delete方法，将全部更新与域对象相同类型或者相关的缓存对象）
     * @param ids 主键集合
     */
    public void deleteWithCache(List<String> ids);
    
    /**
     * 更新
     * @param domain 对象
     */
    public void update(T domain);
    
    /**
     * 更新
     * @param domains 对象集合
     */
    public void update(List<T> domains);
    
    /**
     * 获取
     * @param id 主键
     * @return
     */
    public T get(String id);
    
    /**
     * 查找
     * @param hql hql语句
     * @param params 参数
     * @return
     */
    public List<T> find(String hql,Map<String, Object> params);
    
    /**
     * 查找
     * @param hql
     * @return
     */
    public List<T> find(String hql);
    
    /**
     * 获取
     * @param ids 主键集合
     * @return 对象集合
     */
    public List<T> get(List<String> ids);
    
    /**
     * 获取所有
     * @return 对象集合
     */
    public List<T> getAll();
    
    /**
     * 执行hql语句
     * @param hql hql语句
     */
    public void execute(String hql);
    
    /**
     * 执行hql语句
     * @param hql hql语句
     */
    public void execute(String hql,Map<String, Object> params);
    
    /**
     * 分页查询
     * @param pageNo 页号
     * @param pageSize 每页大小
     * @return 对象集合
     */
    public List<T> findByPage(int pageNo ,int pageSize);
    
    /**
     * 分页查询
     * @param hql hql查询语句
     * @param page 分页对象
     * @param params 查询参数值
     * @return
     */
    public List<T> findByPage(String hql ,Page page, Map<String, Object> params);
    
    /**
     * 获取惟一值
     * @param hql hql语句
     * @param params 参数
     * @return 惟一值
     */
    public Object unique(String hql ,Map<String, Object> params);
    
    /**
     * 根据实体对象查询, 不支持主键字段, 不支持关联查询
     * @param domain
     * @return
     */
    public List<T> findByExample(T domain);
    
    /**
     * 根据实体对象查询并分页, 不支持主键字段, 不支持关联查询
     * @param domain
     * @return
     */
    public List<T> findByExample(T domain,Page page);
    
    /**
     * 保存或修改
     * @param domains
     */
    public void saveOrUpdate(List<T> domains) ;
    
    /**
     * 保存或修改
     * @param domain
     */
    public void saveOrUpdate(T domain) ;

}
