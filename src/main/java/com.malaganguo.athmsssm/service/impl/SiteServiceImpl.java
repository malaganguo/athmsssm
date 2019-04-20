package com.malaganguo.athmsssm.service.impl;

import com.malaganguo.athmsssm.dao.ISiteDao;
import com.malaganguo.athmsssm.model.SiteModel;
import com.malaganguo.athmsssm.service.ISiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SiteServiceImpl implements ISiteService {

    @Autowired
    private ISiteDao siteDao;

    @Override
    public boolean addSite(SiteModel site) {
        List<String> sitesName = siteDao.selectAllSiteName();
        if(sitesName.contains(site.getSiteName())){
            return false ;
        }
        siteDao.addSite(site);
        siteDao.createSiteTable(site.getSiteTable());
        return true;
    }

    @Override
    public List<SiteModel> selectAllSite() {
        return siteDao.selectAllSite();
    }

    @Override
    public void deleteSiteBySiteId(int siteId) {
        siteDao.deleteSiteBySiteId(siteId);
        String siteTable = siteDao.selectSiteTableById(siteId);
        siteDao.dropSiteTable(siteTable);
    }


}
