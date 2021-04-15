package com.hsw.bootstrap.controller;

import cn.hutool.core.date.DateUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.hsw.bootstrap.dao.BootstrapDao;
import com.hsw.bootstrap.data.QueryMaterialData;
import com.hsw.bootstrap.entity.File;
import com.hsw.util.Base64TopdfUtil;
import com.hsw.util.GetIpAndPort;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.*;

/**
 * @ClassName BootstrapController
 * @Description TODO    相关控制器
 * @Author huangshengwen
 * @Date 2021/1/12 15:15
 * @Version 1.0
 **/
@Controller
@RequestMapping("/bootstrap")
public class BootstrapController {

    private Logger logger = LoggerFactory.getLogger(BootstrapController.class);

    @Autowired
    private BootstrapDao bootstrapDao;

    @RequestMapping("/upload")
    public String index(Map<String, Object> map) {
        JSONArray jsonArray = JSON.parseArray(new QueryMaterialData().getData());
        map.put("queryMaterialList", jsonArray);
        return "service/bootstrap/upload_download";
    }

    @RequestMapping(value = "/uploadFile.json", headers = "content-type=multipart/*")
    @ResponseBody
    public Map<String, Object> uploadFile(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "file", required = false) MultipartFile file) {
        Map<String, Object> jsonMap = new HashMap<String, Object>();
        try {
            MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
            MultipartFile multipartFile = multipartRequest.getFile("file");// 与前端设置的属性值一致
            String fileName = multipartFile.getOriginalFilename();
            String fileUUID = UUID.randomUUID().toString();// 文件名称
            InputStream inputStream = null;
            try {
                inputStream = multipartFile.getInputStream();
                byte[] bytes = FileCopyUtils.copyToByteArray(inputStream);
                String base64 = Base64.getEncoder().encodeToString(bytes);
                File file1 = new File();
                file1.setImgId(fileUUID);
                file1.setImgName(fileName);
                file1.setCreateTime(DateUtil.date().toString());
                String fileId = UUID.randomUUID().toString().replaceAll("-", "");
                file1.setSingleId(fileId);
                file1.setImgBase64(base64);
                bootstrapDao.saveFile(file1);
                jsonMap.put("flag", true);
                jsonMap.put("fileId", fileId);
                response.setContentType("application/octet-stream");
                response.addHeader("Content-Disposition", "attachment;fileId=" + fileId);
            } catch (MalformedURLException e) {
                e.printStackTrace();
            }
        } catch (Exception e) {
            logger.error("文件上传失败:", e);
            jsonMap.put("flag", false);
        }
        return jsonMap;
    }

    @RequestMapping(value = "/downloadFile.shtml")
    @ResponseBody
    public void downloadFile(HttpServletResponse response, @RequestParam Map<String, String> params) {
        String fileId = params.get("fileId");
        List<File> file = bootstrapDao.queryFile(fileId);
        if (file != null) {
            BASE64Decoder base64Decoder = new BASE64Decoder();
            try {
                byte[] fileData = base64Decoder.decodeBuffer(file.get(0).getImgBase64());
                OutputStream outputStream = response.getOutputStream();
                outputStream.write(fileData);
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value = "/printFile.json")
    @ResponseBody
    public Map<String, Object> printFile(@RequestParam Map<String, String> params) {
        JSONObject jsonObject = new JSONObject();
//        String fileId = "c9da9efdf9ed49bebc064a38d1f9fb2e";
//        String fileId = "b6a41664aee741188ffac6baf9e5b754";
        String fileId = params.get("fileId");
        List<File> file = bootstrapDao.queryFile(fileId);
        if (file != null && file.size() > 0) {
            BASE64Decoder base64Decoder = new BASE64Decoder();
            try {
                byte[] fileData = base64Decoder.decodeBuffer(file.get(0).getImgBase64());
                jsonObject.put("flag", true);
                jsonObject.put("fileName", file.get(0).getImgName());
                jsonObject.put("pdfObject", file.get(0).getImgBase64());
            } catch (IOException e) {
                e.printStackTrace();
                jsonObject.put("flag", false);
            }
        }
        return jsonObject;
    }

    @RequestMapping(value = "/printPdf.shtml", method = RequestMethod.POST)
    @ResponseBody
    public void printPdf(HttpServletResponse response, @RequestParam Map<String, String> params) {
        try {
            String fileName = params.get("pdfName");
            fileName = URLDecoder.decode(fileName, "UTF-8");
            response.addHeader("Content-Disposition", "fileName=" + URLEncoder.encode(fileName, "utf-8"));
            System.out.println("data:image/jpeg;base64," + params.get("pdfObject"));
            byte[] pdfObject = org.apache.commons.codec.binary.Base64.decodeBase64(params.get("pdfObject"));
            response.setCharacterEncoding("utf-8");
            response.setContentType("application/pdf");
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(pdfObject);
            logger.warn("成功打印报表。");
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
