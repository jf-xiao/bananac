package com.bananac.system.bean;

import javax.persistence.Transient;

public class TreeGrid {
    /*** 没有子节点*/
    public static final String NONE_CHILDREN_NODE = "open";
    /*** 有子节点*/
    public static final String EXIST_CHILDREN_NODE = "closed";
    
    //treegrid _parentId
    private String _parentId;
    //节点状态: closed：表示有子节点。open：表示没有子节点。
    private String state;
    
    /**
     * 上级节点ID
     * get treegrid _parentId
     * @return
     */
    @Transient
    public String get_parentId() {
        return _parentId;
    }

    /**
     * 上级节点ID
     * set treegrid _parentId
     * @param _parentId
     */
    public void set_parentId(String _parentId) {
        this._parentId = _parentId;
    }

    /**
     * 节点状态: closed：表示有子节点。open：表示没有子节点。
     * @return
     */
    @Transient
    public String getState() {
        return state;
    }

    /**
     * 节点状态: closed：表示有子节点。open：表示没有子节点。
     * @param state
     */
    public void setState(String state) {
        this.state = state;
    }
    
    
}
