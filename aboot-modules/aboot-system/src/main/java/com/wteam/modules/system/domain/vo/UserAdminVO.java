package com.wteam.modules.system.domain.vo;

import com.wteam.base.BaseEntity;
import com.wteam.modules.system.domain.Role;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.Set;

/**
 * @author code2263
 * @since 2022-02-22
 */
@Data
public class UserAdminVO {

    @NotNull(groups = BaseEntity.Update.class)
    private Long id;

    @NotBlank(groups = BaseEntity.Create.class)
    private String username;

    @NotBlank(groups = BaseEntity.Create.class)
    private String password;

    private Boolean enabled;

//    private String nickname;

//    private String avatar;

//    private Integer sex;

//    @Pattern(regexp = "([a-z0-9A-Z]+[-|.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}", message = "格式错误")
//    private String email;

//    private String phone;

//    private Integer loginType;

//    private Set<Role> roles;

}
