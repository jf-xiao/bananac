package com.bananac.common.service.test;

import java.util.UUID;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bananac.common.model.SysDicKey;
import com.bananac.common.service.SysDicKeyService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml","classpath:applicationContext-beans.xml","classpath:applicationContext-jdbc.xml","classpath:applicationContext-mvc.xml"})
public class SysDicKeyServiceTest {
    
    @Resource(name ="sysDicKeyService")
    private SysDicKeyService sysDicKeyService;

    @Test
    public void test() {
        SysDicKey model = new SysDicKey();
        model.setDicKeyId(UUID.randomUUID().toString());
        model.setName("测试");
        model.setSign("test");
        sysDicKeyService.add(model);
    }

}
