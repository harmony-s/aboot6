
/*
 * Copyright © 2019-2020  Whale Cloud, Inc. All Rights Reserved.
 *
 * Notice: Whale Cloud Inc copyrights this specification.
 * No part of this specification may be reproduced in any form or means,
 *  without the prior written consent of Whale Cloud Inc.
 *
 */
package com.wteam.utils;

import cn.hutool.core.codec.Base64;
import cn.hutool.core.util.IdUtil;
import com.wteam.exception.BadRequestException;
import com.wteam.utils.enums.FileType;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.util.IOUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.wteam.utils.PathUtil.basePath;

/**
 * File工具类，扩展 hutool 工具包
 *
 * @author mission
 * @since 2020-12-27
 */
@Slf4j
public class FileUtil extends cn.hutool.core.io.FileUtil {
    /**
     * 系统临时目录
     * <br>
     * windows 包含路径分割符，但Linux 不包含,
     * 在windows \\==\ 前提下，
     * 为安全起见 同意拼装 路径分割符，
     * <pre>
     *       java.io.tmpdir
     *       windows : C:\Users\xxx\AppData\Local\Temp\
     *       linux: /temp
     * </pre>
     */
    public static final String SYS_TEM_DIR = System.getProperty("java.io.tmpdir") + File.separator;
    /**
     * 定义GB的计算常量
     */
    private static final int GB = 1024 * 1024 * 1024;
    /**
     * 定义MB的计算常量
     */
    private static final int MB = 1024 * 1024;
    /**
     * 定义KB的计算常量
     */
    private static final int KB = 1024;

    /**
     * 格式化小数
     */
    private static final DecimalFormat DF = new DecimalFormat("0.00");

    /**
     * MultipartFile转File
     */
    public static File toFile(MultipartFile multipartFile) {
        // 获取文件名
        String fileName = multipartFile.getOriginalFilename();
        // 获取文件后缀
        String prefix = "." + getExtensionName(fileName);
        File file = null;
        try {
            // 用uuid作为文件名，防止生成的临时文件重复
            file = File.createTempFile(IdUtil.simpleUUID(), prefix);
            // MultipartFile to File
            multipartFile.transferTo(file);
        } catch (IOException e) {
            log.error(e.getMessage(), e);
        }
        return file;
    }

    /**
     * 获取文件扩展名，不带 .
     */
    public static String getExtensionName(String filename) {
        if ((filename != null) && (filename.length() > 0)) {
            int dot = filename.lastIndexOf('.');
            if ((dot > -1) && (dot < (filename.length() - 1))) {
                return filename.substring(dot + 1);
            }
        }
        return filename;
    }

    /**
     * Java文件操作 获取不带扩展名的文件名
     */
    public static String getFileNameNoEx(String filename) {
        if ((filename != null) && (filename.length() > 0)) {
            int dot = filename.lastIndexOf('.');
            if ((dot > -1) && (dot < (filename.length()))) {
                // 剔除url特殊字符,避免浏览器访问时错误解析,造成访问不到的错误
                filename = filename
                        .substring(0, dot)
                        .replaceAll("\\.","")
                        .replaceAll("#", "")
                        .replaceAll("-", "")
                        .replaceAll("\\[", "")
                        .replaceAll("\\]", "")
                        .replaceAll(" ", "")
                        .replaceAll("\"", "")
                        .replaceAll("\\'", "")
                        .replaceAll("<", "")
                        .replaceAll(">", "")
                        .replaceAll("%", "")
                        .replaceAll("\\{", "")
                        .replaceAll("\\}", "")
                        .replaceAll("\\|", "")
                        .replaceAll("\\^", "")
                        .replaceAll("&", "")
                        .replaceAll("\\(", "")
                        .replaceAll("\\)", "")
                        .replaceAll("\\+", "")
                        .replaceAll(",", "")
                        .replaceAll("/", "")
                        .replaceAll(":", "")
                        .replaceAll(";", "")
                        .replaceAll("=", "")
                        .replaceAll("\\?", "")
                        .replaceAll("@", "");
                return filename.length() > 20 ? filename.substring(0, 20) : filename;
            }
        }
        if (filename == null) {
            filename = "";
        }
        return filename;
    }

    /**
     * 文件大小转换
     */
    public static String getSize(long size) {
        String resultSize;
        if (size / GB >= 1) {
            //如果当前Byte的值大于等于1GB
            resultSize = DF.format(size / (float) GB) + "GB   ";
        } else if (size / MB >= 1) {
            //如果当前Byte的值大于等于1MB
            resultSize = DF.format(size / (float) MB) + "MB   ";
        } else if (size / KB >= 1) {
            //如果当前Byte的值大于等于1KB
            resultSize = DF.format(size / (float) KB) + "KB   ";
        } else {
            resultSize = size + "B   ";
        }
        return resultSize;
    }

