package com.wteam.modules.system.domain.criteria;

import com.wteam.annotation.Query;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * @author mission
 * @since 2019/07/08 19:57
 */
@Data
public class UserQueryCriteria implements Serializable {

    @ApiModelProperty("用户编号, 无需传入")
    @Query
    private Long id;

    @ApiModelProperty("登录类型")
    @Query
    private Integer loginType;

    @ApiModelProperty("用户名, 按用户名模糊查询")
    @Query(type = Query.Type.INNER_LIKE)
    private String username;

    @ApiModelProperty("昵称")
    @Query(type = Query.Type.INNER_LIKE)
    private String nickname;

    @ApiModelProperty("性别")
    @Query(type = Query.Type.EQUAL)
    private Integer sex;

    @ApiModelProperty("电话")
    @Query(type = Query.Type.INNER_LIKE)
    private String phone;

    @ApiModelProperty("状态, true 激活, false 锁定")
    @Query
    private Boolean enabled;

    @ApiModelProperty("不包含查询: 角色id")
    @Query(type = Query.Type.NOT_IN, propName = "id", joinName = "roles")
    private List<Long> roleIdNotIn;

    @ApiModelProperty("包含查询: 角色id")
    @Query(type = Query.Type.IN, propName = "id", joinName = "roles")
    private List<Long> roleIdIn;
}
