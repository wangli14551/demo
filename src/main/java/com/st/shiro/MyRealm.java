package com.st.shiro;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.st.bean.User;
import com.st.bean.UserPerm;
import com.st.service.IPermissionService;
import com.st.service.IUserService;

public class MyRealm extends AuthorizingRealm {
	@Autowired
	IPermissionService permservice;
	@Autowired
	IUserService userservice;

	@Override
	// 授权
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String phonenum = (String) SecurityUtils.getSubject().getPrincipal();
		SimpleAuthorizationInfo sai = new SimpleAuthorizationInfo();
		List<UserPerm> list = permservice.selUserPerm(phonenum);
		// 需要一个字符串的集合
		List<String> str_perm_list = new ArrayList<String>();
		for (UserPerm role : list) {
			str_perm_list.add(role.getPerm_code());
		}
		sai.addStringPermissions(str_perm_list);
		return sai;
	}

	@Override
	// 认证
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		System.out.println("-------身份认证方法--------");
		// 获得用户名和密码
		String phonenum = (String) token.getPrincipal();
		System.out.println(phonenum);
		String password = new String((char[]) token.getCredentials());
		System.out.println(password);
		// 根据用户名从数据库获取密码
		String newPassword = new SimpleHash("md5", password, phonenum + "salt", 2).toHex();
		System.out.println(newPassword);
		Map params = new HashMap();
		params.put("phonenum", phonenum);
		List<User> list = userservice.selUser_pass(params);
		String password2 = list.get(0).getPassword();
		if (phonenum == null) {
			throw new AccountException("用户名不正确");
		} else if (!password.equals(password2)) {
			throw new AccountException("密码不正确");
		}
		// authenticationInfo信息交个shiro，调用login的时候会自动比较这里的token和authenticationInfo
		return new SimpleAuthenticationInfo(phonenum, password2, getName());
	}

}
