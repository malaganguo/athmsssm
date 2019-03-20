package com.malaganguo.athmsssm.utils;


import java.text.SimpleDateFormat;
import java.util.Date;

public class FormatTimeUtils {

    public String getFormatDate(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM dd hh");
        String s = sdf.format(date);
        return s;
    }
}
