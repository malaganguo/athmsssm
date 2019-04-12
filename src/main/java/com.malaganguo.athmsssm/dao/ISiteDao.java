package com.malaganguo.athmsssm.dao;

import com.malaganguo.athmsssm.model.SiteModel;

import java.util.List;

public interface ISiteDao {

    //添加站点
    void addSite(SiteModel model);

    //查询所有站点
    List<SiteModel> selectAllSite();

    //监测点个数
    int selectCountSite();
}
