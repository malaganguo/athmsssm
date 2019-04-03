package com.malaganguo.athmsssm.model;

public class ChartModel {

    private String date ;
    private String temperature;

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

    @Override
    public String toString() {
        return "ChartModel{" +
                "date='" + date + '\'' +
                ", temperature='" + temperature + '\'' +
                '}';
    }
}
