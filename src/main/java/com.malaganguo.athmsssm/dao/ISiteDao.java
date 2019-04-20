package com.malaganguo.athmsssm.dao;

import com.malaganguo.athmsssm.model.SiteModel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ISiteDao {

    //添加站点
    void addSite(SiteModel model);

    //查询所有站点
    List<SiteModel> selectAllSite();

    //监测点个数
    int selectCountSite();

    //删除站点
    void deleteSiteBySiteId(@Param("siteId") int SiteId);

    //创建站点表
    void createSiteTable(@Param("tableName") String tableName);

    //删除站点表
    void dropSiteTable(@Param("tableName") String tableName);

    //搜索站点名称
    List<String> selectAllSiteName();

    //根据id查询表名
    String selectSiteTableById(int id);

    //查询所有站点表名
    List<String> selectAllSiteTable();

}
