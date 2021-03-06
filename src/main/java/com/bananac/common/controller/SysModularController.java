package com.bananac.common.controller;

import java.beans.IntrospectionException;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.bananac.common.model.SysModular;
import com.bananac.common.service.SysModularService;
import com.bananac.system.bean.Message;
import com.bananac.system.bean.Page;

/**
 * 模块管理控制器
 * @author xiaojf 294825811@qq.com
 */
@Controller
@RequestMapping("/sysModular")
public class SysModularController {
    @Resource(name="sysModularService")
    private SysModularService sysModularService;    //业务接口
    
    @RequestMapping("/search.html")
    public void search(SysModular sysModular ,Page page,HttpServletRequest request,HttpServletResponse response) throws IOException, IntrospectionException, IllegalAccessException, InvocationTargetException{
        Message message = sysModularService.get(sysModular,page);
        response.getWriter().write(JSON.toJSONString(message));
    }
    
    @RequestMapping("/add.html")
    public void search(SysModular sysModular ,HttpServletRequest request,HttpServletResponse response) throws IOException, IntrospectionException, IllegalAccessException, InvocationTargetException{
        Message message = sysModularService.save(sysModular);
        response.getWriter().write(JSON.toJSONString(message));
    }
    
    @RequestMapping("/delete.html")
    public void delete(String ids ,HttpServletRequest request,HttpServletResponse response) throws IOException{
        Message message = sysModularService.delete(ids);
        response.getWriter().write(JSON.toJSONString(message));
    }
    
    @RequestMapping("/enabled.html")
    public void enabled(String ids ,HttpServletRequest request,HttpServletResponse response) throws IOException{
        Message message = sysModularService.enabled(ids);
        response.getWriter().write(JSON.toJSONString(message));
    }
    
    @RequestMapping("/disabled.html")
    public void disabled(String ids ,HttpServletRequest request,HttpServletResponse response) throws IOException{
        Message message = sysModularService.disabled(ids);
        response.getWriter().write(JSON.toJSONString(message));
    }
}