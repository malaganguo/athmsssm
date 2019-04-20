package com.malaganguo.athmsssm.service;

import com.malaganguo.athmsssm.model.AnalysisConditionModel;
import com.malaganguo.athmsssm.model.TempPeakModel;

import java.util.List;

public interface IDataAnalysisService {

    TempPeakModel selectPeakTemperature(AnalysisConditionModel conditionModel);

    List<Object> selectAllAboutTemperatureResult(AnalysisConditionModel conditionModel);

    List<Object> selectAllAboutHumidityResult(AnalysisConditionModel conditionModel);
}
