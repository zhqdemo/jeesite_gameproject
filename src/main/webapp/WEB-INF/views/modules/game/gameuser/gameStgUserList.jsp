<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
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
		<li class="active"><a href="${ctx}/game/gameuser/gameStgUser/">用户列表</a></li>
		<shiro:hasPermission name="game:gameuser:gameStgUser:edit"><li><a href="${ctx}/game/gameuser/gameStgUser/form">用户添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="gameStgUser" action="${ctx}/game/gameuser/gameStgUser/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>account：</label>
				<form:input path="account" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>用户名称：</label>
				<form:input path="username" htmlEscape="false" maxlength="60" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>account</th>
				<th>用户名称</th>
				<th>用户头像</th>
				<shiro:hasPermission name="game:gameuser:gameStgUser:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="gameStgUser">
			<tr>
				<td><a href="${ctx}/game/gameuser/gameStgUser/form?id=${gameStgUser.id}">
					${gameStgUser.account}
				</a></td>
				<td>
					${gameStgUser.username}
				</td>
				<td>
					<img src="${resourcepath}${gameStgUser.img}" onerror="this.src='${ctxStatic}/images/default.png'"  class="icon-list"/>
				</td>
				<shiro:hasPermission name="game:gameuser:gameStgUser:edit"><td>
    				<a href="${ctx}/game/gameuser/gameStgUser/form?id=${gameStgUser.id}">修改</a>
					<a href="${ctx}/game/gameuser/gameStgUser/delete?id=${gameStgUser.id}" onclick="return confirmx('确认要删除该用户吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>