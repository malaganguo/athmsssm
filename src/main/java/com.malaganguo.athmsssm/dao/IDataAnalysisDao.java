package com.malaganguo.athmsssm.dao;

import com.malaganguo.athmsssm.model.AnalysisConditionModel;
import com.malaganguo.athmsssm.model.ChartModel;
import com.malaganguo.athmsssm.model.TempPeakModel;

import java.util.List;
import java.util.Map;

public interface IDataAnalysisDao {

    //最高温度
    int queryMaxTemperature();

    //最低温度
    int queryMaxHumidity();

    //平均温度
    int queryAvgTemperature();

    //平均湿度
    int queryAvgHumidity();

    //适宜温度占比
    int querySuitTemperaturePercent();

    TempPeakModel selectPeakTemperature(AnalysisConditionModel conditionModel);

    TempPeakModel selectDayPeakTemperature(AnalysisConditionModel conditionModel);

    List<ChartModel> selectDayTimeAndTemperature(AnalysisConditionModel conditionModel);

    Map<String,String> selectPieChartTemperature(AnalysisConditionModel conditionModel);

    Map<String,String> selectBarChartTemperature(AnalysisConditionModel conditionModel);

}
