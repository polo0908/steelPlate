package com.cal.controller;

import java.io.Serializable;
/**
 * 
 * 用于封装JSON返回数据的对象类
 * @author polo
 *
 * @param <T>
 */
public class JsonResult<T> implements Serializable {

	public static final int SUCCESS=0;
    public static final int ERROR=1;
    
    private int state;
    private String message;
    private T data;
	public JsonResult() {
      
	}
	public JsonResult(String errorMessage){
		this(ERROR,errorMessage,null);
	}
	public JsonResult(T data){
		this(SUCCESS,"",data);
	}
	
	public JsonResult(int state,String message) {
		this(state,message,null);
	}

	public JsonResult(int state, String message, T data) {
		this.state = state;
		this.message = message;
		this.data = data;
		
	}

	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "JsonResult [state=" + state + ", message=" + message + ", data=" + data + "]";
	}
 
    
    
}


