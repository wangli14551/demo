package com.st.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

public class MySessionAttributeListener implements HttpSessionAttributeListener {
	/**
	 * 添加
	 */
	@Override
	public void attributeAdded(HttpSessionBindingEvent se) {
		// TODO Auto-generated method stub
		HttpSession session = se.getSession();
		ServletContext sc = session.getServletContext();
		// 如果存入的键值是login,在线人数+1，
		String key = se.getName();
		System.out.println("---------" + key);
		if ("sys".equals(key)) {
			// 在线人数+1
			int onlineCount = Integer.parseInt(sc.getAttribute("onlineCount").toString());
			onlineCount++;
			sc.setAttribute("onlineCount", onlineCount);
		}
	}

	/**
	 * 删除
	 */
	@Override
	public void attributeRemoved(HttpSessionBindingEvent se) {
		// TODO Auto-generated method stub
		HttpSession session = se.getSession();
		ServletContext sc = session.getServletContext();
		// 如果存入的键值是login,在线人数-1，
		String key = se.getName();
		System.out.println("---------" + key);
		if ("sys".equals(key)) {
			// 在线人数+1
			int onlineCount = Integer.parseInt(sc.getAttribute("onlineCount").toString());
			onlineCount--;
			sc.setAttribute("onlineCount", onlineCount);
		}
	}

	/**
	 * 修改
	 */
	@Override
	public void attributeReplaced(HttpSessionBindingEvent se) {
		// TODO Auto-generated method stub

	}

}
