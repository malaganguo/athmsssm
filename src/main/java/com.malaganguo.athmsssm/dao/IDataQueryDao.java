package com.malaganguo.athmsssm.dao;

import com.malaganguo.athmsssm.model.DataQueryChartModel;
import com.malaganguo.athmsssm.model.HoursDataConditionModel;
import com.malaganguo.athmsssm.model.HoursDataModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IDataQueryDao {

    List<HoursDataModel> dataQueryByTimeAndSite(HoursDataConditionModel conditionModel) throws Exception;

    void dataDeleteBySiteAndData(@Param("site") String site ,@Param("date") String date);

    List<HoursDataModel> dataQueryByTimeAndAllSite(@Param("sites") List<String> sites);

    List<DataQueryChartModel> minuteDataSelect(@Param("site") String site,@Param("date") String date);
}