    /**
     * inputStream 转 File
     */
    static File inputStreamToFile(InputStream ins, String name) throws Exception {
        File file = new File(SYS_TEM_DIR + name);
        if (file.exists()) {
            return file;
        }
        OutputStream os = new FileOutputStream(file);
        int bytesRead;
        int len = 8192;
        byte[] buffer = new byte[len];
        while ((bytesRead = ins.read(buffer, 0, len)) != -1) {
            os.write(buffer, 0, bytesRead);
        }
        os.close();
        ins.close();
        return file;
    }

    /**
     * 将文件名解析成文件的上传路径
     * 去除违规字符
     */
    public static File upload(MultipartFile file, String filePath) {
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssS");
        String name = getFileNameNoEx(file.getOriginalFilename());
        // 去除违规字符: "."," ","#"
        name = name.replaceAll("\\.", "")
                .replaceAll(" ", "")
                .replaceAll("#", "");
        String suffix = getExtensionName(file.getOriginalFilename());
        String nowStr = "-" + format.format(date);
        try {
            String fileName = name + nowStr + "." + suffix;
            String path = filePath + fileName;
            // getCanonicalFile 可解析正确各种路径
            File dest = new File(path).getCanonicalFile();
            // 检测是否存在目录
            if (!dest.getParentFile().exists()) {
                if (!dest.getParentFile().mkdirs()) {
                    System.out.println("was not successful.");
                }
            }
            // 文件写入
            file.transferTo(dest);
            return dest;
        } catch (Exception e) {
            log.error("[上传失败]" + e.getMessage(), e);
        }
        return null;
    }

    /**
     * 转成Base64
     */
    public static String fileToBase64(File file) throws Exception {
        FileInputStream inputFile = new FileInputStream(file);
        String base64 = null;
        byte[] buffer = new byte[(int) file.length()];
        inputFile.read(buffer);
        inputFile.close();
        base64 = Base64.encode(buffer);
        return base64.replaceAll("[\\s*\t\n\r]", "");
    }

    /**
     * 获取类型
     */
    public static String getFileType(String type) {
        String documents = "txt doc pdf ppt pps xlsx xls docx";
        String music = "mp3 wav wma mpa ram ra aac aif m4a";
        String video = "avi mpg mpe mpeg asf wmv mov qt rm mp4 flv m4v webm ogv ogg";
        String image = "bmp dib pcp dif wmf gif jpg tif eps psd cdr iff tga pcd mpt png jpeg";
        if (image.contains(type)) {
            return "pictures";
        } else if (documents.contains(type)) {
            return "documents";
        } else if (music.contains(type)) {
            return "music";
        } else if (video.contains(type)) {
            return "video";
        } else {
            return "other";
        }
    }

    /**
     * 获取文件类型
     */
    public static String getFileTypeByMimeType(String type) {
        String mimeType = new MimetypesFileTypeMap().getContentType("." + type);
        return mimeType.split("/")[0];
    }

    /**
     * 大小限制
     */
    public static void checkSize(long maxSize, long size) {
        // 1M
        int len = 1024 * 1024;
        if (size > (maxSize * len)) {
            throw new BadRequestException("文件超出规定大小");
        }
    }

    /**
     * 判断两个文件是否相同
     */
    public static boolean check(File file1, File file2) {
        String img1Md5 = getMd5(file1);
        String img2Md5 = getMd5(file2);
        return img1Md5.equals(img2Md5);
    }

    /**
     * 判断两个文件是否相同
     */
    public static boolean check(String file1Md5, String file2Md5) {
        return file1Md5.equals(file2Md5);
    }

    private static byte[] getByte(File file) {
        // 得到文件长度
        byte[] b = new byte[(int) file.length()];
        try (InputStream in = new FileInputStream(file)) {

            System.out.println(in.read(b));
        } catch (IOException e) {
            log.error(e.getMessage(), e);
            return null;
        }
        return b;
    }

    private static byte[] getByte(MultipartFile multipartFile) {
        // 得到文件长度
        byte[] b = new byte[4096];
        try (InputStream in = multipartFile.getInputStream()) {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            int len = 0;
            while ((len = in.read(b)) != -1) {
                md5.update(b, 0, len);
            }
            return md5.digest();
        } catch (IOException | NoSuchAlgorithmException e) {
            log.error(e.getMessage(), e);
            return null;
        }
    }


