package com.malaganguo.athmsssm.test;

import com.malaganguo.athmsssm.model.NewsModel;
import org.apache.http.Header;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.HashMap;
import java.util.Map;


public class Spider {

    public static void main(String[] args) {
        String url = "http://www.agronet.com.cn/News/List_c23994.html";
        try(CloseableHttpClient httpClient = HttpClientBuilder.create().build();
            CloseableHttpResponse response = httpClient.execute(new HttpGet(url));){
            String content = EntityUtils.toString(response.getEntity());
            content = new String(content.getBytes("utf-8"));
            Document doc = Jsoup.parse(content);
            Elements elements = doc.select(".arrow_700 dd ul li span a");
            Map<String,String> newsMap = new HashMap<>();
            for (Element element: elements
                 ) {
                newsMap.put(element.text(),element.attr("href"));
            }
            NewsModel newsModel = new NewsModel();
            newsModel.setNewsMap(newsMap);
            System.out.println(newsMap.toString());
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
