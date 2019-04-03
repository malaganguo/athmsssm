package com.malaganguo.athmsssm.model;

public class AnalysisConditionModel {

    private String site;
    private String analysisScope;
    private String starttime;
    private String endtime;
    private String minThreshold;
    private String maxThreshold;

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public String getAnalysisScope() {
        return analysisScope;
    }

    public void setAnalysisScope(String analysisScope) {
        this.analysisScope = analysisScope;
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

    public String getMinThreshold() {
        return minThreshold;
    }

    public void setMinThreshold(String minThreshold) {
        this.minThreshold = minThreshold;
    }

    public String getMaxThreshold() {
        return maxThreshold;
    }

    public void setMaxThreshold(String maxThreshold) {
        this.maxThreshold = maxThreshold;
    }

    @Override
    public String toString() {
        return "AnalysisConditionModel{" +
                "site='" + site + '\'' +
                ", analysisScope='" + analysisScope + '\'' +
                ", starttime='" + starttime + '\'' +
                ", endtime='" + endtime + '\'' +
                ", minThreshold='" + minThreshold + '\'' +
                ", maxThreshold='" + maxThreshold + '\'' +
                '}';
    }
}