    private static String getMd5(byte[] bytes) {
        // 16进制字符
        char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
        try {
            MessageDigest mdTemp = MessageDigest.getInstance("MD5");
            mdTemp.update(bytes);
            byte[] md = mdTemp.digest();
            int j = md.length;
            char[] str = new char[j * 2];
            int k = 0;
            // 移位 输出字符串
            for (byte byte0 : md) {
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
        }
        return null;
    }

    /**
     * 下载文件
     *
     * @param request  /
     * @param response /
     * @param file     /
     */
    public static void downloadFile(HttpServletRequest request, HttpServletResponse response, File file, boolean deleteOnExit) {
        response.setCharacterEncoding(request.getCharacterEncoding());
        response.setContentType("application/octet-stream");
        FileInputStream fis = null;
        try {
            fis = new FileInputStream(file);
            response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
            IOUtils.copy(fis, response.getOutputStream());
            response.flushBuffer();
        } catch (Exception e) {
            log.error("[下载失败]" + e.getMessage(), e);
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                    if (deleteOnExit) {
                        file.deleteOnExit();
                    }
                } catch (IOException e) {
                    log.error("[下载时,关闭IO流异常]" + e.getMessage(), e);
                }
            }
        }
    }


    public static String getMd5(File file) {
        return getMd5(getByte(file));
    }

    /**
     * 保存文件及获取文件MD5值和SHA1值
     *
     * @param multipartFile MultipartFile对象
     */
    public static String getMd5(MultipartFile multipartFile) {
        return getMd5(getByte(multipartFile));
    }


    /**
     * 删除文件
     */
    public static void deleteFile(File... files) {
        for (File file : files) {
            if (file.exists()) {
                file.deleteOnExit();
            }
        }
    }

    /**
     * 如果需要
     * 创建目标路径,调用此方法
     *
     * @param storePath 相对路径
     */
    public static void makeDirPath(String storePath) {
        String realFileParentPath = basePath().concat(storePath);
        File dirPath = new File(realFileParentPath);
        if (!dirPath.exists()) {
            dirPath.mkdirs();
        }
    }

    /**
     * 删除文件
     * storePath是文件的路径还是目录的路径
     * 如果是storePath是文件路径则删除该文件,
     * 如果是storePath是目录路径则删除该目录下的所有文件
     *
     * @param storePath 相对路径
     */
    public static void deleteFileOrPath(String storePath) {
        String absolutePath = basePath() + storePath;
        deleteFileOrPathByAbsolute(absolutePath);
    }

    /**
     * 删除文件
     * absolutePath是文件的路径还是目录的路径
     * 如果是absolutePath是文件路径则删除该文件,
     * 如果是absolutePath是目录路径则删除该目录下的所有文件
     *
     * @param absolutePath 绝对路径
     */
    public static void deleteFileOrPathByAbsolute(String absolutePath) {
        File fileOrPath = new File(absolutePath);
        if (fileOrPath.exists()) {
            if (fileOrPath.isDirectory()) {
                try {
                    File[] files = fileOrPath.listFiles();
                    for (int i = 0; i < (files != null ? files.length : 0); i++) {
                        deleteFileOrPathByAbsolute(files[i].getAbsolutePath());
                    }
                } catch (IOError e) {
                    log.error("[文件删除失败]" + e.getMessage(), e);
                }
            }
            fileOrPath.delete();
        }
    }

    /**
     * 转换成16进制字符串
     *
     * @param src 原生byte
     * @return 16进制字符串
     */
    private static String bytesToHexString(byte[] src) {

        StringBuilder stringBuilder = new StringBuilder();
        if (src == null || src.length <= 0) {
            return null;
        }
        for (int i = 0; i < src.length; i++) {
            int v = src[i] & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString();
    }

    /**
     * 得到文件头
     *
     * @param is 文件路径
     * @return 文件头
     * @throws IOException /
     */
    private static String getFileContent(InputStream is) throws IOException {

        byte[] b = new byte[28];

        InputStream inputStream = null;

        try {
            is.read(b, 0, 28);
        } catch (IOException e) {
            e.printStackTrace();
            throw e;
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    throw e;
                }
            }
        }
        return bytesToHexString(b);
    }

    /**
     * 获得文件类型
     *
     * @param is 文件
     * @return 文件类型
     */
    public static FileType getFileType(InputStream is) throws IOException {

        String fileHead = getFileContent(is);
        if (fileHead == null || fileHead.length() == 0) {
            return null;
        }
        fileHead = fileHead.toUpperCase();
        FileType[] fileTypes = FileType.values();

        for (FileType type : fileTypes) {
            if (fileHead.startsWith(type.getValue())) {
                return type;
            }
        }

        return null;
    }
}
