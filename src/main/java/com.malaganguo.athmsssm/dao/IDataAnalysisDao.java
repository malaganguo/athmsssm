package com.malaganguo.athmsssm.dao;




import com.malaganguo.athmsssm.model.AnalysisConditionModel;
import com.malaganguo.athmsssm.model.BarChartModel;
import com.malaganguo.athmsssm.model.ChartHumModel;
import com.malaganguo.athmsssm.model.ChartModel;
import com.malaganguo.athmsssm.model.HumPeakModel;
import com.malaganguo.athmsssm.model.TempAndHumModel;
import com.malaganguo.athmsssm.model.TempPeakModel;

import java.util.List;

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

//-----------------------------------------温度数据-----------------------------------------------
    TempPeakModel selectDayPeakTemperature(AnalysisConditionModel conditionModel);

    //折线图需要的数据
    List<ChartModel> selectDayTimeAndTemperature(AnalysisConditionModel conditionModel);
    //饼图需要的数据:渣渣飞不要写多sql和长sql，只能这样了
    int selectPieChartTemperature1(AnalysisConditionModel conditionModel);//总记录数
    int selectPieChartTemperature2(AnalysisConditionModel conditionModel);//<
    int selectPieChartTemperature3(AnalysisConditionModel conditionModel);//之间
    int selectPieChartTemperature4(AnalysisConditionModel conditionModel);//>
    //柱状图
    List<BarChartModel> selectBarChartTemperature(AnalysisConditionModel conditionModel);
    //温湿度点柱图
    List<TempAndHumModel> selectTempAndHumChart(AnalysisConditionModel conditionModel);

//--------------------------------湿度数据------------------------------------------------
    HumPeakModel selectDayPeakHumidity(AnalysisConditionModel conditionModel);

    //折线图需要的数据
    List<ChartHumModel> selectDayTimeAndHumidity(AnalysisConditionModel conditionModel);
    //饼图需要的数据:渣渣飞不要写多sql和长sql，只能这样了
    int selectPieChartHumidity1(AnalysisConditionModel conditionModel);//总记录数
    int selectPieChartHumidity2(AnalysisConditionModel conditionModel);//<
    int selectPieChartHumidity3(AnalysisConditionModel conditionModel);//之间
    int selectPieChartHumidity4(AnalysisConditionModel conditionModel);//>
    //柱状图
    List<BarChartModel> selectBarChartHumidity(AnalysisConditionModel conditionModel);


}
