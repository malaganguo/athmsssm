package com.malaganguo.athmsssm.model;

import java.util.Map;

public class HoursDataModel {

    private String date ;
    private String temperature;
    private String humidity;
    private String siteName;

    @Override
    public String toString() {
        return "HoursDataModel{" +
                "date='" + date + '\'' +
                ", temperature='" + temperature + '\'' +
                ", humidity='" + humidity + '\'' +
                ", siteName='" + siteName + '\'' +
                '}';
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }

    public String getHumidity() {
        return humidity;
    }

    public void setHumidity(String humidity) {
        this.humidity = humidity;
    }


}
