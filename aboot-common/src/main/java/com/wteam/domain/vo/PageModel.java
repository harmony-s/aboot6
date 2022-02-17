package com.wteam.domain.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * @author charles
 * @since 2021/7/16 21:36
 */

@Data
@ApiModel(value = "分页对象", description = "分页对象")
public class PageModel<T> implements Serializable {


    /**
     * 分页数据
     */
    @ApiModelProperty(value = "分页数据")
    private List<T> content;

    /**
     * 额外数据
     */
    @ApiModelProperty("额外数据")
    private Map<String, Object> extra;

    /**
     * 总条数
     */
    @ApiModelProperty(value = "总条数")
    private Long totalElements;

    public PageModel() {
    }

    public PageModel(List<T> content, Long totalElements) {
        this.content = content;
        this.totalElements = totalElements;
    }

    public PageModel(Page<T> page) {
        this.content = page.getContent();
        this.totalElements = page.getTotalElements();
    }

    public PageModel(Page<T> page, Map<String, Object> extra) {
        this.content = page.getContent();
        this.totalElements = page.getTotalElements();
        this.extra = extra;
    }

    public static <T> PageModel<T> toPage(Page<T> page) {
        return new PageModel<>(page);
    }

    public static <T> PageModel<T> toPage(Page<T> page, Map<String, Object> extra) {
        return new PageModel<>(page, extra);
    }
}
