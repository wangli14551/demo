package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("userDao")
public interface IUserDao {

	// 1.定义接口方法
	int insUser(Map params);

	int insUser_role(Map params);

	int delUser(Map params);

	int updUser(Map params);

	int updUser_role(Map params);

	List selUser_role(Map params);

	List selUser(Map params);

	List selUser_pass(Map params);

	int getCount(Map params);

}