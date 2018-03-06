<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/game/gameuser/gameStgUser/">用户列表</a></li>
		<li class="active"><a href="${ctx}/game/gameuser/gameStgUser/form?id=${gameStgUser.id}">用户<shiro:hasPermission name="game:gameuser:gameStgUser:edit">${not empty gameStgUser.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="game:gameuser:gameStgUser:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="gameStgUser" action="${ctx}/game/gameuser/gameStgUser/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">account：</label>
			<div class="controls">
				<form:input path="account" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户名称：</label>
			<div class="controls">
				<form:input path="username" htmlEscape="false" maxlength="60" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户头像：</label>
			<div class="controls">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">状态：</label>
			<div class="controls">
				<form:select path="state" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('game_frontuser_state')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">解封时间：</label>
			<div class="controls">
				<input name="unbanTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${gameStgUser.unbanTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">到期时间：</label>
			<div class="controls">
				<input name="expireTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${gameStgUser.expireTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">积分：</label>
			<div class="controls">
				<form:input path="integral" htmlEscape="false" maxlength="20" class="input-xlarge  digits"/>
			</div>
		</div>
			<div class="control-group">
				<label class="control-label">用户物品：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>角色ID</th>
								<th>物品名称</th>
								<th>物品类型</th>
								<th>物品状态</th>
								<th>描述</th>
								<th>值</th>
								<th>最小值</th>
								<th>最大值</th>
								<th>取值类型</th>
								<th>品阶</th>
								<th>星级</th>
								<th>物品位置</th>
								<th>配图</th>
								<th>物品数量</th>
								<th>物品模板ID</th>
								<th>备注信息</th>
								<shiro:hasPermission name="game:gameuser:gameStgUser:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="gameUserPartList">
						</tbody>
						<shiro:hasPermission name="game:gameuser:gameStgUser:edit"><tfoot>
							<tr><td colspan="18"><a href="javascript:" onclick="addRow('#gameUserPartList', gameUserPartRowIdx, gameUserPartTpl);gameUserPartRowIdx = gameUserPartRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="gameUserPartTpl">//<!--
						<tr id="gameUserPartList{{idx}}">
							<td class="hide">
								<input id="gameUserPartList{{idx}}_id" name="gameUserPartList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="gameUserPartList{{idx}}_delFlag" name="gameUserPartList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="gameUserPartList{{idx}}_roleId" name="gameUserPartList[{{idx}}].roleId" type="text" value="{{row.roleId}}" maxlength="20" class="input-small  digits"/>
							</td>
							<td>
								<input id="gameUserPartList{{idx}}_partName" name="gameUserPartList[{{idx}}].partName" type="text" value="{{row.partName}}" maxlength="50" class="input-small required"/>
							</td>
							<td>
								<input id="gameUserPartList{{idx}}_partType" name="gameUserPartList[{{idx}}].partType" type="text" value="{{row.partType}}" maxlength="6" class="input-small required"/>
							</td>
							<td>
								<input id="gameUserPartList{{idx}}_partState" name="gameUserPartList[{{idx}}].partState" type="text" value="{{row.partState}}" maxlength="6" class="input-small "/>
							</td>
							<td>
								<textarea id="gameUserPartList{{idx}}_content" name="gameUserPartList[{{idx}}].content" rows="4" maxlength="1000" class="input-small ">{{row.content}}</textarea>
							</td>
							<td>
								<input id="gameUserPartList{{idx}}_val" name="gameUserPartList[{{idx}}].val" type="text" value="{{row.val}}" maxlength="20" class="input-small  digits"/>
							</td>
							<td>
								<input id="gameUserPartList{{idx}}_minVal" name="gameUserPartList[{{idx}}].minVal" type="text" value="{{row.minVal}}" maxlength="20" class="input-small  digits"/>
							</td>
							<td>
								<input id="gameUserPartList{{idx}}_maxVal" name="gameUserPartList[{{idx}}].maxVal" type="text" value="{{row.maxVal}}" maxlength="20" class="input-small  digits"/>
							</td>
							<td>
								<input id="gameUserPartList{{idx}}_valType" name="gameUserPartList[{{idx}}].valType" type="text" value="{{row.valType}}" maxlength="6" class="input-small "/>
							</td>
							<td>
								<input id="gameUserPartList{{idx}}_level" name="gameUserPartList[{{idx}}].level" type="text" value="{{row.level}}" maxlength="11" class="input-small "/>
							</td>
							<td>
								<input id="gameUserPartList{{idx}}_star" name="gameUserPartList[{{idx}}].star" type="text" value="{{row.star}}" maxlength="11" class="input-small "/>
							</td>
							<td>
								<input id="gameUserPartList{{idx}}_position" name="gameUserPartList[{{idx}}].position" type="text" value="{{row.position}}" maxlength="6" class="input-small "/>
							</td>
							<td>
								<input id="gameUserPartList{{idx}}_img" name="gameUserPartList[{{idx}}].img" type="text" value="{{row.img}}" maxlength="200" class="input-small "/>
							</td>
							<td>
								<input id="gameUserPartList{{idx}}_amount" name="gameUserPartList[{{idx}}].amount" type="text" value="{{row.amount}}" maxlength="20" class="input-small  digits"/>
							</td>
							<td>
								<input id="gameUserPartList{{idx}}_modelId" name="gameUserPartList[{{idx}}].modelId" type="text" value="{{row.modelId}}" maxlength="20" class="input-small  digits"/>
							</td>
							<td>
								<textarea id="gameUserPartList{{idx}}_remarks" name="gameUserPartList[{{idx}}].remarks" rows="4" maxlength="255" class="input-small ">{{row.remarks}}</textarea>
							</td>
							<shiro:hasPermission name="game:gameuser:gameStgUser:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#gameUserPartList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var gameUserPartRowIdx = 0, gameUserPartTpl = $("#gameUserPartTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(gameStgUser.gameUserPartList)};
							for (var i=0; i<data.length; i++){
								addRow('#gameUserPartList', gameUserPartRowIdx, gameUserPartTpl, data[i]);
								gameUserPartRowIdx = gameUserPartRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">角色表：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>角色名称</th>
								<th>配图</th>
								<th>备注信息</th>
								<shiro:hasPermission name="game:gameuser:gameStgUser:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="gameUserPlayerList">
						</tbody>
						<shiro:hasPermission name="game:gameuser:gameStgUser:edit"><tfoot>
							<tr><td colspan="5"><a href="javascript:" onclick="addRow('#gameUserPlayerList', gameUserPlayerRowIdx, gameUserPlayerTpl);gameUserPlayerRowIdx = gameUserPlayerRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="gameUserPlayerTpl">//<!--
						<tr id="gameUserPlayerList{{idx}}">
							<td class="hide">
								<input id="gameUserPlayerList{{idx}}_id" name="gameUserPlayerList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="gameUserPlayerList{{idx}}_delFlag" name="gameUserPlayerList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="gameUserPlayerList{{idx}}_playerName" name="gameUserPlayerList[{{idx}}].playerName" type="text" value="{{row.playerName}}" maxlength="30" class="input-small "/>
							</td>
							<td>
							</td>
							<td>
								<textarea id="gameUserPlayerList{{idx}}_remarks" name="gameUserPlayerList[{{idx}}].remarks" rows="4" maxlength="255" class="input-small ">{{row.remarks}}</textarea>
							</td>
							<shiro:hasPermission name="game:gameuser:gameStgUser:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#gameUserPlayerList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var gameUserPlayerRowIdx = 0, gameUserPlayerTpl = $("#gameUserPlayerTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(gameStgUser.gameUserPlayerList)};
							for (var i=0; i<data.length; i++){
								addRow('#gameUserPlayerList', gameUserPlayerRowIdx, gameUserPlayerTpl, data[i]);
								gameUserPlayerRowIdx = gameUserPlayerRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
		<div class="form-actions">
			<shiro:hasPermission name="game:gameuser:gameStgUser:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>