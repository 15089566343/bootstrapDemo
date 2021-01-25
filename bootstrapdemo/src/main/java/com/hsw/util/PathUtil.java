package com.hsw.util;

/**
 * @ClassName PathUtil
 * @Description TODO    上下文路径
 * @Author huangshengwen
 * @Date 2021/1/12 11:14
 * @Version 1.0
 **/

public class PathUtil {

    public PathUtil() {
    }

    public static String getBaseUrl() {
        return PropertyConfigUtil.getProperty("serverName") + "/" + PropertyConfigUtil.getProperty("contextPath");
    }

}
