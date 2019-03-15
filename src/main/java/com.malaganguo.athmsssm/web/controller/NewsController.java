package com.malaganguo.athmsssm.web.controller;



import com.google.gson.Gson;
import com.malaganguo.athmsssm.web.listener.ContextListener;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.annotation.Resource;
import javax.json.Json;
import java.util.Map;

@Controller
public class NewsController {
    private static Logger LOGGER = Logger.getLogger(NewsController.class);
    private static Map<String,String> newsNameAndUrl;

    public Map<String, String> getNewsNameAndUrl() {
        return newsNameAndUrl;
    }

    public static void setNewsNameAndUrl(Map<String, String> newsNameAndUrl) {
        NewsController.newsNameAndUrl = newsNameAndUrl;
    }

    @RequestMapping("/getNews.action")
    @ResponseBody
    public String getNewsMap(){
        Gson gson = new Gson();
        String jsonNews = gson.toJson(newsNameAndUrl);
        LOGGER.debug("jsonNews"+jsonNews);
        return jsonNews;
    }
}
