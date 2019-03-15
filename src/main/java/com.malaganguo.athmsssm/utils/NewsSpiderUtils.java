package com.malaganguo.athmsssm.utils;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * 爬取新闻的工具类
 * String url = "http://www.agronet.com.cn/News/List_c23994.html";
 * String cssQuery = ".arrow_700 dd ul li span a"
 *
 * 存储：名称 url
 * uri = "http://www.agronet.com.cn"+url
 */
public class NewsSpiderUtils {
    public static void main(String[] args) {
        Map<String, String> newsNameAndUrl = getNewsNameAndUrl("http://www.agronet.com.cn/News/List_c23994.html", ".arrow_700 dd ul li span a");
        for (Map.Entry<String, String> entry : newsNameAndUrl.entrySet()) {
            System.out.println(entry.getKey() +":"+entry.getValue());
        }
    }
    public static Map<String,String> getNewsNameAndUrl(String url, String cssQuery){
        Map<String, String> newsMap = new HashMap<>();
        try(CloseableHttpClient httpClient = HttpClientBuilder.create().build();
            CloseableHttpResponse response = httpClient.execute(new HttpGet(url));) {
            String content = EntityUtils.toString(response.getEntity());
            //content = new String(content.getBytes("utf-8"));
            Document doc = Jsoup.parse(content);
            Elements elements = doc.select(cssQuery);
            for (Element element : elements
            ) {
                newsMap.put(element.text(), "http://www.agronet.com.cn"+element.attr("href"));
            }


        }catch (Exception e){
            e.printStackTrace();
        }
        return newsMap;
    }
}
