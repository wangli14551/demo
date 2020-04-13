package com.st.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.st.service.ICustomerService;
import com.st.service.IUserService;
import com.st.util.LayJson;

@Controller
@RequestMapping("/Customer")
public class CustomerController {

	@Autowired
	ICustomerService customerService;

	@RequestMapping("/customer")
	public String user() {
		return "customer";
	}

	@RequestMapping("/user_select")
	@ResponseBody
	public LayJson user_select(@RequestParam Map params) {
		System.out.println("controller执行----------user_select方法");
		List data = customerService.selUser(params);
		int count = customerService.getCount(params);
		System.out.println(data + "-----");
		return LayJson.layJson(count, data);
	}

	@RequestMapping("/user_insert")
	@ResponseBody
	public int user_insert(@RequestParam Map params) {
		System.out.println("controller执行----------user_insert方法");
		System.out.println(params);
		int int_zsg = customerService.insUser(params);
		return int_zsg;
	}

	@RequestMapping("/user_update")
	@ResponseBody
	public int user_update(@RequestParam Map params) {
		System.out.println("controller执行----------user_update方法");
		System.out.println(params);
		int int_zsg = customerService.updUser(params);
		return int_zsg;
	}

	@RequestMapping("/user_update_up")
	@ResponseBody
	public int user_update_up(@RequestParam Map params) {
		System.out.println(params);
		System.out.println(params.put("state", 1));
		System.out.println("controller执行----------user_update_up方法");
		int int_zsg = customerService.updUser_up(params);
		return int_zsg;
	}

	@RequestMapping("/user_update_down")
	@ResponseBody
	public int user_update_down(@RequestParam Map params) {
		System.out.println(params);
		System.out.println(params.put("state", 0));
		System.out.println("controller执行----------user_update_down方法");
		int int_zsg = customerService.updUser_down(params);
		return int_zsg;
	}

	@RequestMapping("/user_delete")
	@ResponseBody
	public int user_delete(@RequestParam Map params) {
		System.out.println("controller执行----------user_delete方法");
		int int_zsg = customerService.delUser(params);
		return int_zsg;
	}

}
