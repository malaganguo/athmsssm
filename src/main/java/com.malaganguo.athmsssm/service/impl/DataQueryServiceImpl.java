package com.malaganguo.athmsssm.service.impl;

import com.malaganguo.athmsssm.dao.IDataQueryDao;
import com.malaganguo.athmsssm.dao.ISiteDao;
import com.malaganguo.athmsssm.model.DataQueryChartModel;
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

    @Autowired
    private ISiteDao siteDao;

    @Override
    public List<HoursDataModel> selectDataByTimeAndSite(HoursDataConditionModel conditionModel) throws Exception{
        /*if(null == conditionModel.getSite() || "" == conditionModel.getSite()){
            List<String> sites = siteDao.selectAllSiteTable();
            return DataQueryDao.dataQueryByTimeAndAllSite(sites);
        }else {*/
            List<HoursDataModel> hoursDataModels = DataQueryDao.dataQueryByTimeAndSite(conditionModel);
            return hoursDataModels;
//        }

    }

    @Override
    public void dataDeleteBySiteAndDate(String site, String date) {
        DataQueryDao.dataDeleteBySiteAndData(site,date);
    }


    public List<DataQueryChartModel> selectMinuteData(String site, String date) {
        return DataQueryDao.minuteDataSelect(site,date);
    }
}
