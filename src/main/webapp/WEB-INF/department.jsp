<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>部门列表</title>
<base href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="static/layui/css/layui.css" />
<link rel="stylesheet" type="text/css" href="static/css/index.css" />
</head>
<body>
	<!-- 内容主体区域 -->
	<div style="padding: 15px;">
		<div class="layui-form-item">
			<div class="layui-input-inline">
				<input id="lay_text" type="text" name="title" required
					lay-verify="required" placeholder="输入部门名" autocomplete="off"
					class="layui-input">
			</div>

			<div class="layui-btn-group">
				<button id="lay_select" type="button" class="layui-btn layui-btn-md">
					<i class="layui-icon">&#xe615;</i>搜索
				</button>
				<button id="btn_refresh" type="button"
					class="layui-btn layui-btn-md">
					<i class="layui-icon">&#xe669;</i>刷新
				</button>
				<button id="btn_insert" type="button" class="layui-btn layui-btn-md">
					<i class="layui-icon">&#xe654;</i>新增
				</button>
				<button id="btn_update" type="button" class="layui-btn layui-btn-md">
					<i class="layui-icon">&#xe642;</i>修改
				</button>
				<button id="btn_delete" type="button" class="layui-btn layui-btn-md">
					<i class="layui-icon">&#xe640;</i>删除
				</button>
			</div>
		</div>
		<div class="layui-form-item">
			<table class="layui-table"
				lay-data="{url:'Department/department_select',id:'userlist',page:true,toolbar: '#toolbarDemo'}"
				lay-filter="test">
				<thead>
					<tr>
						<th lay-data="{type:'checkbox'}"></th>
						<th lay-data="{field:'departid',sort: true}">部门ID</th>
						<th lay-data="{field:'departname'}">部门</th>
						<th lay-data="{field:'createtime'}">创建时间</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<div id="div_insert" hidden>
		<form id="form_insert" class="layui-form" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">部门</label>
				<div class="layui-input-block">
					<input type="text" name="departname" required lay-verify="required"
						placeholder="请输入部门" autocomplete="off" class="layui-input">
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
					<input id="i1" type="text" name="departid" required
						lay-verify="required" autocomplete="off" class="layui-input"
						value="" readonly="readonly">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">部门</label>
				<div class="layui-input-block">
					<input id="i2" type="text" name="departname" required
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
	<script src="static/js/jquery-3.4.1.min.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="static/layui/layui.all.js" type="text/javascript"
		charset="utf-8"></script>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;
		});
		//查数据
		var table = layui.table;
		//点击查询按钮
		$("#lay_select").click(function() {
			var lay_text = $("#lay_text").val();
			//数据表格重载
			table.reload("userlist", {
				url : "Department/department_select",
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
				url : "Department/department_select",
			});
		});
		//弹出层--新增部门
		$("#btn_insert").click(function() {
			layer.open({
				type : 1,
				title : "新增部门",
				area : [ '600px', '460px' ],
				shadeClose : true, //点击遮罩关闭
				content : $('#div_insert'),
			});
		});
		//向后台传输新部门数据
		$("#btn_insert_ajax").click(function() {
			$.ajax({
				type : "POST",
				url : "Department/department_insert",
				dataType : "json",
				data : $('#form_insert').serialize(),
				success : function(d) {
					//alert("success");
					//数据表格重载
					table.reload("userlist", {
						url : "Department/department_select",
					});
					layer.msg("成功新增" + d.代码执行行数 + "个部门");
					layer.closeAll('page');
				},
				error : function(d) {
					alert("error");
					console.log(d);
				}
			});

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
				$("#i1").val(cd[0].departid);
				$("#i2").val(cd[0].departname);
				//向后台传输修改部门信息
				$("#btn_update_ajax").click(function() {
					$.ajax({
						type : "POST",
						url : "Department/department_update",
						dataType : "json",
						data : $('#form_update').serialize(),
						success : function(d) {
							//alert("success");
							//数据表格重载
							table.reload("userlist", {
								url : "Department/department_select",
							});
							layer.msg("成功修改" + d.代码执行行数 + "个部门");
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
		//删除部门
		$("#btn_delete").click(function() {
			if (cdl == 0) {
				layer.msg('请先选择用户');
			} else {
				//alert(cdl + "-----");
				layer.confirm('您确定要删除该用户吗?', {
					btn : [ '确定', '取消' ],
					title : "提示"
				}, function() {
					var str = [];
					for (var i = 0; i < cdl; i++) {
						if (i < cdl - 1) {
							str += cd[i].departid + ",";
						} else {
							str += cd[i].departid;
						}
					}
					//alert(str);
					//向后台传输删除用户的id
					$.ajax({
						type : "post",
						url : "Department/department_delete",
						dataType : "json",
						data : {
							"departid" : str
						},
						success : function(d) {
							//alert("success");
							//数据表格重载
							table.reload("userlist", {
								url : "Department/department_select",
							});
							layer.msg("成功删除" + d.代码执行行数 + "个部门");
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
	</script>
</body>
</html>
