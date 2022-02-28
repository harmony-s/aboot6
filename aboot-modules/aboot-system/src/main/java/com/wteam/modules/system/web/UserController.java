/*
 * Copyright © 2019-2020  Whale Cloud, Inc. All Rights Reserved.
 *
 *  Notice: Whale Cloud Inc copyrights this specification.
 *  No part of this specification may be reproduced in any form or means,
 *  without the prior written consent of Whale Cloud Inc.
 */
package com.wteam.modules.system.web;

import cn.hutool.crypto.asymmetric.KeyType;
import cn.hutool.crypto.asymmetric.RSA;
import com.google.common.collect.Sets;
import com.wteam.annotation.Log;
import com.wteam.annotation.permission.PermissionGroup;
import com.wteam.base.BaseEntity;
import com.wteam.domain.dto.LocalStorageDTO;
import com.wteam.domain.vo.JwtUser;
import com.wteam.domain.vo.R;
import com.wteam.exception.BadRequestException;
import com.wteam.modules.system.config.LoginType;
import com.wteam.modules.system.domain.Role;
import com.wteam.modules.system.domain.User;
import com.wteam.modules.system.domain.criteria.UserQueryCriteria;
import com.wteam.modules.system.domain.dto.PasswordDTO;
import com.wteam.modules.system.domain.dto.RoleSmallDTO;
import com.wteam.modules.system.domain.vo.UserAdminVO;
import com.wteam.modules.system.service.RoleService;
import com.wteam.modules.system.service.UserService;
import com.wteam.service.LocalStorageService;
import com.wteam.utils.BeanUtil;
import com.wteam.utils.SecurityUtils;
import com.wteam.utils.StringUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 用户 控制层
 *
 * @author mission
 * @since 2019/07/12 15:00
 */
@SuppressWarnings({"rawtypes"})
@Api(value = "用户Controller", tags = {"系统：用户操作"})
@RequiredArgsConstructor
@RestController
@RequestMapping("api/user")
@PermissionGroup(value = "USER", aliasPrefix = "用户")
public class UserController {

    @Value("${rsa.private-key}")
    private String privateKey;

    private final PasswordEncoder passwordEncoder;

    private final UserService userService;

    private final LocalStorageService localStorageService;

    private final RoleService roleService;

    //    @Log("查询用户")
    @ApiOperation(value = "查询用户列表")
    @GetMapping("/page")
    @PreAuthorize("@R.check('USER:all','USER:list')")
    public R getUsers(UserQueryCriteria criteria, Pageable pageable) {
        return R.ok(userService.queryAll(criteria, pageable));
    }

    @ApiOperation(value = "个人中心:用户资料修改")
    @PostMapping("center")
    public R center(@RequestBody User resources) {
        resources.setId(SecurityUtils.getId());
        userService.updateCenter(resources);
        return R.ok();
    }

    /**
     * 修改密码
     *
     * @param resource /
     * @return /
     */
    @ApiOperation(value = "修改密码")
    @PostMapping("updatePassword")
    public R updatePassword(@RequestBody PasswordDTO resource) {
        // 密码解密
        RSA rsa = new RSA(privateKey, null);
        String oldPass = new String(rsa.decrypt(resource.getOldPass(), KeyType.PrivateKey));
        String newPass = new String(rsa.decrypt(resource.getNewPass(), KeyType.PrivateKey));
        JwtUser jwtUser = (JwtUser) SecurityUtils.getUserDetails();
        if (!passwordEncoder.matches(oldPass, jwtUser.getPassword())) {
            throw new BadRequestException("修改失败，旧密码错误");
        }
        if (passwordEncoder.matches(newPass, jwtUser.getPassword())) {
            throw new BadRequestException("新密码不能与旧密码相同");
        }
        userService.updatePass(jwtUser.getUsername(), passwordEncoder.encode(newPass));
        return R.ok();
    }

    /**
     * 修改头像
     *
     * @param file /
     * @return /
     */
    @ApiOperation(value = "修改头像")
    @PostMapping("updateAvatar")
    public R updateAvatar(@RequestParam MultipartFile file) {
        LocalStorageDTO storage = localStorageService.create(file.getName(), file);
        userService.updateAvatar(SecurityUtils.getUsername(), storage.getUrl());
        return R.ok();
    }

    /**
     * 删除用户
     *
     * @param ids /
     * @return /
     */
//    @Log("批量删除用户")
    @ApiOperation(value = "批量删除用户")
    @PostMapping(value = "del")
    @PreAuthorize("@R.check('USER:all','USER:del')")
    public R delete(@RequestBody Set<Long> ids) {
        Long currentId = SecurityUtils.getId();
        for (Long id : ids) {
            if (id.equals(currentId)) {
                throw new BadRequestException("无法删除自己");
            }
            Integer currentLevel = Collections.min(roleService.findByUsersId(currentId).stream().map(RoleSmallDTO::getLevel).collect(Collectors.toList()));
            Integer optLevel = Collections.min(roleService.findByUsersId(id).stream().map(RoleSmallDTO::getLevel).collect(Collectors.toList()));
            if (currentLevel > optLevel) {
                throw new BadRequestException("角色权限不足,无法删除" + userService.findDTOById(id).getUsername());
            }
        }
        userService.delete(ids);
        return R.ok();
    }

    //    @Log("导出用户数据")
    @ApiOperation(value = "导出用户数据")
    @GetMapping(value = "/download")
    @PreAuthorize("@R.check('USER:all','USER:list')")
    public void download(HttpServletResponse response, UserQueryCriteria criteria) throws IOException {
        userService.download(userService.queryAll(criteria), response);
    }

    @ApiOperation(value = "新增管理员")
    @PostMapping("addAdmin")
    @PreAuthorize("@R.check('USER:all','USER:add')")
    public R addAdmin(@Validated(BaseEntity.Create.class) @RequestBody UserAdminVO resources) {
        resources.setId(null);
        User user = new User();
        // 默认参数
        user.setNickname(resources.getUsername());
        user.setAvatar("");
        user.setSex(1);
        user.setLoginType(LoginType.LOGIN_ADMIN);
        user.setRoles(Sets.newHashSet(new Role(1L)));

        BeanUtil.copyPropertiesNotNull(resources, user);
        // 密码解密
        RSA rsa = new RSA(privateKey, null);
        String password = new String(rsa.decrypt(resources.getPassword(), KeyType.PrivateKey));
        // 设置密码
        user.setPassword(passwordEncoder.encode(password));
        return R.ok(userService.create(user));
    }

    @ApiOperation(value = "修改管理员")
    @PostMapping("editAdmin")
    @PreAuthorize("@R.check('USER:all','USER:edit')")
    public R editAdmin(@Validated(BaseEntity.Update.class) @RequestBody UserAdminVO resources) {
        User user = new User();
        BeanUtil.copyPropertiesNotNull(resources, user);
        if (StringUtils.isNotBlank(resources.getPassword())) {
            // 密码解密
            RSA rsa = new RSA(privateKey, null);
            String password = new String(rsa.decrypt(resources.getPassword(), KeyType.PrivateKey));
            // 设置密码
            user.setPassword(passwordEncoder.encode(password));
        }

        userService.update(user);
        return R.ok();
    }

}
