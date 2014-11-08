package com.bananac.common.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import com.bananac.common.service.SysDicValueService;

/**
 *   控制器
 * @author xiaojf 294825811@qq.com
 */
@Controller
public class SysDicValueController {
    @Resource(name="sysDicValueService")
    private SysDicValueService sysDicValueService;    //业务接口
    
}