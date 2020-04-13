package com.st.util;

import java.util.Map;

public class PageUtil {

	// 通过页码和每页的个数计算出开始位置
	public static Map pageParams(Map params) {
		String page = params.get("page") + "";
		String limit = params.get("limit") + "";

		int page_i = Integer.parseInt(page);
		int limit_i = Integer.parseInt(limit);
		int start = limit_i * (page_i - 1);

		params.put("start", start);
		System.out.println("PageUtil处理后----------" + params);
		return params;
	}
}
