package com.st.service;

import java.util.List;
import java.util.Map;

public interface IPermissionService {
	List selPerm();

	List selUserPerm(String str);

	List selPerm_list(Map params);
}
