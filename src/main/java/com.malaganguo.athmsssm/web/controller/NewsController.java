package com.malaganguo.athmsssm.web.controller;



import com.google.gson.Gson;
import com.malaganguo.athmsssm.exception.NotFindNewsException;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.annotation.Resource;
import javax.json.Json;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Controller
public class NewsController {
    private static Logger LOGGER = Logger.getLogger(NewsController.class);
    private static Map<String,String> newsNameAndUrl;
    private static Gson gson = new Gson();

    public Map<String, String> getNewsNameAndUrl() {
        return newsNameAndUrl;
    }

    public static void setNewsNameAndUrl(Map<String, String> newsNameAndUrl) {
        NewsController.newsNameAndUrl = newsNameAndUrl;
    }

    @RequestMapping("/getNews.action")
    @ResponseBody
    public Map<String, String> getNewsMap(HttpServletResponse response){
        String jsonNews ="";
        try{
            //jsonNews = gson.toJson(newsNameAndUrl);
            //LOGGER.debug("##jsonNews:"+jsonNews);
        }catch (Exception e){
            LOGGER.debug("get news fail");
        }
        return newsNameAndUrl;
    }
}
