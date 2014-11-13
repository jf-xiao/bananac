package com.bananac.common.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.bananac.common.model.SysDictionary;
import com.bananac.common.service.SysDictionaryService;
import com.bananac.system.bean.Message;
import com.bananac.system.bean.Page;

/**
 *   控制器
 * @author xiaojf 294825811@qq.com
 */
@Controller
@RequestMapping("/sysDictionary")
public class SysDictionaryController {
    @Resource(name="sysDictionaryService")
    private SysDictionaryService sysDictionaryService;    //业务接口
    
    @RequestMapping("/search.html")
    public void search(SysDictionary dictionary,Page page,HttpServletRequest request,HttpServletResponse response) throws IOException{
        Message message = sysDictionaryService.get(dictionary,page);
        response.getWriter().write(JSON.toJSONString(message));
    }
    
    @RequestMapping("/delete.html")
    public void delete(String ids ,HttpServletRequest request,HttpServletResponse response) throws IOException{
        Message message = sysDictionaryService.delete(ids);
        response.getWriter().write(JSON.toJSONString(message));
    }
    
    @RequestMapping("/save.html")
    public void save(HttpServletRequest request,HttpServletResponse response) throws IOException{
        //String deleted = request.getParameter("deleted");
        String inserted = request.getParameter("inserted");
        String updated = request.getParameter("updated");
        
        List<SysDictionary> insertedList = JSON.parseArray(inserted, SysDictionary.class);
        List<SysDictionary> updatedList = JSON.parseArray(updated, SysDictionary.class);
        
        List<SysDictionary> list = new ArrayList<SysDictionary>();
        if(insertedList != null){
            list.addAll(insertedList);
        }
        if(updatedList != null){
            list.addAll(updatedList);
        }
        //保存或更新
        Message message = sysDictionaryService.saveOrUpdate(list);
        
        response.getWriter().write(JSON.toJSONString(message));
    }
    
    @RequestMapping("/enabled.html")
    public void enabled(String ids ,HttpServletRequest request,HttpServletResponse response) throws IOException{
        Message message = sysDictionaryService.enabled(ids);
        response.getWriter().write(JSON.toJSONString(message));
    }
    
    @RequestMapping("/disabled.html")
    public void disabled(String ids ,HttpServletRequest request,HttpServletResponse response) throws IOException{
        Message message = sysDictionaryService.disabled(ids);
        response.getWriter().write(JSON.toJSONString(message));
    }

}