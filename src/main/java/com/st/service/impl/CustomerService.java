package com.st.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.ICustomerDao;
import com.st.service.ICustomerService;
import com.st.service.IUserService;
import com.st.util.PageUtil;

@Service("customerService")
public class CustomerService implements ICustomerService {
	@Autowired
	ICustomerDao customerDao;

	@Override
	public int insUser(Map params) {
		return customerDao.insUser(params);
	}

	@Override
	public int delUser(Map params) {
		return customerDao.delUser(params);
	}

	@Override
	public int updUser(Map params) {
		if (params.get("birthday").equals("")) {
			params.put("birthday", null);
		}
		return customerDao.updUser(params);
	}

	@Override
	public int updUser_up(Map params) {
		return customerDao.updUser(params);
	}

	@Override
	public int updUser_down(Map params) {
		return customerDao.updUser(params);
	}

	public List selUser(Map params) {
		return customerDao.selUser(PageUtil.pageParams(params));
	}

	@Override
	public int getCount(Map params) {
		return customerDao.getCount(params);
	}

}
