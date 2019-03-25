package com.malaganguo.athmsssm.model;

public class HoursDataConditionModel {

    private String site;
    private String starttime;
    private String endtime;

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    @Override
    public String toString() {
        return "HoursDataConditionModel{" +
                "site='" + site + '\'' +
                ", starttime='" + starttime + '\'' +
                ", endtime='" + endtime + '\'' +
                '}';
    }
}
