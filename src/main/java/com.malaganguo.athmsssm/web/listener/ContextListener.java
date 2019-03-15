package com.malaganguo.athmsssm.web.listener;

import com.malaganguo.athmsssm.utils.ActiveMQCustomer;
import com.malaganguo.athmsssm.utils.NewsSpiderUtils;
import com.malaganguo.athmsssm.web.controller.NewsController;
import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

public class ContextListener implements ServletContextListener {
    private static Logger LOGGER = Logger.getLogger(ContextListener.class);



    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {


        LOGGER.debug("athmsssm is start ,then create activeMQ connection");
        ActiveMQCustomer.start();
        LOGGER.debug("activeMQ connectioned");
        /*TimerTask task = new TimerTask() {
            @Override
            public void run() {
                newsNameAndUrl = NewsSpiderUtils.getNewsNameAndUrl("http://www.agronet.com.cn/News/List_c23994.html", ".arrow_700 dd ul li span a");
            }
        };
        Timer timer = new Timer();
        long delay = 0; //延迟0ms后执行
        long intevalPeriod = 24 * 60 * 60 * 1000 ; //一天执行一次
        timer.scheduleAtFixedRate(task, delay, intevalPeriod);*/
        Map<String,String> newsNameAndUrl = NewsSpiderUtils.getNewsNameAndUrl("http://www.agronet.com.cn/News/List_c23994.html", ".arrow_700 dd ul li span a");
        LOGGER.debug("timer started:"+newsNameAndUrl);
        NewsController.setNewsNameAndUrl(newsNameAndUrl);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        LOGGER.debug("athmsssm is stopped");
        ActiveMQCustomer.close();
    }
}
