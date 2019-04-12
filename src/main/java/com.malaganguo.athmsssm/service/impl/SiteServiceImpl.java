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
    public void addSite(SiteModel site) {
        siteDao.addSite(site);
    }

    @Override
    public List<SiteModel> selectAllSite() {
        return siteDao.selectAllSite();
    }
}
