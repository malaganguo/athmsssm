package com.malaganguo.athmsssm.service.impl;

import com.malaganguo.athmsssm.dao.IHourDataDao;
import com.malaganguo.athmsssm.model.ConditionModel;
import com.malaganguo.athmsssm.model.HourDataModel;
import com.malaganguo.athmsssm.service.IHourDataService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class HourDataServiceImpl implements IHourDataService {

    private static final Logger LOGGER = Logger.getLogger(UserLoginServiceImpl.class);

    @Resource
    private IHourDataDao iHourDataDao;

    @Override
    public HourDataModel hourAvgDataSelect(ConditionModel conditionModel) throws Exception {
        HourDataModel hourDataModel = iHourDataDao.hhourAvgDataSelect(conditionModel);
        return hourDataModel;
    }
}
