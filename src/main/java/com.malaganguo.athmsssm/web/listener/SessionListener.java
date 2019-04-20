package com.malaganguo.athmsssm.web.listener;

import org.apache.log4j.Logger;

import javax.jms.Session;
import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;


public class SessionListener implements HttpSessionListener {

    private static final Logger LOGGER  = Logger.getLogger(HttpSessionEvent.class);
    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {

    }
}
