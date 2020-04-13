package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("customerDao")
public interface ICustomerDao {

	// 1.定义接口方法
	int insUser(Map params);

	int delUser(Map params);

	int updUser(Map params);

	List selUser(Map params);

	int getCount(Map params);

}