package com.st.bean;

public class Customer {
	private String customer_id;
	private String customer_name;
	private String customer_man;
	private String customer_tel;
	private String customer_email;
	private String customer_address;
	private int state;
	private int customer_public;
	private String customer_grade;
	private String create_time;
	private String customer_user;

	public String getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_man() {
		return customer_man;
	}

	public void setCustomer_man(String customer_man) {
		this.customer_man = customer_man;
	}

	public String getCustomer_tel() {
		return customer_tel;
	}

	public void setCustomer_tel(String customer_tel) {
		this.customer_tel = customer_tel;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	public String getCustomer_address() {
		return customer_address;
	}

	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getCustomer_public() {
		return customer_public;
	}

	public void setCustomer_public(int customer_public) {
		this.customer_public = customer_public;
	}

	public String getCustomer_grade() {
		return customer_grade;
	}

	public void setCustomer_grade(String customer_grade) {
		this.customer_grade = customer_grade;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getCustomer_user() {
		return customer_user;
	}

	public void setCustomer_user(String customer_user) {
		this.customer_user = customer_user;
	}

	@Override
	public String toString() {
		return "Customer [customer_id=" + customer_id + ", customer_name=" + customer_name + ", customer_man="
				+ customer_man + ", customer_tel=" + customer_tel + ", customer_email=" + customer_email
				+ ", customer_address=" + customer_address + ", state=" + state + ", customer_public=" + customer_public
				+ ", customer_grade=" + customer_grade + ", create_time=" + create_time + ", customer_user="
				+ customer_user + "]";
	}

}
