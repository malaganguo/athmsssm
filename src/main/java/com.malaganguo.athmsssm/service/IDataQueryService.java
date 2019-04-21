package com.malaganguo.athmsssm.service;

import com.malaganguo.athmsssm.model.DataQueryChartModel;
import com.malaganguo.athmsssm.model.HoursDataConditionModel;
import com.malaganguo.athmsssm.model.HoursDataModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IDataQueryService {

    List<HoursDataModel> selectDataByTimeAndSite(HoursDataConditionModel conditionModel) throws Exception;

    void dataDeleteBySiteAndDate(String site ,String date);

    List<DataQueryChartModel> selectMinuteData(String site, String date);
}
