<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"  %> 
<div class="hy_right_bt">
	<ul class="menu1" id="menu">
		<li class=""><a href="${ctx}/member/record/applicant">申请人信息</a></li>
		<li class=""><a href="${ctx}/member/record/company">企业基本信息</a></li>
		<li class=""><a href="${ctx}/member/record/business">基本经营信息</a></li>
		<li class=""><a href="${ctx}/member/record/estate">抵押物信息</a></li>
		<li class=""><a href="${ctx}/member/record/debt">负债信息</a></li>
		<li class="hit"><a href="${ctx}/member/record/document">上传资料</a></li>
		<li class=""><a href="${ctx}/member/record/rating">评级信息</a></li>
	</ul>
</div>
<div class="tab" >
	<table class="sczl_table">
		<thead>
			<tr>
				<td colspan="1">序号</td>
				<td colspan="4">资料类型</td>
				<td colspan="3">上传文件</td>
				<td colspan="2">上传时间</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${documents}" var="document" varStatus="vs">
			<tr>
				<td colspan="1">${(vs.index+1)+((pageData.currentPage-1)*10)}</td>
				<td colspan="4">
					${document.documentName}
					<input type="hidden" value="${document.documentType}" id="hid_type_${vs.index+1}"/>
				</td>
				<td colspan="3" >
						<div style="display:<c:if test="${empty document.documentId}">block</c:if><c:if test="${!empty document.documentId}">none</c:if>; width:100%; height:100%" id="div1_doc_${vs.index+1}">
							<a href="#" class="zlsc_btn">选择文件</a>
							<input type="file" class="hidden" id="file_${vs.index+1}" name="document${vs.index+1}"/>
							<a href="javascript:void(0);" class="zlsc1_btn" onclick="upLoadFile(${vs.index+1})">上传文件</a>
						</div>
					<div style="display:<c:if test="${empty document.documentId}">none</c:if><c:if test="${!empty document.documentId}">block</c:if>; width:100%; height:100%" id="div2_doc_${vs.index+1}">
						<span class="zlysc">已上传</span>
						<a href="#" class="zlsc1_btn" onclick="reUpLoad(${vs.index+1})">重新上传</a>
					</div>
					<input type="hidden" value="${document.documentId}" id="hid_file_${vs.index+1}"/>
				</td>
				
				<td colspan="2">${document.upLoadTime}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<p:page url="${ctx}/member/document/page" pageData="${pageData}" />
</div>
<script type="text/javascript">
$(function () {
	var message = "${message}";
	var type = "${type}";
	if (message != null && message != "") {
		alert(message);
		switch (type) {
		case "p":
			document.location.href = "${ctx}/member/record/estate";
			break;
		case "n":
			document.location.href = "${ctx}/member/record/document";
			break;
		default:
			break;
		}
	}
});
function upLoadFile(index){
	var fileVal = $("#file_"+index).val();
	var typeId = $("#hid_type_"+index).val();
	var fileId = $("#hid_file_"+index).val();
	var type = "";
	if (fileVal == "") {
		alert("请选择文件");
		return;
	}
	if (fileVal != "") {
		type = fileVal.split(".");
		
	}
	$.ajaxFileUpload({
		url:'${ctx}/member/document/file/add?suffix='+type[1]+'&typeId='+typeId+'&fileId='+fileId,
		secureuri:false,
		fileElementId:'file_'+index,
		dataType:'json',
		success:function(data){
			if (data != "fail") {
				alert("上传成功!");
				$("#hid_file_"+index).val(data);
				
			}else {
				alert("上传失败!");
			}
		}
	});
}

function reUpLoad(index){
$("#div2_doc_"+index).css("display","none");
$("#div1_doc_"+index).css("display","block");
}

function changePage(url,nowPage){
	document.location.href = url+nowPage;
}
</script>