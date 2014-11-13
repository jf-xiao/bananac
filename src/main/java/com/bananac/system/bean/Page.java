package com.bananac.system.bean;

/**
 * 分页
 * @author xiaojf 294825811@qq.com
 */
public class Page {
    private int rows;       // 每页显示条数
    private int page;       // 当前第几页
    private int total;      // 总记录数

    public Page() {
        super();
    }

    public Page(int rows, int page, int total) {
        super();
        this.rows = rows;
        this.page = page;
        this.total = total;
    }

    @Override
    public String toString() {
        return "Page [rows=" + rows + ", page=" + page + ", total=" + total + "]";
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
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
