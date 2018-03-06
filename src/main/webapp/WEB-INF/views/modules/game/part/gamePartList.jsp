<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>物品管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/game/part/gamePart/">物品列表</a></li>
		<shiro:hasPermission name="game:part:gamePart:edit"><li><a href="${ctx}/game/part/gamePart/form">物品添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="gamePart" action="${ctx}/game/part/gamePart/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>物品名称</th>
				<th>物品类型</th>
				<th>物品状态</th>
				<shiro:hasPermission name="game:part:gamePart:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="gamePart">
			<tr>
				<td><a href="${ctx}/game/part/gamePart/form?id=${gamePart.id}">
					${gamePart.partName}
				</a></td>
				<td>
					${gamePart.partType}
				</td>
				<td>
					${gamePart.partState}
				</td>
				<shiro:hasPermission name="game:part:gamePart:edit"><td>
    				<a href="${ctx}/game/part/gamePart/form?id=${gamePart.id}">修改</a>
					<a href="${ctx}/game/part/gamePart/delete?id=${gamePart.id}" onclick="return confirmx('确认要删除该物品吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>