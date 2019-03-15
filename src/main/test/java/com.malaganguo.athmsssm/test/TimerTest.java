package com.malaganguo.athmsssm.test;

import com.malaganguo.athmsssm.utils.NewsSpiderUtils;
import com.malaganguo.athmsssm.web.controller.NewsController;
import org.junit.Test;

import java.util.Arrays;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

public class TimerTest {
    public static Map<String, String> newsNameAndUrl;

    public static void main(String[] args) {

/*            TimerTask task = new TimerTask() {
                @Override
                public void run() {
                    // task to run goes here
                    System.out.println("Hello !!!");
                }
            };
            Timer timer = new Timer();
            long delay = 0;
            long intevalPeriod = 1 * 1000;
            // schedules the task to be run in an interval
            timer.scheduleAtFixedRate(task, delay, intevalPeriod);
        } // end of main*/
        TimerTask task = new TimerTask() {
            @Override
            public void run() {
                newsNameAndUrl = NewsSpiderUtils.getNewsNameAndUrl("http://www.agronet.com.cn/News/List_c23994.html", ".arrow_700 dd ul li span a");
            }
        };
        Timer timer = new Timer();
        long delay = 0; //延迟0ms后执行
        long intevalPeriod = 24 * 60 * 60 * 1000; //一天执行一次
        timer.scheduleAtFixedRate(task, delay, intevalPeriod);
        NewsController.setNewsNameAndUrl(newsNameAndUrl);
        for (Map.Entry<String, String> entry : newsNameAndUrl.entrySet()) {
            System.out.println(entry.getKey() +":"+entry.getValue());
        }
    }

    @Test
    public void test(){
        Map<String, String> newsNameAndUrl = NewsSpiderUtils.getNewsNameAndUrl("http://www.agronet.com.cn/News/List_c23994.html", ".arrow_700 dd ul li span a");
        for (Map.Entry entry: newsNameAndUrl.entrySet()
             ) {
            System.out.println(entry.getKey() +":"+entry.getValue());
        }
    }
}
