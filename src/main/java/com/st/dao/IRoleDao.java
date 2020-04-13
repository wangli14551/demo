package com.st.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("roledao")
public interface IRoleDao {
	List selRole(Map params);

}
