package com.malaganguo.athmsssm.model;

public class SiteModel {

    private int siteId;
    private String siteName;
    private String siteTable;
    private String siteArea;
    private String addPerson;
    private String addTime;

    public String getSiteTable() {
        return siteTable;
    }

    public void setSiteTable(String siteTable) {
        this.siteTable = siteTable;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public int getSiteId() {
        return siteId;
    }

    public void setSiteId(int siteId) {
        this.siteId = siteId;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getSiteArea() {
        return siteArea;
    }

    public void setSiteArea(String siteArea) {
        this.siteArea = siteArea;
    }

    public String getAddPerson() {
        return addPerson;
    }

    public void setAddPerson(String addPerson) {
        this.addPerson = addPerson;
    }

    @Override
    public String toString() {
        return "SiteModel{" +
                "siteId=" + siteId +
                ", siteName='" + siteName + '\'' +
                ", siteArea='" + siteArea + '\'' +
                ", addPerson='" + addPerson + '\'' +
                ", addTime='" + addTime + '\'' +
                '}';
    }
}
