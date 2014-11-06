package com.bananac.code.model;

/**
 * 字段
 * @author xiaojf
 *
 */
public class ColumnInfo {
    private String name;                    //字段名称
    private String catalog;                 //数据库名称
    private String tableName;               //表名
    private String comment;                 //注释
    private boolean unique ;                //是否唯一值 
    private boolean nullable;               //是否允许为空
    private boolean isKey;                  //是否为主键
    private String type;                    //类型
    private int length;                     //长度
    private boolean isVersion;              //是否为版本号
    private boolean insertable = true;      //是否允许插入
    private boolean updateable = true;      //是否允许更新
    
    public ColumnInfo() {
        super();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public boolean isUnique() {
        return unique;
    }

    public void setUnique(boolean unique) {
        this.unique = unique;
    }

    public boolean isNullable() {
        return nullable;
    }

    public void setNullable(boolean nullable) {
        this.nullable = nullable;
    }

    public boolean isKey() {
        return isKey;
    }

    public void setKey(boolean isKey) {
        this.isKey = isKey;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public boolean isVersion() {
        return isVersion;
    }

    public void setVersion(boolean isVersion) {
        this.isVersion = isVersion;
    }

    public boolean isInsertable() {
        return insertable;
    }

    public void setInsertable(boolean insertable) {
        this.insertable = insertable;
    }

    public boolean isUpdateable() {
        return updateable;
    }

    public void setUpdateable(boolean updateable) {
        this.updateable = updateable;
    }

    @Override
    public String toString() {
        return "ColumnInfo [name=" + name + ", comment=" + comment + ", unique=" + unique + ", nullable=" + nullable
                + ", isKey=" + isKey + ", type=" + type + ", length=" + length + ", isVersion=" + isVersion
                + ", insertable=" + insertable + ", updateable=" + updateable + "]";
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((catalog == null) ? 0 : catalog.hashCode());
        result = prime * result + ((name == null) ? 0 : name.hashCode());
        result = prime * result + ((tableName == null) ? 0 : tableName.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        ColumnInfo other = (ColumnInfo) obj;
        if (catalog == null) {
            if (other.catalog != null)
                return false;
        } else if (!catalog.equals(other.catalog))
            return false;
        if (name == null) {
            if (other.name != null)
                return false;
        } else if (!name.equals(other.name))
            return false;
        if (tableName == null) {
            if (other.tableName != null)
                return false;
        } else if (!tableName.equals(other.tableName))
            return false;
        return true;
    }
} 
