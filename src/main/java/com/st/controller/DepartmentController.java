package com.st.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.service.IDepartmentService;
import com.st.util.LayJson;

@Controller
@RequestMapping("/Department")
public class DepartmentController {

	@Autowired
	IDepartmentService departmentService;

	@RequestMapping("/department")
	public String department() {
		return "department";
	}

	@RequestMapping("/department_select")
	@ResponseBody
	public LayJson department_select(@RequestParam Map params) {
		System.out.println("controller执行----------department_select方法");
		List data = departmentService.selUser(params);
		int count = departmentService.getCount(params);
		return LayJson.layJson(count, data);
	}

	@RequestMapping("/department_insert")
	@ResponseBody
	public int department_insert(@RequestParam Map params) {
		System.out.println("controller执行----------department_insert方法");
		int int_zsg = departmentService.insUser(params);
		return int_zsg;
	}

	@RequestMapping("/department_update")
	@ResponseBody
	public int department_update(@RequestParam Map params) {
		System.out.println("controller执行----------department_update方法");
		int int_zsg = departmentService.updUser(params);
		return int_zsg;
	}

	@RequestMapping("/department_delete")
	@ResponseBody
	public int department_delete(@RequestParam Map params) {
		System.out.println("controller执行----------department_delete方法");
		int int_zsg = departmentService.delUser(params);
		return int_zsg;
	}

}
