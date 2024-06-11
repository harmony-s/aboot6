package ${package}.domain.dto;

import lombok.Data;
<#if hasTimestamp || hasLocalDate || hasLocalDateTime>
import java.time.*;
</#if>
<#if hasBigDecimal>
import java.math.BigDecimal;
</#if>
import java.io.Serializable;
<#if !auto && pkColumnType = 'Long'>
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
</#if>
import io.swagger.annotations.ApiModelProperty;

/**
 * ${tableComment} DTO类.
 *
 * @author ${author}
 * @since ${date}
 */
@Data
public class ${className}DTO implements Serializable {

<#if columns??>
    <#list columns as column>
    <#if
    column.changeColumnName = 'deletedAt'||
    column.changeColumnName = 'updatedAt'||
    column.changeColumnName = 'updatedBy'||
    column.changeColumnName = 'createdBy'><#else>
    <#if column.remark != ''>

    /** ${column.remark} */
    @ApiModelProperty("${column.remark}")
    </#if>
    <#if column.columnKey = 'PRI'>
    <#if !auto && pkColumnType = 'Long'>
    /**
     * 防止精度丢失
     */
    @JsonSerialize(using = ToStringSerializer.class)
    </#if>
    </#if>
    private ${column.columnType} ${column.changeColumnName};
    </#if>
    </#list>
</#if>
}