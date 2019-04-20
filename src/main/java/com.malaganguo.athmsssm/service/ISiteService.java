package com.malaganguo.athmsssm.service;

import com.malaganguo.athmsssm.model.SiteModel;

import java.util.List;

public interface ISiteService {

    //添加站点并创建站点表
    boolean addSite(SiteModel model);

    //查询所有站点
    List<SiteModel> selectAllSite();

    //删除站点和站点表
    void deleteSiteBySiteId(int siteId);

}
