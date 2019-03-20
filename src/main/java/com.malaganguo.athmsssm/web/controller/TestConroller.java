package com.malaganguo.athmsssm.web.controller;

import com.malaganguo.athmsssm.model.ConditionModel;
import com.malaganguo.athmsssm.model.HourDataModel;
import com.malaganguo.athmsssm.model.User;
import com.malaganguo.athmsssm.service.impl.HourDataServiceImpl;
import com.malaganguo.athmsssm.service.impl.UserLoginServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestConroller {

    @Autowired
    private HourDataServiceImpl hourDataService ;


    @Autowired
    private UserLoginServiceImpl userLoginService;
    @GetMapping("hello.action")
    public String index() throws Exception {
        ConditionModel conditionModel = new ConditionModel();
        conditionModel.setTable_name("site_1");
        conditionModel.setHourtime("2019 3 11 19");
        HourDataModel hourDataModel = hourDataService.hourAvgDataSelect(conditionModel);
//        int alohaaa = userLoginService.registerUser("alohaaa", "123aa", "823801071@qq.com");
        System.out.println("##HourDataModel:"+hourDataModel);

        return "helloworld";
    }
}
