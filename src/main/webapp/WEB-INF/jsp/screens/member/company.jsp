<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div class="hy_right_bt">
	<ul class="menu1" id="menu">
		<li class="hit"><a href="${ctx}/member/record/applicant">申请人信息</a></li>
		<li class=""><a href="${ctx}/member/record/company">企业基本信息</a></li>
		<li class=""><a href="${ctx}/member/record/business">基本经营信息</a></li>
		<li class=""><a href="${ctx}/member/record/debt">抵押物与负债</a></li>
		<li class=""><a href="${ctx}/member/record/document">上传资料</a></li>
		<li class=""><a href="${ctx}/member/record/rating">评级信息</a></li>
	</ul>
</div>
<div class="tab">
	<sf:form action="${ctx}/member/save" commandName="companyInfo" method="post" id="companyForm">
	<p class="qiye_bt"><strong>企业基本信息</strong></p>
<p><span>公司名称：</span><input type="text" class="t1" /></p>
<p><span>法人代表：</span><input type="text" class="t1" /></p>
<p><span>证件类型：</span><select class="s1"><option selected="selected">请选择</option><option>身份证</option></select></p>
<p><span>证件号码：</span><input type="text" class="t1" /></p>
<p><span>营业执照注册号：</span><input type="text" class="t1" /></p>
<p><span>工商注册时间：</span><input type="text" class="t1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></p>
<p><span>是否有年检记录：</span><select class="s1"><option selected="selected">请选择</option><option>是</option><option>否</option></select></p>
<p><span>最近一次年检时间：</span><input type="text" class="t1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" /></p>
<p><span>注册资本(万)：</span><select class="s1"><option selected="selected">请选择</option><option>人民币</option></select><input type="text" class="t1" /></p>
<p><span>实收资本(万)：</span><select class="s1"><option selected="selected">请选择</option><option>人民币</option></select><input type="text" class="t1" /></p>
<p><span>企业性质：</span><select class="s1"><option selected="selected">请选择</option><option>互联网</option></select></p>
<p><span>所在国家（地区）：</span><input type="text" class="t1" /></p>
<p><span>注册时间：</span><input type="text" class="t1" /></p>
<p><span>企业所属地区：</span><select class="s2"><option selected="selected">请选择</option><option>浙江省</option></select><select class="s2"><option selected="selected">请选择</option><option>杭州市</option></select><select class="s2"><option selected="selected">请选择</option><option>西湖区</option></select></p>
<p><span>经营范围：</span><textarea class="t3"></textarea></p>
<p><span>组织机构代码：</span><input type="text" class="t1" /></p>
<p><span>企业电户号：</span><input type="text" class="t1" /><input type="button" class="b5" value="添加" /><input type="checkbox" class="r1" /><span class="r1_sex">无独立电户号</span></p>
<p><span>公司联系电话：</span><input type="text" class="t1" /></p>
<p><span>公司传真号码：</span><input type="text" class="t1" /></p>
<p><span>营业执照到期日：</span><input type="text" class="t1" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  /></p>
<p><span>工商登记类型：</span><select class="s1"><option selected="selected">请选择</option><option>有限责任公司</option><option>民营企业</option></select></p>
<p><span>机构类型：</span><select class="s1"><option selected="selected">请选择</option><option>法人企业</option><option>私有企业</option></select></p>
<p><span>国税号：</span><input type="text" class="t1" /></p>
<p><span>地税号：</span><input type="text" class="t1" /></p> 
		<p>
			<input type="button" value="保存" class="b1" onclick="save(1)" /> <input
				type="button" value="下一步" class="b4" onclick="save(2)" />
		</p>
	</sf:form>
</div>
<script type="text/javascript">
$(function () {
	var valP = $("#editP").val();
	var valC = $("#editC").val();
	var valZ = $("#editZ").val();
	
	if(valP != "" && valP != 0){
		getCities(valC);
	}
	if (valC != "") {
 		getZones(valC,valZ);
	}
});

function getCities(val){
	var provinceVal = $("#editP option:selected").val();
	
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
	
	if (provinceVal != "") {
		$.ajax({
			url:"${ctx}/get/cities?type=tc&id="+provinceVal,
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
}
function getZones(val1,val2){
	var cityVal = $("#editC option:selected").val();
	
	$("#editZ").empty();
	var option1= $("<option/>");
	option1.attr("value","");
	option1.html("请选择");
	$("#editZ").append(option1);
	
	if (cityVal == "") {
		cityVal = val1;
	}
	
	if (cityVal != "") {
		$.ajax({
			url:"${ctx}/get/zones?type=tz&id="+cityVal,
			success:function(data){
				var jsonData = eval(data);
				for(var i=0;i<jsonData.length;i++){
					var zone=jsonData[i];
					option= $("<option/>");
					option.attr("value",zone.key);
					option.html(zone.value);
					$("#editZ").append(option);
				};
				if(val2 != ""){
					$("#editZ").val(val2);
				}
			}
		});
	}
}
</script>