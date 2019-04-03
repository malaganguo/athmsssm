package com.malaganguo.athmsssm.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.Random;
import java.util.ResourceBundle;

/***
 *  生成随机数
 */
public class GetRandomDataUtils {

    public static void main(String[] args) {

        int min = 201901;
        int max = 201912;
        int sday = 01;
        int eday = 31;
        int stime = 00;
        int etime = 23;
        int mintemp = 10;
        int maxtemp = 50;
        int minhum = 0;
        int maxhum = 100;
        ResourceBundle rb = ResourceBundle.getBundle("jdbc");
        String url = rb.getString("jdbc.url");
        String user = rb.getString("jdbc.username");
        String password = rb.getString("jdbc.password");
        String driverClass = rb.getString("jdbc.driver");
        try {
            Class.forName(driverClass);
            Connection connection = DriverManager.getConnection(url, user, password);
            connection.setTransactionIsolation(Connection.TRANSACTION_SERIALIZABLE);
            PreparedStatement preparedStatement = connection.prepareStatement("insert into site_1_hourdata(date,temperature,humidity) value(?,?,?) ");
            for(int i=0;i<10;i++) {
                String day = Integer.toString(new Random().nextInt(eday-sday)+sday);
                String time =Integer.toString(new Random().nextInt(etime-stime)+stime);
                if(Integer.parseInt(day)<10){
                    day = "0"+day;
                }
                if(Integer.parseInt(time)<10){
                    time = "0"+time;
                }
                String randomDate =Integer.toString(new Random().nextInt(max-min)+min)+day+time;
                String randomTemp = Integer.toString(new Random().nextInt(maxtemp-mintemp)+mintemp);
                String randomHum = Integer.toString(new Random().nextInt(maxhum-minhum)+minhum);
                preparedStatement.setString(1,randomDate);
                preparedStatement.setString(2, randomTemp);
                preparedStatement.setString(3, randomHum);

                preparedStatement.executeUpdate();
                System.out.println(randomDate +" "+randomTemp+" "+randomHum);
            }

            if(preparedStatement!=null){
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                preparedStatement=null;
            }
            if(connection!=null){
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                connection=null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



}
