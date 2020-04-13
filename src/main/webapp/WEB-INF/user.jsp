<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>用户列表</title>
<base href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="static/layui/css/layui.css" />
<link rel="stylesheet" type="text/css" href="static/css/index.css" />
</head>
<body>
	<!-- 内容主体区域 -->
	<div style="padding: 15px;">
		<div class="layui-form-item">
			<div class="layui-input-inline">
				<shiro:hasPermission name="user_sel">
					<input id="lay_text" type="text" name="title" required
						lay-verify="required" placeholder="输入手机号/用户名/性别"
						autocomplete="off" class="layui-input">
				</shiro:hasPermission>
			</div>

			<div class="layui-btn-group">
				<shiro:hasPermission name="user_sel">
					<button id="lay_select" type="button"
						class="layui-btn layui-btn-md">
						<i class="layui-icon">&#xe615;</i>搜索
					</button>
				</shiro:hasPermission>
				<button id="btn_refresh" type="button"
					class="layui-btn layui-btn-md">
					<i class="layui-icon">&#xe669;</i>刷新
				</button>
				<shiro:hasPermission name="user_ins">
					<button id="btn_insert" type="button"
						class="layui-btn layui-btn-md">
						<i class="layui-icon">&#xe654;</i>新增
					</button>
				</shiro:hasPermission>
				<shiro:hasPermission name="user_upd">
					<button id="btn_update" type="button"
						class="layui-btn layui-btn-md">
						<i class="layui-icon">&#xe642;</i>修改
					</button>
				</shiro:hasPermission>
				<shiro:hasPermission name="user_del">
					<button id="btn_delete" type="button"
						class="layui-btn layui-btn-md">
						<i class="layui-icon">&#xe640;</i>删除
					</button>
				</shiro:hasPermission>
				<button id="btn_role" type="button" class="layui-btn layui-btn-md">
					<i class="layui-icon"></i>分配角色
				</button>
			</div>
		</div>
		<div class="layui-form-item">
			<table class="layui-table"
				lay-data="{url:'User/user_select',id:'userlist',page:true ,toolbar: '#toolbarDemo'}"
				lay-filter="test">
				<thead>
					<tr>
						<th lay-data="{type:'checkbox'}"></th>
						<th lay-data="{field:'user_id'}">用户ID</th>
						<th lay-data="{field:'phonenum'}">手机号</th>
						<th lay-data="{field:'password'}">密码</th>
						<th lay-data="{field:'nickname'}">昵称</th>
						<th lay-data="{field:'sex'}">性别</th>
						<th lay-data="{field:'birthday'}">出生日期</th>
						<th
							lay-data="{field:'state',templet: function(d){if(d.state==1){return '已封号'}else{return '正常'}}}">状态</th>
						<th lay-data="{field:'createtime'}">注册时间</th>
						<th lay-data="{field:'lastlogintime'}">最后登录时间</th>
						<th lay-data="{field:'role_name'}">角色名</th>
						<th lay-data="{width:178, align:'center',templet: '#titleTpl'}">操作</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<div id="div_insert" hidden>
		<form id="form_insert" class="layui-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">手机号</label>
				<div class="layui-input-block">
					<input type="text" name="phonenum" required lay-verify="required"
						placeholder="请输入手机号" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-block">
					<input type="text" name="password" required lay-verify="required"
						placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">昵称</label>
				<div class="layui-input-block">
					<input type="text" name="nickname" required lay-verify="required"
						placeholder="请输入昵称" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<select name="sex" lay-verify="required">
						<option value="">请选择性别</option>
						<option value="男">男</option>
						<option value="女">女</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">出生日期</label>
				<div class="layui-input-block">
					<input id="div_date" type="text" name="birthday" required
						lay-verify="required" placeholder="yyyy-MM-dd" autocomplete="off"
						class="div_date layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button id="btn_insert_ajax" type="button" class="layui-btn">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</div>
	<div id="div_update" hidden>
		<form id="form_update" class="layui-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">用户ID</label>
				<div class="layui-input-block">
					<input id="i0" type="text" name="user_id" required
						lay-verify="required" autocomplete="off" class="layui-input"
						value="" readonly="readonly">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">手机号</label>
				<div class="layui-input-block">
					<input id="i1" type="text" name="phonenum" required
						lay-verify="required" autocomplete="off" class="layui-input"
						value="">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-block">
					<input id="i2" type="text" name="password" required
						lay-verify="required" autocomplete="off" class="layui-input"
						value="">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">昵称</label>
				<div class="layui-input-block">
					<input id="i3" type="text" name="nickname" required
						lay-verify="required" autocomplete="off" class="layui-input"
						value="">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-block">
					<input id="i4" type="text" name="sex" required
						lay-verify="required" autocomplete="off" class="layui-input"
						value="">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">出生日期</label>
				<div class="layui-input-block">
					<input id="i5" type="text" name="birthday" required
						lay-verify="required" autocomplete="off" class="layui-input"
						value="">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">状态</label>
				<div class="layui-input-block">
					<input id="i6" type="text" name="state" required
						lay-verify="required" autocomplete="off" class="layui-input"
						value="">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button id="btn_update_ajax" type="button" class="layui-btn">立即修改</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</div>
	<div id="div_role" hidden>
		<form id="form_role" class="layui-form" action="">
			<input id="r0" type="hidden" name="user_id" required
				lay-verify="required" autocomplete="off" class="layui-input"
				value="">
			<div class="layui-form-item">
				<label class="layui-form-label">手机号</label>
				<div class="layui-input-block">
					<input id="r1" type="text" name="phonenum" required
						lay-verify="required" autocomplete="off" class="layui-input"
						value="" readonly="readonly">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"></label>
				<div class="layui-input-block">
					<select id="r2" name="role_id" lay-verify="required">
						<!-- <option value=""></option> -->
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button id="btn_role_ajax" type="button" class="layui-btn">立即修改</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/html" id="titleTpl">
  {{#  if(d.state==0){ }}
    <a id="down_btn" class="layui-btn layui-btn-danger layui-btn-xs" lay-event="up">封号</a>
  {{#  } else { }}
	<a id="up_btn" class="layui-btn layui-btn-xs" lay-event="down">解封</a> 
  {{#  } }}
	</script>
	<script src="static/js/jquery-3.4.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="static/layui/layui.all.js" type="text/javascript"
		charset="utf-8"></script>
	<script>
		//JavaScript代码区域
		var table = layui.table;
		var laydate = layui.laydate;
		var form = layui.form;
		//日期时间选择器
		laydate.render({
			elem : '#div_date',
			type : 'date'
		});
		laydate.render({
			elem : '#i5',
			type : 'date'
		});
		//查数据
		//点击查询按钮
		$("#lay_select").click(function() {
			var lay_text = $("#lay_text").val();
			//数据表格重载
			table.reload("userlist", {
				url : "User/user_select",
				where : {
					"lay_text" : lay_text,
					"page" : "1"
				},
				done : function(d) {
					this.where = {};
				}
			});
		});
		$("#btn_refresh").click(function() {
			$("#lay_text").val("");
			//数据表格重载
			table.reload("userlist", {
				url : "User/user_select",
			});
		});
		//弹出层--新增用户
		$("#btn_insert").click(function() {
			layer.open({
				type : 1,
				title : "新增用户",
				area : [ '600px', '460px' ],
				shadeClose : true, //点击遮罩关闭
				id : "insert",
				content : $('#div_insert'),
			});
		});
		//向后台传输新用户数据
		$("#btn_insert_ajax").click(function() {
			$.ajax({
				type : "POST",
				url : "User/user_insert",
				dataType : "json",
				data : $('#form_insert').serialize(),
				success : function(d) {
					//alert("success");
					//数据表格重载
					table.reload("userlist", {
						url : "User/user_select",
					});
					layer.msg("成功新增" + d + "位用户");
					layer.closeAll('page');
				},
				error : function(d) {
					alert("error");
					console.log(d);
				}
			});
		});
		//监听行单击事件（双击事件为：rowDouble）
		var row_data;
		table.on('row(test)', function(obj) {
			var data = obj.data;
			row_data = data;
			console.log(row_data);
		});
		//监听工具条
		table.on('tool(test)', function(obj) {
			if (obj.event === 'up') {
				layer.confirm('对该用户封号', function(index) {
					$.ajax({
						type : "POST",
						url : "User/user_update_up",
						dataType : "json",
						data : row_data,
						success : function(d) {
							//alert("success");
							console.log(d);
							//数据表格重载
							table.reload("userlist", {
								url : "User/user_select",
							});
							layer.msg("封号成功");
						},
						error : function(d) {
							alert("error");
							console.log(d);
						}
					});
					layer.close(index);
				});
			} else if (obj.event === 'down') {
				layer.confirm('对该用户解封', function(index) {
					$.ajax({
						type : "POST",
						url : "User/user_update_down",
						dataType : "json",
						data : row_data,
						success : function(d) {
							//alert("success");
							console.log(d);
							//数据表格重载
							table.reload("userlist", {
								url : "User/user_select",
							});
							layer.msg("解封成功");
						},
						error : function(d) {
							alert("error");
							console.log(d);
						}
					});
					layer.close(index);
				});
			}
		});
		//监听表格复选框选择
		var cdl = 0;
		var cd = null;
		table.on('checkbox(test)', function(obj) {
			var checkStatus = table.checkStatus('userlist');
			//console.log(obj);
			//console.log(obj.data);//选中行的相关数据
			console.log(obj.checked); //当前是否选中状态
			console.log(checkStatus.data);//获取选中行数据--json格式
			console.log(checkStatus.data.length);//获取选中数目
			cdl = checkStatus.data.length;
			cd = checkStatus.data
			//layer.alert((JSON.stringify(checkStatus.data)));
		});
		//弹出层--修改用户
		$("#btn_update").click(function() {
			if (cdl == 0) {
				//未选择复选框点击按钮，给与提示
				layer.msg('请先选择用户');
			} else if (cdl > 1) {
				layer.msg('不允许同时修改');
				//layer.tips('只允许一个修改一个值', '#btn_update');
			} else {
				layer.open({
					type : 1,
					title : "修改用户",
					area : [ '600px', '460px' ],
					shadeClose : true, //点击遮罩关闭
					id : "update",
					content : $('#div_update'),
				});
				$("#i0").val(cd[0].user_id);
				$("#i1").val(cd[0].phonenum);
				$("#i2").val(cd[0].password);
				$("#i3").val(cd[0].nickname);
				$("#i4").val(cd[0].sex);
				$("#i5").val(cd[0].birthday);
				$("#i6").val(cd[0].state);
			}
		});
		//向后台传输修改用户信息
		$("#btn_update_ajax").click(function() {
			$.ajax({
				type : "POST",
				url : "User/user_update",
				dataType : "json",
				data : $('#form_update').serialize(),
				success : function(d) {
					//alert("success");
					//数据表格重载
					table.reload("userlist", {
						url : "User/user_select",
					});
					layer.msg("成功修改" + d + "位用户");
					layer.closeAll('page');
				},
				error : function(d) {
					alert("error");
					console.log(d);
				}
			});
		});
		//删除用户
		$("#btn_delete").click(function() {
			if (cdl == 0) {
				layer.msg('请先选择用户');
			} else {
				//alert(cdl + "-----");
				layer.confirm('您确定要删除该用户吗?', {
					btn : [ '确定', '取消' ],
					title : "提示"
				}, function() {
					var str = "";
					for (var i = 0; i < cdl; i++) {
						if (i < cdl - 1) {
							str += cd[i].user_id + ",";
						} else {
							str += cd[i].user_id;
						}
					}
					//alert(str);
					//向后台传输删除用户的id
					$.ajax({
						type : "post",
						url : "User/user_delete",
						dataType : "json",
						data : {
							"user_id" : str
						},
						success : function(d) {
							//alert("success");
							//数据表格重载
							table.reload("userlist", {
								url : "User/user_select",
							});
							layer.msg("成功删除" + d + "位用户");
							layer.closeAll('page');
						},
						error : function(d) {
							alert("error");
							console.log(d);
						}
					});
				});
			}
		});
		//弹出层--分配角色
		$("#btn_role")
				.click(
						function() {
							if (cdl == 0) {
								//未选择复选框点击按钮，给与提示
								layer.msg('请先选择用户');
							} else if (cdl > 1) {
								layer.msg('不允许同时修改');
								//layer.tips('只允许一个修改一个值', '#btn_update');
							} else {
								layer.open({
									type : 1,
									title : "分配角色",
									area : [ '600px', '460px' ],
									shadeClose : true, //点击遮罩关闭
									id : "role",
									content : $('#div_role'),
								});
								$("#r0").val(cd[0].user_id);
								$("#r1").val(cd[0].phonenum);
								//ajax动态获取下拉框内容
								$
										.ajax({
											type : "POST",
											url : "User/role_list",
											dataType : "json",
											success : function(d) {
												//alert("success");
												console.log(d.data + "----");
												//删除之前添加的内容
												$("#r2").empty();
												for (var i = 0; i < d.data.length; i++) {
													console.log(d.data[i]);
													//添加已选内容
													if (cd[0].role_name == d.data[i].role_name) {
														$("#r2")
																.append(
																		"<option selected='selected' value="+d.data[i].role_id+">"
																				+ d.data[i].role_name
																				+ "</option>");
													} else {
														$("#r2")
																.append(
																		"<option value='"+d.data[i].role_id+"'>"
																				+ d.data[i].role_name
																				+ "</option>");
													}

												}
												form.render();
											},
											error : function(d) {
												alert("error");
												console.log(d);
											}
										});
							}
						});
		//向后台传输修改用户信息
		$("#btn_role_ajax").click(function() {
			console.log("--------------");
			$.ajax({
				type : "POST",
				url : "User/user_role_update",
				dataType : "json",
				data : $('#form_role').serialize(),
				success : function(d) {
					//alert("success");
					console.log(1111);
					//数据表格重载
					table.reload("userlist", {
						url : "User/user_select",
					});
					layer.msg("成功修改" + d + "位用户");
					layer.closeAll('page');
				},
				error : function(d) {
					alert("error");
					console.log(d);
				}
			});
		});
	</script>
</body>
</html>
