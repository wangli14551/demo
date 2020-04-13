package com.st.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyServletContextListener implements ServletContextListener {

	@Override
	// 初始化时
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		// 获取context对象
		ServletContext sc = sce.getServletContext();
		sc.setAttribute("onlineCount", 0);

	}

	@Override
	// 摧毁时
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub

	}

}
