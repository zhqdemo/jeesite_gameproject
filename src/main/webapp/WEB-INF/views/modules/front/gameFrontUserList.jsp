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
		<li class="active"><a href="${ctx}/front/gameFrontUser/">用户列表</a></li>
		<shiro:hasPermission name="front:gameFrontUser:edit"><li><a href="${ctx}/front/gameFrontUser/form">用户添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="gameFrontUser" action="${ctx}/front/gameFrontUser/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>帐号：</label>
				<form:input path="account" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>状态：</label>
				<form:select path="state" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('game_frontuser_state')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label style="width: 120px">最后登录时间：</label>
				<input name="beginLastLogintime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="${gameFrontUser.beginLastLogintime}"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/> - 
				<input name="endLastLogintime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="${gameFrontUser.endLastLogintime}"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>帐号</th>
				<th>邮箱</th>
				<th>电话</th>
				<th>状态</th>
				<th>更新时间</th>
				<shiro:hasPermission name="front:gameFrontUser:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="gameFrontUser">
			<tr>
				<td><a href="${ctx}/front/gameFrontUser/form?id=${gameFrontUser.id}">
					${gameFrontUser.account}
				</a></td>
				<td>
					${gameFrontUser.email}
				</td>
				<td>
					${gameFrontUser.telphone}
				</td>
				<td>
					${fns:getDictLabel(gameFrontUser.state, 'game_frontuser_state', '')}
				</td>
				<td>
					<fmt:formatDate value="${gameFrontUser.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<shiro:hasPermission name="front:gameFrontUser:edit"><td>
    				<a href="${ctx}/front/gameFrontUser/form?id=${gameFrontUser.id}">修改</a>
					<a href="${ctx}/front/gameFrontUser/delete?id=${gameFrontUser.id}" onclick="return confirmx('确认要删除该用户吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>