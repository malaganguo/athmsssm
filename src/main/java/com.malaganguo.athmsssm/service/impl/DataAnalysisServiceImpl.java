package com.malaganguo.athmsssm.service.impl;

import com.google.gson.Gson;
import com.malaganguo.athmsssm.dao.IDataAnalysisDao;
import com.malaganguo.athmsssm.model.AnalysisConditionModel;
import com.malaganguo.athmsssm.model.BarChartModel;
import com.malaganguo.athmsssm.model.ChartHumModel;
import com.malaganguo.athmsssm.model.ChartModel;
import com.malaganguo.athmsssm.model.HumPeakModel;
import com.malaganguo.athmsssm.model.PieChartModel;
import com.malaganguo.athmsssm.model.TempAndHumModel;
import com.malaganguo.athmsssm.model.TempPeakModel;
import com.malaganguo.athmsssm.service.IDataAnalysisService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class DataAnalysisServiceImpl implements IDataAnalysisService {
    private static final Gson GSON = new Gson();
    private static final Logger LOGGER = Logger.getLogger(DataAnalysisServiceImpl.class);

    @Autowired
    private IDataAnalysisDao dataAnalysisDao;

    @Override
    public TempPeakModel selectPeakTemperature(AnalysisConditionModel conditionModel) {
        return dataAnalysisDao.selectPeakTemperature(conditionModel);
    }

    @Override
    public List<Object> selectAllAboutTemperatureResult(AnalysisConditionModel conditionModel) {
        String analysisScope = conditionModel.getAnalysisScope();
        List<Object> list = new ArrayList<>();
        if("day".equals(analysisScope)){
            //峰值查询
            TempPeakModel tempPeakModel = dataAnalysisDao.selectDayPeakTemperature(conditionModel);//极值
            List<ChartModel> chartModels = dataAnalysisDao.selectDayTimeAndTemperature(conditionModel);//折线图数据
            //饼图数据填充
            int pieChartModels1 = dataAnalysisDao.selectPieChartTemperature1(conditionModel);
            int pieChartModels2 = dataAnalysisDao.selectPieChartTemperature2(conditionModel);
            int pieChartModels3 = dataAnalysisDao.selectPieChartTemperature3(conditionModel);
            int pieChartModels4 = dataAnalysisDao.selectPieChartTemperature4(conditionModel);
            double lt = new BigDecimal(pieChartModels2 * 1.0 / pieChartModels1 *100).setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
            double bt = new BigDecimal(pieChartModels3 * 1.0 / pieChartModels1*100).setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
            double between = new BigDecimal(pieChartModels4 * 1.0 / pieChartModels1 * 100).setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
            PieChartModel pieChartModel = new PieChartModel();
            pieChartModel.setLowScopeTemp(lt);
            pieChartModel.setBetweenScopeTemp(bt);
            pieChartModel.setHighScopeTemp(between);
            //柱状图数据填充
            List<BarChartModel> barChartModels = dataAnalysisDao.selectBarChartTemperature(conditionModel);
            //温湿度对比图数据填充
            List<TempAndHumModel> tempAndHumModels = dataAnalysisDao.selectTempAndHumChart(conditionModel);

            list.add(tempPeakModel);
            list.add(chartModels);
            list.add(pieChartModel);
            list.add(barChartModels);
            list.add(tempAndHumModels);
            LOGGER.debug("##analysis result data is :{}"+list);
            return list;
        }else if("month".equals(analysisScope)){

        }else if ("year".equals(analysisScope)){

        }else {
            LOGGER.debug("fail:{can't find analysis scope}");
        }
        return null;
    }

    @Override
    public List<Object> selectAllAboutHumidityResult(AnalysisConditionModel conditionModel) {
        String analysisScope = conditionModel.getAnalysisScope();
        List<Object> list = new ArrayList<>();
        if("day".equals(analysisScope)){
            //峰值查询
            HumPeakModel humPeakModel = dataAnalysisDao.selectDayPeakHumidity(conditionModel);//极值
            List<ChartHumModel> chartModels = dataAnalysisDao.selectDayTimeAndHumidity(conditionModel);//折线图数据
            //饼图数据填充
            int pieChartModels1 = dataAnalysisDao.selectPieChartHumidity1(conditionModel);
            int pieChartModels2 = dataAnalysisDao.selectPieChartHumidity2(conditionModel);
            int pieChartModels3 = dataAnalysisDao.selectPieChartHumidity3(conditionModel);
            int pieChartModels4 = dataAnalysisDao.selectPieChartHumidity4(conditionModel);
            double lt = new BigDecimal(pieChartModels2 * 1.0 / pieChartModels1 *100).setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
            double bt = new BigDecimal(pieChartModels3 * 1.0 / pieChartModels1*100).setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
            double between = new BigDecimal(pieChartModels4 * 1.0 / pieChartModels1 * 100).setScale(1, BigDecimal.ROUND_HALF_UP).doubleValue();
            PieChartModel pieChartModel = new PieChartModel();
            pieChartModel.setLowScopeTemp(lt);
            pieChartModel.setBetweenScopeTemp(bt);
            pieChartModel.setHighScopeTemp(between);
            //柱状图数据填充
            List<BarChartModel> barChartModels = dataAnalysisDao.selectBarChartHumidity(conditionModel);
            //温湿度对比图数据填充
            List<TempAndHumModel> tempAndHumModels = dataAnalysisDao.selectTempAndHumChart(conditionModel);

            list.add(humPeakModel);
            list.add(chartModels);
            list.add(pieChartModel);
            list.add(barChartModels);
            list.add(tempAndHumModels);
            LOGGER.debug("##analysis result data is :{}"+list);
            return list;
        }else if("month".equals(analysisScope)){

        }else if ("year".equals(analysisScope)){

        }else {
            LOGGER.debug("fail:{can't find analysis scope}");
        }
        return null;
    }

}
