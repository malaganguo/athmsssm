package com.malaganguo.athmsssm.test.HourDataTest;

import com.malaganguo.athmsssm.dao.IHourDataDao;
import com.malaganguo.athmsssm.dao.IUserLoginDao;
import com.malaganguo.athmsssm.model.ConditionModel;
import com.malaganguo.athmsssm.model.HourDataModel;
import com.malaganguo.athmsssm.model.User;
import com.malaganguo.athmsssm.service.impl.HourDataServiceImpl;
import com.malaganguo.athmsssm.service.impl.UserLoginServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

public class Test {

    @Autowired
    public IHourDataDao iHourDataDao ;

    @Autowired
    public IUserLoginDao iUserLoginDao ;

    @Autowired
    public HourDataServiceImpl hourDataService ;

    @Autowired
    public UserLoginServiceImpl userLoginService ;

    @org.junit.Test
    public void Test2(){
        int i = userLoginService.registerUser("压缩", "qwer", "2323@23.com");
        System.out.println(i);
    }

    @org.junit.Test
    public void Test() throws Exception {
//        HourDataModel hourDataModel = hourDataService.hourAvgDataSelect();
        //        HourDataModel site_1 = hourDataService.hourAvgDataSelect("site_1", "2019 3 11 19");
//    HourDataModel site_1 = hourDataService.hourAvgDataSelect();
//        System.out.println(site_1);
        /*ConditionModel conditionModel = new ConditionModel();
        conditionModel.setTable_name("site_1");
        conditionModel.setHourtime("2019 3 11 19")*/;
//        HourDataModel hourDataModel = iHourDataDao.hourAvgDataSelect();
//        System.out.println(hourDataModel);

    }
}
