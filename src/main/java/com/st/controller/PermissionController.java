package com.st.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.service.IPermissionService;
import com.st.util.LayJson;

@Controller
@RequestMapping("/Permission")
public class PermissionController {
	@Autowired
	IPermissionService permservice;

	@RequestMapping("/permission")
	public String perm() {
		return "permission";
	}

	@RequestMapping("/selPerm")
	@ResponseBody
	public List selPerm() {
		List list = permservice.selPerm();
		System.out.println(list);
		return list;
	}

	@RequestMapping("/selPerm_list")
	@ResponseBody
	public LayJson selPerm_list(@RequestParam Map params) {
		List list = permservice.selPerm_list(params);
		System.out.println(list);
		return LayJson.layJson(list);
	}
}
