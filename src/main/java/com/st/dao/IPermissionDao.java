package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("permdao")
public interface IPermissionDao {
	List selPerm();

	List selUserPerm(String str);

	List selPerm_list(Map params);
}
