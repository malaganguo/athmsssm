package com.malaganguo.athmsssm.service;

import com.malaganguo.athmsssm.model.ConditionModel;
import com.malaganguo.athmsssm.model.HourDataModel;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface IHourDataService {

    HourDataModel hourAvgDataSelect(ConditionModel conditionModel) throws Exception;
}
