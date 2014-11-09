package com.bananac.common.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bananac.common.model.SysDictionary;
import com.bananac.common.service.SysDictionaryService;

/**
 *   控制器
 * @author xiaojf 294825811@qq.com
 */
@Controller
public class SysDictionaryController {
    @Resource(name="sysDictionaryService")
    private SysDictionaryService sysDictionaryService;    //业务接口
    
    @RequestMapping("/add.html")
    public void add(SysDictionary dictionary,HttpServletRequest request,HttpServletResponse response){
        System.out.println(dictionary);
    }
}