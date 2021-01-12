package com.hsw.util;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import java.util.Properties;

/**
 * @ClassName PropertyConfigUtil
 * @Description TODO    读取配置文件工具类
 * @Author huangshengwen
 * @Date 2021/1/12 11:11
 * @Version 1.0
 **/

public class PropertyConfigUtil extends PropertyPlaceholderConfigurer {

    /**
     * aes加密的key
     */
    public static final String key = "e4ecef27c69bfbd0";

    /**
     * 用来标记已经被加密的配置信息的前缀，以数字开头防止冲突
     */
    public static final String prefix = "4J.";

    private static Properties properties = new Properties();

    private AesUtil util = AesUtil.getInstance();

    /**
     * @description 父类的该方法将配置信息条给beanFactory，在之前解密，并初始化properties
     *
     * @param beanFactory
     * @param props
     * @throws BeansException
     */
    @Override
    protected void processProperties(ConfigurableListableBeanFactory beanFactory, Properties props) throws BeansException {
        for (Object propertyName : props.keySet()) {
            String prop = props.getProperty((String) propertyName);
            if (((String) propertyName).startsWith(prefix)) {
                propertyName = ((String) propertyName).substring(prefix.length());// XXX
                // 去掉前缀
                prop = util.decrypt(prop, key);
            }
            properties.put(propertyName, prop);
        }
        super.processProperties(beanFactory, properties);
    }

    /**
     * @Description 读取配置文件信息
     * @param key
     * @return
     */
    public static String getProperty(String key) {
        if (properties.getProperty(key) == null)
            //防止有人不小心照着配置文件取带前缀的。
            return properties.getProperty(key.substring(prefix.length()));
        return properties.getProperty(key);
    }
}
