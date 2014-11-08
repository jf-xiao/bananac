package com.bananac.common.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;

import org.hibernate.annotations.GenericGenerator;
/**
 * 
 * @author xiaojf 294825811@qq.com
 */
@Entity
@Table(name = "sys_dic_value")
public class SysDicValue implements java.io.Serializable {
    private static final long serialVersionUID = 1L;
    private java.lang.String dicValId ;    //VALUE主键
    private java.lang.String dicKeyId ;    //KEY主键
    private java.lang.String name ;    //名称
    private java.lang.String sign ;    //标识
    private java.lang.String creator ;    //创建人
    private java.lang.String updator ;    //修改人
    private java.util.Date createTime ;    //创建时间
    private java.util.Date updateTime ;    //修改时间
    private java.lang.String company ;    //公司
    private java.lang.Integer version ;    //版本号
    private java.lang.Integer logDel ;    //逻辑删除
    private java.lang.Integer enabled ;    //是否可用
    private java.lang.Integer sorted ;    //

    public SysDicValue() {
    }

        
    @GenericGenerator(name = "generator", strategy = "uuid.hex")
    @Id
    @GeneratedValue(generator = "generator")
    @Column(name = "DIC_VAL_ID", unique = true, nullable = false, length = 64)
    public java.lang.String getDicValId() {
        return this.dicValId ;
    }
    
    public void setDicValId(java.lang.String dicValId) {
        this.dicValId = dicValId ;
    }
            
    /**
     * get KEY主键
     * @return KEY主键
     */
    @Column(name = "DIC_KEY_ID", length = 64)
    public java.lang.String getDicKeyId () {
        return this.dicKeyId ;
    }
    
    /**
     * set KEY主键
     * @param dicKeyId KEY主键
     */
    public void setDicKeyId (java.lang.String dicKeyId) {
        this.dicKeyId = dicKeyId ;
    }
            
    /**
     * get 名称
     * @return 名称
     */
    @Column(name = "NAME", length = 64)
    public java.lang.String getName () {
        return this.name ;
    }
    
    /**
     * set 名称
     * @param name 名称
     */
    public void setName (java.lang.String name) {
        this.name = name ;
    }
            
    /**
     * get 标识
     * @return 标识
     */
    @Column(name = "SIGN", length = 64)
    public java.lang.String getSign () {
        return this.sign ;
    }
    
    /**
     * set 标识
     * @param sign 标识
     */
    public void setSign (java.lang.String sign) {
        this.sign = sign ;
    }
            
    /**
     * get 创建人
     * @return 创建人
     */
    @Column(name = "CREATOR", length = 64)
    public java.lang.String getCreator () {
        return this.creator ;
    }
    
    /**
     * set 创建人
     * @param creator 创建人
     */
    public void setCreator (java.lang.String creator) {
        this.creator = creator ;
    }
            
    /**
     * get 修改人
     * @return 修改人
     */
    @Column(name = "UPDATOR", length = 64)
    public java.lang.String getUpdator () {
        return this.updator ;
    }
    
    /**
     * set 修改人
     * @param updator 修改人
     */
    public void setUpdator (java.lang.String updator) {
        this.updator = updator ;
    }
            
    /**
     * get 创建时间
     * @return 创建时间
     */
    @Column(name = "CREATE_TIME", length = 19)
    public java.util.Date getCreateTime () {
        return this.createTime ;
    }
    
    /**
     * set 创建时间
     * @param createTime 创建时间
     */
    public void setCreateTime (java.util.Date createTime) {
        this.createTime = createTime ;
    }
            
    /**
     * get 修改时间
     * @return 修改时间
     */
    @Column(name = "UPDATE_TIME", length = 19)
    public java.util.Date getUpdateTime () {
        return this.updateTime ;
    }
    
    /**
     * set 修改时间
     * @param updateTime 修改时间
     */
    public void setUpdateTime (java.util.Date updateTime) {
        this.updateTime = updateTime ;
    }
            
    /**
     * get 公司
     * @return 公司
     */
    @Column(name = "COMPANY", length = 64)
    public java.lang.String getCompany () {
        return this.company ;
    }
    
    /**
     * set 公司
     * @param company 公司
     */
    public void setCompany (java.lang.String company) {
        this.company = company ;
    }
            
    @Version
    @Column(name = "VERSION")
    public Integer getVersion() {
        return this.version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }
            
    /**
     * get 逻辑删除
     * @return 逻辑删除
     */
    @Column(name = "LOG_DEL", length = 10)
    public java.lang.Integer getLogDel () {
        return this.logDel ;
    }
    
    /**
     * set 逻辑删除
     * @param logDel 逻辑删除
     */
    public void setLogDel (java.lang.Integer logDel) {
        this.logDel = logDel ;
    }
            
    /**
     * get 是否可用
     * @return 是否可用
     */
    @Column(name = "ENABLED", length = 10)
    public java.lang.Integer getEnabled () {
        return this.enabled ;
    }
    
    /**
     * set 是否可用
     * @param enabled 是否可用
     */
    public void setEnabled (java.lang.Integer enabled) {
        this.enabled = enabled ;
    }
            
    /**
     * get 
     * @return 
     */
    @Column(name = "SORTED", length = 10)
    public java.lang.Integer getSorted () {
        return this.sorted ;
    }
    
    /**
     * set 
     * @param sorted 
     */
    public void setSorted (java.lang.Integer sorted) {
        this.sorted = sorted ;
    }
    }