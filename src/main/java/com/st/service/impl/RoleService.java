package com.st.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.st.dao.IRoleDao;
import com.st.service.IRoleService;

@Service("roleservice")

public class RoleService implements IRoleService {
	@Autowired
	IRoleDao roledao;

	@Override
	public List selRole(Map params) {
		return roledao.selRole(params);
	}

}
