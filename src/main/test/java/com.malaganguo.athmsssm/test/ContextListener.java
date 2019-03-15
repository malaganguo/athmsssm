package com.malaganguo.athmsssm.test;

import com.malaganguo.athmsssm.utils.ActiveMQCustomer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ActiveMQCustomer.start();
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        ActiveMQCustomer.close();
    }
}
