package com.st.util;

import java.util.List;

public class LayJson {

	private int code = 0;
	private String msg = "";
	private int count = 0;
	private List data = null;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public List getData() {
		return data;
	}

	public void setData(List data) {
		this.data = data;
	}

	public static LayJson layJson(int count, List data) {
		LayJson json = new LayJson();
		json.setCount(count);
		json.setData(data);
		System.out.println("LayJson处理后----------" + json);
		return json;
	}

	public static LayJson layJson(List data) {
		LayJson json = new LayJson();
		json.setCount(data.size());
		json.setData(data);
		System.out.println("LayJson处理后----------" + json);
		return json;
	}
}
