package com.malaganguo.athmsssm.service;

import com.malaganguo.athmsssm.model.AnalysisConditionModel;
import com.malaganguo.athmsssm.model.TempPeakModel;

public interface IDataAnalysisService {

    TempPeakModel selectPeakTemperature(AnalysisConditionModel conditionModel);

    String selectAllAboutTemperatureResult(AnalysisConditionModel conditionModel);
}
