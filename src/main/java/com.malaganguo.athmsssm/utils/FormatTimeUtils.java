package com.malaganguo.athmsssm.utils;

public class FormatTimeUtils {

    public static String getFormatStringDate(String date){
        //2019-03-24 ->  20190324
        StringBuffer stringBuffer = new StringBuffer();
        String[] split = date.split("-");
        int month = Integer.parseInt(split[1]);
        int day = Integer.parseInt(split[2]);
        stringBuffer.append(split[0]).append(split[1]).append(split[2]);
        return  stringBuffer.toString();
    }

}
