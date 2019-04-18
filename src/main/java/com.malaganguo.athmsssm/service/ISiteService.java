package com.malaganguo.athmsssm.service;

import com.malaganguo.athmsssm.model.SiteModel;

import java.util.List;

public interface ISiteService {

    //添加站点
    void addSite(SiteModel model);

    //查询所有站点
    List<SiteModel> selectAllSite();

    //删除站点
    void deleteSiteBySiteId(int siteId);
}
