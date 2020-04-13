package com.st.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.bean.Department;
import com.st.bean.Role;
import com.st.dao.IDepartmentDao;
import com.st.service.IDepartmentService;
import com.st.util.PageUtil;

@Service("departmentService")
public class DepartmentService implements IDepartmentService {
	@Autowired
	IDepartmentDao departmentDao;

	@Override
	public int insUser(Map params) {
		return departmentDao.insUser(params);
	}

	@Override
	public int delUser(Map params) {
		return departmentDao.delUser(params);
	}

	@Override
	public int updUser(Map params) {
		return departmentDao.updUser(params);
	}

	@Override
	public List selUser(Map params) {
		return departmentDao.selUser(PageUtil.pageParams(params));
	}

	@Override
	public int getCount(Map params) {
		return departmentDao.getCount(params);
	}

}
