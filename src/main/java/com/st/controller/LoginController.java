package com.st.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
	@RequestMapping("/login_admin")
	public String login_admin() {
		return "login_admin";
	}

	@RequestMapping("/login_admin_action")
	public String login_admin_action(String phonenum, String password) {
		// 获取当前访问用户的对象
		Subject subject = SecurityUtils.getSubject();
		System.out.println(subject);
		// 使用用户名和密码生成安全令牌
		UsernamePasswordToken token = new UsernamePasswordToken(phonenum, password);
		// 认证登录--执行realm
		try {
			subject.login(token);
		} catch (UnknownAccountException uae) {
			return "未知账户";
		} catch (IncorrectCredentialsException ice) {
			return "密码不正确";
		} catch (LockedAccountException lae) {
			return "账户已锁定";
		} catch (ExcessiveAttemptsException eae) {
			return "用户名或密码错误次数过多";
		} catch (AuthenticationException ae) {
			return "用户名或密码不正确！";
		}
		if (subject.isAuthenticated()) {
			return "iframe";
		} else {
			token.clear();
			return "登录失败";
		}
	}

	@RequestMapping("/iframe")
	@ResponseBody
	public int iframe(HttpServletRequest req) {
		// int int_onlineCount = (int)
		// req.getSession().getServletContext().getAttribute("onlineCount");
		return 10;
	}
}
