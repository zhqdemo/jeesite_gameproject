<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>分类信息管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
			var data = ${fns:toJson(list)}, ids = [], rootIds = [];
			for (var i=0; i<data.length; i++){
				ids.push(data[i].id);
			}
			ids = ',' + ids.join(',') + ',';
			for (var i=0; i<data.length; i++){
				if (ids.indexOf(','+data[i].parentId+',') == -1){
					if ((','+rootIds.join(',')+',').indexOf(','+data[i].parentId+',') == -1){
						rootIds.push(data[i].parentId);
					}
				}
			}
			for (var i=0; i<rootIds.length; i++){
				addRow("#treeTableList", tpl, data, rootIds[i], true);
			}
			$("#treeTable").treeTable({expandLevel : 1});
		});
		function addRow(list, tpl, data, pid, root){
			for (var i=0; i<data.length; i++){
				var row = data[i];
				if ((${fns:jsGetVal('row.parentId')}) == pid){
					$(list).append(Mustache.render(tpl, {
						dict: {
						blank123:0}, pid: (root?0:pid), row: row
					}));
					addRow(list, tpl, data, row.id);
				}
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/zhq/zhqCategory/">分类信息列表</a></li>
		<shiro:hasPermission name="zhq:zhqCategory:edit"><li><a href="${ctx}/zhq/zhqCategory/form">分类信息添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="zhqCategory" action="${ctx}/zhq/zhqCategory/" method="post" class="breadcrumb form-search">
		<ul class="ul-form">
			<li><label>分类名字：</label>
				<form:input path="name" htmlEscape="false" maxlength="200" class="input-medium"/>
			</li>
			<li><label>识别码：</label>
				<form:input path="code" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="treeTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>分类名字</th>
				<th>配图</th>
				<th>识别码</th>
				<th>级别</th>
				<th>排序</th>
				<th>更新时间</th>
				<shiro:hasPermission name="zhq:zhqCategory:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody id="treeTableList"></tbody>
	</table>
	<script type="text/template" id="treeTableTpl">
		<tr id="{{row.id}}" pId="{{pid}}">
			<td><a href="${ctx}/zhq/zhqCategory/form?id={{row.id}}">
				{{row.name}}
			</a></td>
			<td>
				<img src="${resourcepath}{{row.img}}" onerror="this.src='${ctxStatic}/images/default.png'"  class="icon-list"/>
			</td>
			<td>
				{{row.code}}
			</td>
			<td>
				{{row.level}}
			</td>
			<td>
				{{row.sort}}
			</td>
			<td>
				{{row.updateDate}}
			</td>
			<shiro:hasPermission name="zhq:zhqCategory:edit"><td>
   				<a href="${ctx}/zhq/zhqCategory/form?id={{row.id}}">修改</a>
				<a href="${ctx}/zhq/zhqCategory/delete?id={{row.id}}" onclick="return confirmx('确认要删除该分类信息及所有子分类信息吗？', this.href)">删除</a>
				<a href="${ctx}/zhq/zhqCategory/form?parent.id={{row.id}}">添加下级分类信息</a> 
			</td></shiro:hasPermission>
		</tr>
	</script>
</body>
</html>