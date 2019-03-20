package com.malaganguo.athmsssm.exception;

public class NotFindNewsException extends Exception {

    public NotFindNewsException(){};

    @Override
    public String toString() {
        return "没有爬去到中国农业网的新闻！";
    }
}
