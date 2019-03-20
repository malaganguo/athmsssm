package com.malaganguo.athmsssm.model;

import java.util.Date;

/**
 * 小时记数据的实体
 *
 * create 2019年3月18日 22点20分
 */
public class HourDataModel {

    private String date ;
    private Double temperature;
    private Double humidity;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Double getTemperature() {
        return temperature;
    }

    public void setTemperature(Double temperature) {
        this.temperature = temperature;
    }

    public Double getHumidity() {
        return humidity;
    }

    public void setHumidity(Double humidity) {
        this.humidity = humidity;
    }

    @Override
    public String toString() {
        return "HourDataModel{" +
                "date='" + date + '\'' +
                ", temperature=" + temperature +
                ", humidity=" + humidity +
                '}';
    }
}
