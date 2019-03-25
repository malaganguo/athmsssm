package com.malaganguo.athmsssm.dao;

import com.malaganguo.athmsssm.model.HoursDataConditionModel;
import com.malaganguo.athmsssm.model.HoursDataModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IDataQueryDao {

    List<HoursDataModel> dataQueryByTimeAndSite(HoursDataConditionModel conditionModel) throws Exception;
}
