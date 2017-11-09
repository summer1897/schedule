package com.summer.controller;

/**
 * Created by yangyang on 2017/11/8.
 */
public class DataVo {
    private int code;
    private String msg;
    private int count;
    private Object data;

    public DataVo() {}

    public DataVo(int code,String msg,int count,Object data) {
        this.code = code;
        this.msg = msg;
        this.count = count;
        this.data = data;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getCode() {
        return this.code;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return this.msg;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getCount() {
        return this.count;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Object getData() {
        return this.data;
    }
}
