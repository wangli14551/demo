package com.st.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.service.IRoleService;
import com.st.util.LayJson;

@Controller
@RequestMapping("/Role")
public class RoleController {
	@Autowired
	IRoleService roleservice;

	@RequestMapping("/role")
	public String role() {
		return "role";
	}

	@RequestMapping("/selRole")
	@ResponseBody
	public LayJson selRole(@RequestParam Map params) {
		System.out.println("controller执行----------selRole方法");
		List data = roleservice.selRole(params);
		return LayJson.layJson(data);
	}
}
