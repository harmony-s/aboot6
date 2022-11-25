package ${package}.domain.criteria;

import lombok.Data;
<#if hasTimestamp || hasLocalDate || hasLocalTime || hasLocalDateTime>
import java.time.*;
</#if>
<#if hasBigDecimal>
import java.math.BigDecimal;
</#if>
<#if queryColumns??>
import com.wteam.annotation.Query;
</#if>
<#if betweens??>
import java.util.List;
</#if>
import io.swagger.annotations.ApiParam;

/**
 * ${tableComment} 搜索类.
 *
 * @author ${author}
 * @since ${date}
 */
@Data
public class ${className}QueryCriteria {
<#if queryColumns??>
    <#list queryColumns as column>
    <#if column.queryType = '='>

    /**
     * 等于查询: ${column.remark}
     */
    @ApiParam("精确查询: ${column.remark}")
    @Query
    private ${column.columnType} ${column.changeColumnName};
    </#if>
    <#if column.queryType = 'Like'>

    /**
     * 模糊查询: ${column.remark}
     */
    @ApiParam("模糊查询: ${column.remark}")
    @Query(type = Query.Type.INNER_LIKE)
    private ${column.columnType} ${column.changeColumnName};
    </#if>
    <#if column.queryType = '!='>

    /**
     * 不等于查询: ${column.remark}
     */
    @ApiParam("精确不等于查询: ${column.remark}")
    @Query(type = Query.Type.NOT_EQUAL)
    private ${column.columnType} ${column.changeColumnName};
    </#if>
    <#if column.queryType = 'NotNull'>

    /**
     * 不为NULL查询: ${column.remark}
     */
    @ApiParam("不为空查询: ${column.remark}")
    @Query(type = Query.Type.NOT_NULL)
    private ${column.columnType} ${column.changeColumnName};
    </#if>
    <#if column.queryType = '>='>

    /**
     * 大于等于查询: ${column.remark}
     */
    @ApiParam("大于等于查询: ${column.remark}")
    @Query(type = Query.Type.GREATER_THAN)
    private ${column.columnType} ${column.changeColumnName};
    </#if>
    <#if column.queryType = '<='>

    /**
     * 小于等于查询: ${column.remark}
     */
    @ApiParam("小于等于查询: ${column.remark}")
    @Query(type = Query.Type.LESS_THAN)
    private ${column.columnType} ${column.changeColumnName};
    </#if>
    </#list>
</#if>
<#if betweens??>
    <#list betweens as column>

    /**
     * 大于等于查询: ${column.remark}
     */
    @ApiParam("大于等于查询: ${column.remark}")
    @Query(propName = "${column.changeColumnName}", type = Query.Type.GREATER_THAN)
    private ${column.columnType} ${column.capitalColumnName}Great;

    /**
     * 小于等于查询: ${column.remark}
     */
    @ApiParam("小于等于查询: ${column.remark}")
    @Query(propName = "${column.changeColumnName}", type = Query.Type.LESS_THAN)
    private ${column.columnType} ${column.capitalColumnName}Less;
    </#list>
</#if>
}