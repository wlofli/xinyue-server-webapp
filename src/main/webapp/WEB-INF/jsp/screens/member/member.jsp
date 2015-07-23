<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>普通会员-基本信息</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="../../common/common.jsp"%>
<script type="text/javascript">
	$(function(){
		var cval = $("#common_member_cityids").val();
		
		var zval = $("#common_member_zoneids").val();
		
		if($("#editP").val() != ""){
			changeSelect("p",cval);
		}
		if (cval != "") {
	 		getZones(cval,zval);
		}
	});
</script>
</head>
<body class="h_bj">
	<div class="container">
		<%@ include file="../../common/head.jsp"%>
		<div class="hy_i_center">
			<div class="position">
				<span>当前位置：</span><a href="#">网站首页</a>-<span>会员中心</span>
			</div>
			<%@ include file="tree.jsp"%>
			<div class="hy_right">
				<div class="hy_right_bt">
					<ul class="menu1" id="menu">
						<li class="hit"><a href="javascript:void(0)" onclick="document.location.href='${ctx }/member/list?param=basic'">基本信息</a></li>
						<li class=""><a href="javascript:void(0)" onclick="document.location.href='${ctx }/member/list?param=updatepwd'">修改密码</a></li>
					</ul>
				</div>
				<div class="tab">
					<s:form commandName="member" method="post" action="${ctx }/member/commonctr/save" id="common_member">
						<s:hidden path="id"/>
					<p>
						<span>用户名：</span><s:input path="loginName" class="t1 required" readonly="true"/>
					</p>
					<p>
						<span>性别：</span>
							<s:radiobutton path="sex" value="1" class="r1"/><span class="r1_sex">女</span>
							<s:radiobutton path="sex" value="2" class="r1 m_l_20"/><span class="r1_sex">男</span>
							<s:radiobutton path="sex" value="3" class="r1 m_l_20"/><span class="r1_sex">保密</span>
					</p>
					<p>
						<span>联系人：</span><s:input path="contactName" class="t1 required"/>
					</p>
					<p>
						<span>联系人手机：</span><s:input path="contactPhone" class="t1 required"/>
					</p>
					<p>
						<span>企业名称：</span><s:input path="company" class="t1 required"/>
					</p>
					<p>
						<span>所属地区：</span>
						<s:select path="provinceid" class="s2" id="editP" onchange="changeSelect('p','')">
							<s:option value="">请选择省</s:option>
							<s:options items="${province }" itemLabel="value" itemValue="key"/>
						</s:select>
						<s:select path="cityid" id="editC" class="s2" onchange="changeSelect('c','')">
							<s:option value="">选择市</s:option>
						</s:select>
						<s:hidden path="cityids" id="common_member_cityids"/>
						<s:select path="zoneid" id="editZ" class="s2 required">
							<s:option value="">选择区/县</s:option>
						</s:select>
						<s:hidden path="zoneids" id="common_member_zoneids"/>
					</p>
					<p>
						<span>详细地址：</span><s:input path="address" class="t1 required"/>
					</p>
					<p>
						<span>电子邮箱：</span><s:input path="email" class="t1 required" type="email"/>
					</p>
					<p>
						<input type="button" value="确认修改" class="b1" onclick="save()"/>
					</p>
					</s:form>
				</div>

			</div>
		</div>
		<%@ include file="../../common/foot.jsp"%>
	</div>
	<script type="text/javascript">
	function changeSelect(type,val){

		switch (type) {
		case "p":
			var selected = $("#editP option:selected").val();
			
			$("#editC").empty();
			var option= $("<option/>");
			option.attr("value","");
			option.html("请选择");
			$("#editC").append(option);
			$("#editZ").empty();
			var option1= $("<option/>");
			option1.attr("value","");
			option1.html("请选择");
			$("#editZ").append(option1);
			
			if(selected != 0){
				$.ajax({
					url:"${ctx}/get/cities?type=tc&id="+selected,
					success:function(data){
						var jsonData = eval(data);
						for(var i=0;i<jsonData.length;i++){
							var city=jsonData[i];
							option= $("<option/>");
							option.attr("value",city.key);
							option.html(city.value);
							$("#editC").append(option);
						};
						if(val != ""){
							$("#editC").val(val);
						}
					}
				});
			}
			break ;
		case "c":
			var selected = $("#editC option:selected").val();
			$("#editZ").empty();
			var option= $("<option/>");
			option.attr("value","");
			option.html("请选择");
			$("#editZ").append(option);
			
			if(selected != 0){
				$.ajax({
					url:"${ctx}/get/zones?type=tz&id="+selected,
					success:function(data){
						var jsonData = eval(data);
						for(var i=0;i<jsonData.length;i++){
							var zone=jsonData[i];
							option= $("<option/>");
							option.attr("value",zone.key);
							option.html(zone.value);
							$("#editZ").append(option);
						};
						if(val != ""){
							$("#editZ").val(val);
						}
					}
				});
			}
			break;
		default:
			break;
		}
	}

	function getZones(cityData,zoneData){
		$("#editZ").empty();
		var option= $("<option/>");
		option.attr("value","0");
		option.html("请选择");
		$("#editZ").append(option);
		$.ajax({
			url:"${ctx}/get/zones?type=tz&id="+cityData,
			success:function(data){
				var jsonData = eval(data);
				for(var i=0;i<jsonData.length;i++){
					var zone=jsonData[i];
					option= $("<option/>");
					option.attr("value",zone.key);
					option.html(zone.value);
					$("#editZ").append(option);
				};
				$("#editZ").val(zoneData);
			}
		});
		
	}

	function save(){
		if($("#common_member").valid()){
			$.ajax({
				url:'${ctx}/member/commonctr/save',
				type:'post',
				data:$("#common_member").serialize(),
				success:function(data){
					if(data == 'success'){
						alert("修改成功");
					}else{
						alert("修改失败");
					}
				}
			});
		}
	}
	</script>
</body>
</html>