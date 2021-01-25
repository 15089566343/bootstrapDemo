package com.hsw.bootstrap.entity;

/**
 * @ClassName File
 * @Description TODO    文件实体类
 * @Author huangshengwen
 * @Date 2021/1/15 11:10
 * @Version 1.0
 **/

public class File {

    private String imgId;
    private String imgName;
    private String createTime;
    private String singleId;
    private String imgBase64;

    public String getImgId() {
        return imgId;
    }

    public void setImgId(String imgId) {
        this.imgId = imgId;
    }

    public String getImgName() {
        return imgName;
    }

    public void setImgName(String imgName) {
        this.imgName = imgName;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getSingleId() {
        return singleId;
    }

    public void setSingleId(String singleId) {
        this.singleId = singleId;
    }

    public String getImgBase64() {
        return imgBase64;
    }

    public void setImgBase64(String imgBase64) {
        this.imgBase64 = imgBase64;
    }
}
