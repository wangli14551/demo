<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>管理员 - 登录</title>
<link rel="stylesheet" type="text/css" href="static/css/admin_login.css" />
</head>
<body>
	<div class="div_app">
		<div class="div_top">
			<div class="div_logo">
				<img src="static/img/管理员登录图标.jpg">
			</div>
		</div>
		<div class="div_home">
			<a href="javascrpt:;"><img src="static/img/管理员登录背景.jfif"></a>
			<div class="div_dl_1">
				<div class="div_dl_2">
					<div class="div_dl_3">
						<div>
							<a id="div_dl_3_zhuce" href="">管理员登录</a> <span>|</span> <a
								href="">扫码登录</a>
						</div>
					</div>
					<div class="div_dl_4">
						<div class="div_dl_5">
							<form action="login_admin_action" method="post">
								<div class="div_dl_6">
									<input type="text" name="phonenum"
										lay-verify="required|norepeat" placeholder="邮箱/手机号码/小米ID" />
									<input type="password" name="password"
										lay-verify="required|norepeat" placeholder="密码" />
								</div>
								<div class="div_dl_7">
									<input type="submit" value="登录" />
								</div>
							</form>
							<div class="div_dl_8">
								<a id="div_dl_8_click" href="javascript:;"></a>
								<div class="div_dl_9">
									<a id="zzmm" href="javascript:;">重置密码</a>
								</div>
								<div class="div_dl_10">
									<span class="line"></span> <span class="text">其他方式登录</span> <span
										class="line"></span>
									<div>
										<div>
											<a href=""><img src="static/img/登录图标/qq图标.png"></a> <a
												href=""><img src="static/img/登录图标/微博图标.png"></a> <a
												href=""><img src="static/img/登录图标/支付宝图标.png"></a> <a
												href=""><img src="static/img/登录图标/微信图标.png"></a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="div_botton">
			<div>
				<ul>
					<li><a href="">简体</a>|</li>
					<li><a href="">繁体</a>|</li>
					<li><a href="">English</a>|</li>
					<li><a href="">常见问题</a>|</li>
					<li><a href="">隐私政策</a></li>
				</ul>
			</div>
			<p>
				小米公司版权所有-京ICP备10046444-<a href=""><span><img
						src="static/img/登录图标/国徽.png"></span>京公网安备11010802020134号</a>-京ICP证110507号
			</p>
		</div>
	</div>
	<script src="static/js/jquery-3.4.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="static/layui/layui.all.js" type="text/javascript"
		charset="utf-8"></script>
	<script type="text/javascript">
		//错误提示
		<c:if test="${not empty log_msg}">
		layer.msg("${log_msg}");
	<%session.removeAttribute("log_msg");%>
		</c:if>

		<c:if test="${not empty reg_msg}">
		alert("${reg_msg}");
		</c:if>

		$("#zzmm").click(function() {
			layer.msg("重置密码为123456");
		});
		/* form.verify({
			norepeat:funcation(value,item){
				var msg="";
				$.ajax({
					url:"login?param=norepeat",
					data:"username="+value,
					async:false,
					success:function(d){
					//0-数据库中没有重复的信息
					//1-数据库中已经有此信息
						if(d==1){
							msg="用户名已被占用";		
						}
					};
				return msg;
				})
			}
		}) */
	</script>
</body>
</html>
