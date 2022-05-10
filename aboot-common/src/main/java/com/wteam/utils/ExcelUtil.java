package com.wteam.utils;

import cn.hutool.core.io.IoUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.util.CollectionUtils;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * @author code2263
 * @since 2022-02-11
 */
@Slf4j
public class ExcelUtil {

    /**
     * 导出excel
     */
    public static void downloadExcel(List<Map<String, Object>> list, HttpServletResponse response) throws IOException {
        // 声明一个工作薄
        XSSFWorkbook workbook = new XSSFWorkbook();
        // 生成一个表格
        XSSFSheet sheet = workbook.createSheet();
        //冻结表头
        sheet.createFreezePane(0, 1, 0, 1);
        //创建单元格样式对象
        XSSFCellStyle cellStyle = workbook.createCellStyle();
        //添加常用样式
        cellStyle.setWrapText(true);//设置自动换行
        //设置单元格背景色
        cellStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        cellStyle.setBorderBottom(BorderStyle.THIN);
        cellStyle.setBorderLeft(BorderStyle.THIN);
        cellStyle.setBorderRight(BorderStyle.THIN);
        cellStyle.setBorderTop(BorderStyle.THIN);
        cellStyle.setAlignment(HorizontalAlignment.CENTER);
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);

        write2Sheet(sheet, list, cellStyle, null, 0, 0, null);
        //response为HttpServletResponse对象
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        //file.xls是弹出下载对话框的文件名，不能为中文，中文请自行编码
        response.setHeader("Content-Disposition", "attachment;filename=file.xlsx");
        ServletOutputStream out = response.getOutputStream();
        // 终止后删除临时文件
        workbook.write(out);
        //此处记得关闭输出Servlet流
        workbook.close();
        IoUtil.close(out);
    }

    public static void write2Sheet(XSSFSheet sheet,
                                   List<Map<String, Object>> list,
                                   XSSFCellStyle titleCellStyle,
                                   XSSFCellStyle contentCellStyle,
                                   int firstRow,
                                   int firstColumn,
                                   String pattern) {
        if (CollectionUtils.isEmpty(list)) {
            return;
        }
        //时间格式默认"yyyy-MM-dd"
        if (StringUtils.isEmpty(pattern)) {
            pattern = "yyyy-MM-dd HH:mm:ss";
        }
        // 产生表格标题行
        XSSFRow row = sheet.getRow(firstRow);
        if (row == null) {
            row = sheet.createRow(firstRow);
        }
        Set<String> keys = list.get(0).keySet();
        Iterator<String> it1 = keys.iterator();
        int c = firstColumn;   //标题列数
        while (it1.hasNext()) {
            XSSFCell cell = row.createCell(c);
            XSSFRichTextString text = new XSSFRichTextString(it1.next());
            cell.setCellStyle(titleCellStyle);
            cell.setCellValue(text);
            c++;
        }
        // 遍历集合数据，产生数据行
        Iterator<Map<String, Object>> it = list.iterator();
        int index = firstRow;
        while (it.hasNext()) {
            index++;
            row = sheet.getRow(index);
            if (row == null) {
                row = sheet.createRow(index);
            }
            Map<String, Object> map = it.next();
            try {
                int cellNum = firstColumn;
                //遍历列名
                for (String key : keys) {

                    if (!keys.contains(key)) {
                        log.error("Map 中 不存在 key [" + key + "]");
                        continue;
                    }
                    Object value = map.get(key);
                    XSSFCell cell = row.createCell(cellNum);
                    if (contentCellStyle != null) {
                        cell.setCellStyle(contentCellStyle);
                    }
                    String textValue = null;
                    if (value instanceof Integer) {
                        int intValue = (Integer) value;
                        cell.setCellValue(intValue);
                    } else if (value instanceof Float) {
                        float fValue = (Float) value;
                        cell.setCellValue(fValue);
                    } else if (value instanceof Double) {
                        double dValue = (Double) value;
                        cell.setCellValue(dValue);
                    } else if (value instanceof Long) {
                        long longValue = (Long) value;
                        cell.setCellValue(longValue);
                    } else if (value instanceof Boolean) {
                        boolean bValue = (Boolean) value;
                        cell.setCellValue(bValue);
                    } else if (value instanceof Date) {
                        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
                        textValue = sdf.format(value);
                    } else if (value instanceof LocalDateTime) {
                        LocalDateTime ldValue = (LocalDateTime) value;
                        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                        textValue = ldValue.format(dtf);
                    } else if (value instanceof LocalDate) {
                        LocalDate ldValue = (LocalDate) value;
                        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                        textValue = ldValue.format(dtf);
                    } else if (value instanceof String[]) {
                        String[] strArr = (String[]) value;
                        for (int j = 0; j < strArr.length; j++) {
                            String str = strArr[j];
                            cell.setCellValue(str);
                            if (j != strArr.length - 1) {
                                cellNum++;
                                cell = row.createCell(cellNum);
                            }
                        }
                    } else if (value instanceof Double[]) {
                        Double[] douArr = (Double[]) value;
                        for (int j = 0; j < douArr.length; j++) {
                            Double val = douArr[j];
                            // 值不为空则set Value
                            if (val != null) {
                                cell.setCellValue(val);
                            }

                            if (j != douArr.length - 1) {
                                cellNum++;
                                cell = row.createCell(cellNum);
                            }
                        }
                    } else {
                        // 其它数据类型都当作字符串简单处理
                        textValue = value == null ? StringUtils.EMPTY : value.toString();
                    }
                    if (textValue != null) {
                        XSSFRichTextString richString = new XSSFRichTextString(textValue);
                        cell.setCellValue(richString);
                    }
                    cellNum++;
                }
            } catch (Exception e) {
                log.error(e.toString(), e);
            }
        }
        // 设定自动宽度
        setSizeColumn(sheet, firstRow, keys.size());
    }

    /**
     * 自适应宽度(中文支持)
     */
    private static void setSizeColumn(XSSFSheet sheet, int firstRow, int rowsSize) {
        for (int columnNum = 0; columnNum <= rowsSize; columnNum++) {
            int columnWidth = sheet.getColumnWidth(columnNum) / 256;
            for (int rowNum = firstRow; rowNum < sheet.getLastRowNum(); rowNum++) {
                XSSFRow currentRow;
                //当前行未被使用过
                if (sheet.getRow(rowNum) == null) {
                    currentRow = sheet.createRow(rowNum);
                } else {
                    currentRow = sheet.getRow(rowNum);
                }
                if (currentRow.getCell(columnNum) != null) {
                    XSSFCell currentCell = currentRow.getCell(columnNum);
                    if (currentCell.getCellTypeEnum().equals(CellType.STRING)) {
                        int length = currentCell.getStringCellValue().getBytes().length;
                        if (columnWidth < length) {
                            columnWidth = length;
                        }
                    }
                }
            }
            sheet.setColumnWidth(columnNum, columnWidth < 100 ? columnWidth * 256 : 100 * 256);
        }
    }

}
