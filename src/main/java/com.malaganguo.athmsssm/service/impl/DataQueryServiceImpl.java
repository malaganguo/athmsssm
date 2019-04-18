package com.malaganguo.athmsssm.service.impl;

import com.malaganguo.athmsssm.dao.IDataQueryDao;
import com.malaganguo.athmsssm.model.HoursDataConditionModel;
import com.malaganguo.athmsssm.model.HoursDataModel;
import com.malaganguo.athmsssm.service.IDataQueryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DataQueryServiceImpl implements IDataQueryService {

    @Autowired
    private IDataQueryDao DataQueryDao;

    @Override
    public List<HoursDataModel> selectDataByTimeAndSite(HoursDataConditionModel conditionModel) throws Exception{
        List<HoursDataModel> hoursDataModels = DataQueryDao.dataQueryByTimeAndSite(conditionModel);
        return hoursDataModels;
    }

    @Override
    public void dataDeleteBySiteAndDate(String site, String date) {
        DataQueryDao.dataDeleteBySiteAndData(site,date);
    }


}
