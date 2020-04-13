package com.st.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.st.bean.Role;

public interface IUserService {
	// 在接口中定义好该接口需要完成的事情（方法）
	// 增删改查
	// 增
	int insUser(Map params);

	// 删
	int delUser(Map params);

	// 改
	int updUser(Map params);

	int updUser_up(Map params);

	int updUser_down(Map params);

	int updUser_role(Map params);

	// 查
	List selUser(Map params);

	List role_list(Map params);

	List selUser_pass(Map params);

	int getCount(Map params);
}
