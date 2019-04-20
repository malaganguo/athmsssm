package com.malaganguo.athmsssm.model;

public class HumPeakModel {

    private int maxHum;
    private int minHum;
    private double avgHum;
    private double percent;

    public int getMaxHum() {
        return maxHum;
    }

    public void setMaxHum(int maxHum) {
        this.maxHum = maxHum;
    }

    public int getMinHum() {
        return minHum;
    }

    public void setMinHum(int minHum) {
        this.minHum = minHum;
    }

    public double getAvgHum() {
        return avgHum;
    }

    public void setAvgHum(double avgHum) {
        this.avgHum = avgHum;
    }

    public double getPercent() {
        return percent;
    }

    public void setPercent(double percent) {
        this.percent = percent;
    }
}
