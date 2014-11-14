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
import com.bananac.common.model.SysDictionaryDetail;
import com.bananac.common.service.SysDictionaryDetailService;
import com.bananac.system.bean.Message;
import com.bananac.system.bean.Page;

/**
 *   控制器
 * @author xiaojf 294825811@qq.com
 */
@Controller
@RequestMapping("/sysDictionaryDetail")
public class SysDictionaryDetailController {
    @Resource(name="sysDictionaryDetailService")
    private SysDictionaryDetailService sysDictionaryDetailService;    //业务接口
    
    @RequestMapping("/search.html")
    public void search(SysDictionaryDetail dictionaryDetail,Page page,HttpServletRequest request,HttpServletResponse response) throws IOException{
        Message message = sysDictionaryDetailService.get(dictionaryDetail,page);
        response.getWriter().write(JSON.toJSONString(message));
    }
    
    @RequestMapping("/delete.html")
    public void delete(String ids ,HttpServletRequest request,HttpServletResponse response) throws IOException{
        Message message = sysDictionaryDetailService.delete(ids);
        response.getWriter().write(JSON.toJSONString(message));
    }
    
    @RequestMapping("/save.html")
    public void save(HttpServletRequest request,HttpServletResponse response) throws IOException{
        //String deleted = request.getParameter("deleted");
        String inserted = request.getParameter("inserted");
        String updated = request.getParameter("updated");
        
        List<SysDictionaryDetail> insertedList = JSON.parseArray(inserted, SysDictionaryDetail.class);
        List<SysDictionaryDetail> updatedList = JSON.parseArray(updated, SysDictionaryDetail.class);
        
        List<SysDictionaryDetail> list = new ArrayList<SysDictionaryDetail>();
        if(insertedList != null){
            list.addAll(insertedList);
        }
        if(updatedList != null){
            list.addAll(updatedList);
        }
        //保存或更新
        Message message = sysDictionaryDetailService.saveOrUpdate(list);
        
        response.getWriter().write(JSON.toJSONString(message));
    }
    
    @RequestMapping("/enabled.html")
    public void enabled(String ids ,HttpServletRequest request,HttpServletResponse response) throws IOException{
        Message message = sysDictionaryDetailService.enabled(ids);
        response.getWriter().write(JSON.toJSONString(message));
    }
    
    @RequestMapping("/disabled.html")
    public void disabled(String ids ,HttpServletRequest request,HttpServletResponse response) throws IOException{
        Message message = sysDictionaryDetailService.disabled(ids);
        response.getWriter().write(JSON.toJSONString(message));
    }
}