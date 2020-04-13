package com.st.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.IPermissionDao;
import com.st.service.IPermissionService;

@Service("permservice")

public class PermissionService implements IPermissionService {
	@Autowired
	IPermissionDao permdao;

	@Override
	public List selPerm() {
		return permdao.selPerm();
	}

	@Override
	public List selUserPerm(String str) {
		return permdao.selUserPerm(str);
	}

	@Override
	public List selPerm_list(Map params) {
		return permdao.selPerm_list(params);
	}
}
