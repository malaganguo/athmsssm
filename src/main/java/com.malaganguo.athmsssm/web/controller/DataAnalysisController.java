package com.malaganguo.athmsssm.web.controller;

import com.malaganguo.athmsssm.model.AnalysisConditionModel;
import com.malaganguo.athmsssm.service.impl.DataAnalysisServiceImpl;
import com.malaganguo.athmsssm.utils.FormatTimeUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class DataAnalysisController {

    private static final Logger LOGGER = Logger.getLogger(DataAnalysisController.class);

    @Autowired
    private DataAnalysisServiceImpl dataAnalysisService;

    @RequestMapping("/getAnalysisResult.action")
    @ResponseBody
    public List<Object> getAnalysisResult(HttpServletRequest request, AnalysisConditionModel conditionModel) {
        //接收参数
        String site = request.getParameter("site");
        String analysisScope = request.getParameter("analysisScope");
        String starttime = request.getParameter("starttime");
        String endtime = request.getParameter("endtime");
        String maxthreshold = request.getParameter("maxthreshold");
        String minthreshold = request.getParameter("minthreshold");
        starttime = FormatTimeUtils.formatTimepicker(starttime);
        endtime = FormatTimeUtils.formatTimepicker(endtime);

        conditionModel.setSite(site);
        conditionModel.setAnalysisScope(analysisScope);
        conditionModel.setStarttime(starttime);
        conditionModel.setEndtime(endtime);
        conditionModel.setMaxThreshold(maxthreshold);
        conditionModel.setMinThreshold(minthreshold);
        System.out.println("conditionModelController:"+conditionModel);

        List<Object> result = dataAnalysisService.selectAllAboutTemperatureResult(conditionModel);
        LOGGER.debug("##Data analysis result:"+result);
        return result;
    }
}
