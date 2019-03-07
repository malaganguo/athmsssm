package com.malaganguo.athmsssm.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Model {
    private String wholeDate;
    private String date;
    private String minutes;
    private String second;
    private String temperature;
    private String humidity;

    public Model() {
    }

    public String getWholeDate() {
        return wholeDate;
    }

    public void setWholeDate(String wholeDate) {
        this.wholeDate = wholeDate;
    }

    public String getDate() {
        Date date1 = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy MM dd hh");

        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getMinutes() {
        return minutes;
    }

    public void setMinutes(String mintues) {
        this.minutes = mintues;
    }

    public String getSecond() {
        return second;
    }

    public void setSecond(String second) {
        this.second = second;
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

    @Override
    public String toString() {
        return "Model [wholeDate=" + wholeDate + ", date=" + date + ", minutes=" + minutes + ", second=" + second
                + ", temperature=" + temperature + ", humidity=" + humidity + "]";
    }
}
