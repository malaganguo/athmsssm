package com.malaganguo.athmsssm.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/***
 *   新闻模块实体
 *   newsName:新闻名称
 *   url：新闻链接
 */
public class NewsModel implements Serializable {
    private static final long serialVersionUID = 1L;

    public NewsModel(){};

   private Map<String, String> newsMap;

    public Map<String, String> getNewsMap() {
        return newsMap;
    }

    public void setNewsMap(Map<String, String> newsMap) {
        this.newsMap = newsMap;
    }
}
