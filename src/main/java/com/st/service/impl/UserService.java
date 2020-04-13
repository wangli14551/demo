package com.st.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.IRoleDao;
import com.st.dao.IUserDao;
import com.st.service.IUserService;
import com.st.util.PageUtil;

@Service("userService")
public class UserService implements IUserService {
	@Autowired
	IUserDao userDao;
	@Autowired
	IRoleDao roleDao;

	@Override
	public int insUser(Map params) {
		return userDao.insUser(params);
	}

	@Override
	public int delUser(Map params) {
		return userDao.delUser(params);
	}

	@Override
	public int updUser(Map params) {
		if (params.get("birthday").equals("")) {
			params.put("birthday", null);
		}
		return userDao.updUser(params);
	}

	@Override
	public int updUser_role(Map params) {
		List list = userDao.selUser_role(params);
		System.out.println(list + "---");
		if (list.size() == 0) {
			System.out.println(1);
			return userDao.insUser_role(params);
		} else {
			System.out.println(2);
			return userDao.updUser_role(params);
		}
	}

	@Override
	public int updUser_up(Map params) {
		return userDao.updUser(params);
	}

	@Override
	public int updUser_down(Map params) {
		return userDao.updUser(params);
	}

	public List selUser(Map params) {
		return userDao.selUser(PageUtil.pageParams(params));
	}

	@Override
	public List selUser_pass(Map params) {
		return userDao.selUser_pass(params);
	}

	@Override
	public int getCount(Map params) {
		return userDao.getCount(params);
	}

	@Override
	public List role_list(Map params) {
		return roleDao.selRole(params);
	}

}
