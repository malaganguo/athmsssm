package com.malaganguo.athmsssm.service;

import com.malaganguo.athmsssm.model.HoursDataConditionModel;
import com.malaganguo.athmsssm.model.HoursDataModel;

import java.util.List;

public interface IDataQueryService {

    List<HoursDataModel> selectDataByTimeAndSite(HoursDataConditionModel conditionModel) throws Exception;
}
