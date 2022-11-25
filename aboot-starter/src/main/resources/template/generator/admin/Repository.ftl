package ${package}.repository;

import ${package}.domain.${className};
import com.wteam.base.BaseRepository;

/**
 * ${tableComment} 存储层.
 *
 * @author ${author}
 * @since ${date}
 */
public interface ${className}Repository extends BaseRepository<${className}, ${pkColumnType}> {
<#if columns??>
    <#list columns as column>
    <#if column.columnKey = 'UNI'>
    /**
     * 根据 ${column.capitalColumnName} 查询
     *
     * @param ${column.columnName} /
     * @return /
     */
    ${className} findBy${column.capitalColumnName}(${column.columnType} ${column.columnName});
    </#if>
    </#list>
</#if>
}