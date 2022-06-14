package com.wteam.modules.system.config;

/**
 * 用户登录类型
 *
 * @author mission
 * @since 2019/09/04 22:19
 */
public interface LoginType {

    /*超级管理*/
    int SYSTEM = 0;

    /*系统管理*/
    int ADMIN = 1;

    /*微信用户*/
    int WX = 2;

    /*微信用户*/
    int OTHER = 3;

}
