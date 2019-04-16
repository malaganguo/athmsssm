package com.malaganguo.athmsssm.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
    //2019-四月-13 09:25 上午 -> 2019041309
    public static String formatTimepicker(String date){
        String[] s = date.split(" ");
        String[] ss = s[0].split("-");
        switch(ss[1]){
            case "一月" : ss[1] = "01";break;
            case "二月" : ss[1] = "02";break;
            case "三月" : ss[1] = "03";break;
            case "四月" : ss[1] = "04";break;
            case "五月" : ss[1] = "05";break;
            case "六月" : ss[1] = "06";break;
            case "七月" : ss[1] = "07";break;
            case "八月" : ss[1] = "08";break;
            case "九月" : ss[1] = "09";break;
            case "十月" : ss[1] = "10";break;
            case "十一月" : ss[1] = "11";break;
            case "十二月" : ss[1] = "12";break;
            default:ss[1] = "montherror";
        }
        String[] split = s[1].split(":");
        s[1] = split[0];//hour
        if("下午"==s[2] || "下午".equals(s[2])){
            switch(s[1]){
                case "01" : s[1] = "13";break;
                case "02" : s[1] = "14";break;
                case "03" : s[1] = "15";break;
                case "04" :s[1] = "16";break;
                case "05" :s[1] = "17";break;
                case "06" : s[1] = "18";break;
                case "07" :s[1] = "19";break;
                case "08" :s[1] = "20";break;
                case "09" :s[1] = "21";break;
                case "10" :s[1] = "22";break;
                case "11" :s[1] = "23";break;
                case "12" :s[1] = "00";break;
                default:s[1] = "hourerror";
            }
        }


        return ss[0]+ss[1]+ss[2]+s[1];
    }

    public static String formatDayTime(String date){
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String[] split = date.split("/");
        if(split[2].length()!=4){
            split[2] = "20"+ split[2];
        }
        int year = Integer.parseInt(split[2])-1900;
        int month = Integer.parseInt(split[0])-1;
        int day = Integer.parseInt(split[1]);
        Date date1 = new Date(year,month,day);
        String format1 = format.format(date1);
        return format1;
    }
    public static void main(String[] args) {
//        String s = formatTimepicker("2019-四月-13 02:25 上午");
//        System.out.println(s);
        String s = formatDayTime("1/13/19");
        System.out.println(s);
    }
}
