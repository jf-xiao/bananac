package com.bananac.common.controller;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import com.bananac.common.service.SysDicKeyService;

/**
 *   控制器
 * @author xiaojf 294825811@qq.com
 */
@Controller
public class SysDicKeyController {
    @Resource(name="sysDicKeyService")
    private SysDicKeyService sysDicKeyService;    //业务接口
    
}