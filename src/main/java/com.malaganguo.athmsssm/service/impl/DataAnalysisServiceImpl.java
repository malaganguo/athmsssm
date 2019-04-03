package com.malaganguo.athmsssm.service.impl;

import com.google.gson.Gson;
import com.malaganguo.athmsssm.dao.IDataAnalysisDao;
import com.malaganguo.athmsssm.model.AnalysisConditionModel;
import com.malaganguo.athmsssm.model.ChartModel;
import com.malaganguo.athmsssm.model.TempPeakModel;
import com.malaganguo.athmsssm.service.IDataAnalysisService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public String selectAllAboutTemperatureResult(AnalysisConditionModel conditionModel) {
        String analysisScope = conditionModel.getAnalysisScope();
        if("day".equals(analysisScope)){
            TempPeakModel tempPeakModel = dataAnalysisDao.selectDayPeakTemperature(conditionModel);
            List<ChartModel> chartModels = dataAnalysisDao.selectDayTimeAndTemperature(conditionModel);
            StringBuffer stringBuffer = new StringBuffer();
            stringBuffer.append("{\"data\":[");
            stringBuffer.append(GSON.toJson(tempPeakModel)).append(GSON.toJson(chartModels));
            LOGGER.debug("##analysis result json:{}"+stringBuffer.toString());
            return stringBuffer.toString();
        }else if("month".equals(analysisScope)){

        }else if ("year".equals(analysisScope)){

        }else {
            LOGGER.debug("fail:{can't find analysis scope}");
        }
        return null;
    }
}
