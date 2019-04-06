package com.malaganguo.athmsssm.test;

import java.math.BigDecimal;

public class CalculateTest {
    public static void main(String[] args) {
        int i = 19;
        int j = 300;
        double k = j*1.0/i;
        float u = j/i;
        System.out.println(j*1.0/i*1.0);
        System.out.println(k);
        System.out.println(u);
        float v = new BigDecimal(k).setScale(1, BigDecimal.ROUND_HALF_UP).floatValue();
        System.out.println(v);
    }
}
