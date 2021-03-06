package com.malaganguo.athmsssm.web.controller;

import com.malaganguo.athmsssm.model.HoursDataConditionModel;
import com.malaganguo.athmsssm.model.HoursDataModel;
import com.malaganguo.athmsssm.service.impl.DataQueryServiceImpl;
import com.malaganguo.athmsssm.utils.FormatTimeUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class DataQueryController {

    private static Logger LOGGER = Logger.getLogger(DataQueryController.class);

    @Autowired
    private DataQueryServiceImpl dataQueryService;

    @RequestMapping("/dataQuery.action")
    @ResponseBody
    public List<HoursDataModel> dataQuery(HttpServletRequest request) throws Exception {

            Map<String, String[]> parameterMap = request.getParameterMap();
            String site = (parameterMap.get("site"))[0];
            String starttime = parameterMap.get("starttime")[0];
            String endtime = parameterMap.get("endtime")[0];
            if("" !=starttime){
                starttime = FormatTimeUtils.getFormatStringDate(parameterMap.get("starttime")[0])+" 0";//格式化日期 2019-3-24 -> 2019 3 24
            }
            if("" !=endtime){
                endtime = FormatTimeUtils.getFormatStringDate((parameterMap.get("endtime"))[0])+" 23";
            }
            LOGGER.info("##request params:{site:"+site+",starttime:"+starttime+",endtime:"+endtime+"}");
            HoursDataConditionModel conditionModel = new HoursDataConditionModel();
            conditionModel.setSite(site);
            conditionModel.setStarttime(starttime);
            conditionModel.setEndtime(endtime);
            List<HoursDataModel> hoursDataModels = dataQueryService.selectDataByTimeAndSite(conditionModel);
            System.out.println("##hoursDataModels:"+hoursDataModels.toString());
            if(hoursDataModels == null || hoursDataModels.equals("")){
                LOGGER.debug("hoursDataQuery result is null , value is :"+hoursDataModels);
            }
        return hoursDataModels;
    }

    @RequestMapping("/dataDelete.action")
    @ResponseBody
    public String dataDelete(HttpServletRequest request){
        try {
            String site = request.getParameter("site");
            String date = request.getParameter("date");
            dataQueryService.dataDeleteBySiteAndDate(site,date);
        } catch (Exception e) {
            LOGGER.debug("删除数据失败,原因："+e.getMessage());
            return "fail";
        }
        return "success";
    }

    @RequestMapping("/minuteDataSelect.action")
    @ResponseBody
    public String minuteDataSelect(HttpServletRequest request){
        String site = request.getParameter("site");
        String date = request.getParameter("date");
        System.out.println("###site:"+site+",date:"+date);
        dataQueryService.selectMinuteData(site,date);
        return null;
    }
}
