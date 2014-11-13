package com.bananac.system.bean;

import java.util.List;

/**
 * 消息
 * @author xiaojf 294825811@qq.com
 */
public class Message{
    private boolean success;        //是否成功
    private String message;         //提示信息
    
    private List rows;               // datagrid数据
    private int page;               // 当前第几页
    private int total;              // 总记录数
    
    public Message() {
        super();
    }

    public boolean isSuccess() {
        return success;
    }
    
    public void setSuccess(boolean success) {
        this.success = success;
    }
    
    public String getMessage() {
        return message;
    }
    
    public void setMessage(String message) {
        this.message = message;
    }

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    
    
}
