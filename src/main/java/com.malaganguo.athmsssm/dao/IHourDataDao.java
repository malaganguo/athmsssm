package com.malaganguo.athmsssm.dao;

import com.malaganguo.athmsssm.model.ConditionModel;
import com.malaganguo.athmsssm.model.HourDataModel;
import com.malaganguo.athmsssm.utils.FormatTimeUtils;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IHourDataDao {

    HourDataModel hhourAvgDataSelect(ConditionModel conditionModel ) throws Exception;
}
