package com.st.bean;

public class User_role {
	private String role_id;
	private String user_id;

	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "User_role [role_id=" + role_id + ", user_id=" + user_id + "]";
	}

}
