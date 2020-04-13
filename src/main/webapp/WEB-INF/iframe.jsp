<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>layout 后台大布局 - Layui</title>
<link rel="stylesheet" type="text/css" href="static/layui/css/layui.css" />
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo">layui 后台布局</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<!-- <ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="">控制台</a></li>
				<li class="layui-nav-item"><a href="">商品管理</a></li>
				<li class="layui-nav-item"><a href="">用户</a></li>
				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">邮件管理</a>
						</dd>
						<dd>
							<a href="">消息管理</a>
						</dd>
						<dd>
							<a href="">授权管理</a>
						</dd>
					</dl></li>
			</ul> -->
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="static/img/登录图标/国徽.png" class="layui-nav-img">${sys.getNickname()}</a>
					<dl class="layui-nav-child">
						<dd>
							<a id="a_select" href="javascript:;">用户资料</a>
						</dd>
						<dd>
							<a id="a_pass_update" href="javascript:;">修改密码</a>
						</dd>
					</dl></li>
				<li id="exit" class="layui-nav-item"><a href="javascript:;">退了</a></li>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item"><a href="javascript:;"
						page="User/user">用户管理</a></li>
					<li class="layui-nav-item"><a href="javascript:;"
						page="Department/department">部门管理</a></li>
					<li class="layui-nav-item"><a href="javascript:;"
						page="Role/role">角色管理</a></li>
					<li class="layui-nav-item"><a href="javascript:;"
						page="Permission/permission">权限管理</a></li>
					<li class="layui-nav-item"><a href="javascript:;"
						page="Customer/customer">客户管理</a></li>

				</ul>
			</div>
		</div>

		<div class="layui-body">
			<!-- 内容主体区域 -->
			<iframe style="height: 98%; width: 100%;" src=""></iframe>
		</div>
		<div class="layui-footer">
			<!-- 底部固定区域 -->
			<div>
				在线人数：<span id="online">${onlineCount}</span>人
			</div>
		</div>
	</div>
	<script src="static/js/jquery-3.4.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="static/layui/layui.all.js" type="text/javascript"
		charset="utf-8"></script>
	<script>
		//JavaScript代码区域
		var $ = layui.jquery;
		//点击一个含有page属性的标签，让iframe标签的显示的页面发生变化，变成当前被点击的标签的page属性
		$("[page]").click(function() {
			$("iframe").attr("src", $(this).attr("page"));
		});
		//每个3秒获取一次在线人数
		/* setInterval(function() {
			$.ajax({
				type : "POST",
				url : "iframe",
				success : function(d) {
					console.log(d);
					$("#online").text(d.在线人数);
				},
				error : function(d) {
					//alert(1);
				}
			});
		}, 3000); */
		$("#exit").click(function() {
			layer.confirm('真的退出么', {
				btn : [ '确定', '取消' ],
				title : "提示"
			}, function() {
				$.post("exit");
				location.href = "admin_login";
			});
		});
	</script>
</body>
</html>
