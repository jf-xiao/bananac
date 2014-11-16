package com.bananac.system.util;

/**
 * 字符串工具类
 * @author xiaojf 294825811@qq.com
 */
public class StringUtil {
    /**
     * 为null或 ""
     * true 为null或 "",false不为null或 ""
     * @param str 字符串
     * @return
     */
    public static boolean isNullOrEmpty(String str){
        if(str == null || "".equals(str)){
            return true;
        }
        return false;
    }
}
