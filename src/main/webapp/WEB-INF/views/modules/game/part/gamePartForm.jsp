<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>物品管理</title>
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
		<li><a href="${ctx}/game/part/gamePart/">物品列表</a></li>
		<li class="active"><a href="${ctx}/game/part/gamePart/form?id=${gamePart.id}">物品<shiro:hasPermission name="game:part:gamePart:edit">${not empty gamePart.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="game:part:gamePart:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="gamePart" action="${ctx}/game/part/gamePart/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">物品名称：</label>
			<div class="controls">
				<form:input path="partName" htmlEscape="false" maxlength="50" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">物品类型：</label>
			<div class="controls">
				<form:input path="partType" htmlEscape="false" maxlength="6" class="input-xlarge required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">物品状态：</label>
			<div class="controls">
				<form:input path="partState" htmlEscape="false" maxlength="6" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">描述：</label>
			<div class="controls">
				<form:textarea path="content" htmlEscape="false" rows="4" maxlength="1000" class="input-xxlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">值：</label>
			<div class="controls">
				<form:input path="val" htmlEscape="false" maxlength="20" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">最小值：</label>
			<div class="controls">
				<form:input path="minVal" htmlEscape="false" maxlength="20" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">最大值：</label>
			<div class="controls">
				<form:input path="maxVal" htmlEscape="false" maxlength="20" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">取值类型：</label>
			<div class="controls">
				<form:input path="valType" htmlEscape="false" maxlength="6" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">品阶：</label>
			<div class="controls">
				<form:input path="level" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">星级：</label>
			<div class="controls">
				<form:input path="star" htmlEscape="false" maxlength="11" class="input-xlarge  digits"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">配图：</label>
			<div class="controls">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">最大堆数量：</label>
			<div class="controls">
				<form:input path="maxAmount" htmlEscape="false" maxlength="20" class="input-xlarge  digits"/>
			</div>
		</div>
			<div class="control-group">
				<label class="control-label">物品值：</label>
				<div class="controls">
					<table id="contentTable" class="table table-striped table-bordered table-condensed">
						<thead>
							<tr>
								<th class="hide"></th>
								<th>一级类别</th>
								<th>二级类别</th>
								<th>type</th>
								<th>值</th>
								<th>内容</th>
								<th>最小值</th>
								<th>最大值</th>
								<th>取值类型</th>
								<th>备注信息</th>
								<shiro:hasPermission name="game:part:gamePart:edit"><th width="10">&nbsp;</th></shiro:hasPermission>
							</tr>
						</thead>
						<tbody id="gamePartValList">
						</tbody>
						<shiro:hasPermission name="game:part:gamePart:edit"><tfoot>
							<tr><td colspan="11"><a href="javascript:" onclick="addRow('#gamePartValList', gamePartValRowIdx, gamePartValTpl);gamePartValRowIdx = gamePartValRowIdx + 1;" class="btn">新增</a></td></tr>
						</tfoot></shiro:hasPermission>
					</table>
					<script type="text/template" id="gamePartValTpl">//<!--
						<tr id="gamePartValList{{idx}}">
							<td class="hide">
								<input id="gamePartValList{{idx}}_id" name="gamePartValList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
								<input id="gamePartValList{{idx}}_delFlag" name="gamePartValList[{{idx}}].delFlag" type="hidden" value="0"/>
							</td>
							<td>
								<input id="gamePartValList{{idx}}_partType1" name="gamePartValList[{{idx}}].partType1" type="text" value="{{row.partType1}}" maxlength="6" class="input-small  digits"/>
							</td>
							<td>
								<input id="gamePartValList{{idx}}_partType2" name="gamePartValList[{{idx}}].partType2" type="text" value="{{row.partType2}}" maxlength="6" class="input-small  digits"/>
							</td>
							<td>
								<input id="gamePartValList{{idx}}_type" name="gamePartValList[{{idx}}].type" type="text" value="{{row.type}}" maxlength="6" class="input-small  digits"/>
							</td>
							<td>
								<input id="gamePartValList{{idx}}_val" name="gamePartValList[{{idx}}].val" type="text" value="{{row.val}}" maxlength="20" class="input-small  digits"/>
							</td>
							<td>
								<textarea id="gamePartValList{{idx}}_content" name="gamePartValList[{{idx}}].content" rows="4" maxlength="500" class="input-small ">{{row.content}}</textarea>
							</td>
							<td>
								<input id="gamePartValList{{idx}}_minVal" name="gamePartValList[{{idx}}].minVal" type="text" value="{{row.minVal}}" maxlength="20" class="input-small  digits"/>
							</td>
							<td>
								<input id="gamePartValList{{idx}}_maxVal" name="gamePartValList[{{idx}}].maxVal" type="text" value="{{row.maxVal}}" maxlength="20" class="input-small  digits"/>
							</td>
							<td>
								<input id="gamePartValList{{idx}}_valType" name="gamePartValList[{{idx}}].valType" type="text" value="{{row.valType}}" maxlength="6" class="input-small "/>
							</td>
							<td>
								<textarea id="gamePartValList{{idx}}_remarks" name="gamePartValList[{{idx}}].remarks" rows="4" maxlength="255" class="input-small ">{{row.remarks}}</textarea>
							</td>
							<shiro:hasPermission name="game:part:gamePart:edit"><td class="text-center" width="10">
								{{#delBtn}}<span class="close" onclick="delRow(this, '#gamePartValList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
							</td></shiro:hasPermission>
						</tr>//-->
					</script>
					<script type="text/javascript">
						var gamePartValRowIdx = 0, gamePartValTpl = $("#gamePartValTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(gamePart.gamePartValList)};
							for (var i=0; i<data.length; i++){
								addRow('#gamePartValList', gamePartValRowIdx, gamePartValTpl, data[i]);
								gamePartValRowIdx = gamePartValRowIdx + 1;
							}
						});
					</script>
				</div>
			</div>
		<div class="form-actions">
			<shiro:hasPermission name="game:part:gamePart:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>