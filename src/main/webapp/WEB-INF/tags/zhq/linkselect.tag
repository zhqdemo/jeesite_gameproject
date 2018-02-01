<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="输入框名称"%>
<%@ attribute name="cssClsss" type="java.lang.String" required="false" description="css样式"%>
<%@ attribute name="next" type="java.lang.String" required="false" description="影响输入框"%>
<%@ attribute name="code" type="java.lang.String" required="false" description="识别码"%>
<%@ attribute name="pid" type="java.lang.String" required="false" description="父ID"%>
<%@ attribute name="value" type="java.lang.String" required="false" description="值"%>
<select name="${name }" class="${cssClsss } " id="${id }" onchange="link_select_change_${id}(this);" vl="${value }"></select>
<script type="text/javascript">
/**
 * 联动菜单改变
 */
function link_select_change_${id}(th){
	if("${next}"!=""){		
		var val = $(th).val();
		var formData = new FormData();
		formData.append("pid", val);
		$.ajax({
			url:"${ctx}/zhq/zhqCategory/getByPid.json",
			type:"post",
			data:formData,
			cache: false,
			contentType: false,    //不可缺
			processData: false,    //不可缺
			success:function(data){
				if(data.code==0){
					set_link_select_next_data_${id}(data.data);
				}else{
					
				}
				
			},error:function(e){
				
			}
		 })
	}	
}
/**
 * 初始化联动菜单数据
 */
function init_link_select_${id}(){
	var pid="${pid}";
	if(pid!=""){
		var formData = new FormData();
		formData.append("pid", pid);
		$.ajax({
			url:"${ctx}/zhq/zhqCategory/getByPid.json",
			type:"post",
			data:formData,
			cache: false,
			contentType: false,    //不可缺
			processData: false,    //不可缺
			success:function(data){
				console.log(data);
				if(data.code==0){
					set_link_select_data_${id}(data.data);
				}else{
					
				}
				
			},error:function(e){
				
			}
		 })
	}else{
		var code = "${code}";
		if(code!=""){
			var formData = new FormData();
			formData.append("code", code);
			$.ajax({
				url:"${ctx}/zhq/zhqCategory/getByPid.json",
				type:"post",
				data:formData,
				cache: false,
				contentType: false,    //不可缺
				processData: false,    //不可缺
				success:function(data){
					if(data.code==0){
						set_link_select_data_${id}(data.data);
					}else{
						
					}
					
				},error:function(e){
					
				}
			 })
		}
	}
	$("#${id}").val("${value}").select2();
}
init_link_select_${id}();
/**
 * 填充数据到联动菜单本级
 */
function set_link_select_data_${id}(data){
	if(data){
		var html = "<option value=''>   </option>";	
		for(var i=0;i<data.length;i++){
			html += "<option value='"+data[i].id+"'>"+data[i].name+"</option>";	
		}
		$("#${id}").html(html);
		$("#${id}").val("${value}").select2();
	}
}
/**
 * 填充数据到联动菜单下级
 */
function set_link_select_next_data_${id}(data){
	if(data){
		var html = "<option value=''>   </option>";
		for(var i=0;i<data.length;i++){
			html += "<option value='"+data[i].id+"'>"+data[i].name+"</option>";	
		}
		$("#${next}").html(html);
		$("#${next}").val($("#${next}").attr("vl")+"").select2();
	}
}
</script>
