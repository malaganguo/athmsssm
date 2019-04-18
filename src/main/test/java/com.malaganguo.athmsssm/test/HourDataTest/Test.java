package com.malaganguo.athmsssm.test.HourDataTest;

import com.malaganguo.athmsssm.dao.IUserLoginDao;
import com.malaganguo.athmsssm.service.impl.UserLoginServiceImpl;
import org.junit.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Test {


    @Autowired
    public IUserLoginDao iUserLoginDao ;

    @Autowired
    public UserLoginServiceImpl userLoginService ;


    @Before
    public void getBefore(){
        String xmlPath = "D:\\athmsssm\\src\\main\\resources\\spring-mybatis.xml";
        ApplicationContext ac = new FileSystemXmlApplicationContext(xmlPath);
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
