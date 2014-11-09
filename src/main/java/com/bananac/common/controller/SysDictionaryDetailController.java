package com.bananac.common.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import com.bananac.common.service.SysDictionaryDetailService;

/**
 *   控制器
 * @author xiaojf 294825811@qq.com
 */
@Controller
public class SysDictionaryDetailController {
    @Resource(name="sysDictionaryDetailService")
    private SysDictionaryDetailService sysDictionaryDetailService;    //业务接口
    
}