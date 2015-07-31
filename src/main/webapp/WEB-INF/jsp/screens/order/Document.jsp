<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="p" tagdir="/WEB-INF/tags"  %> 
<html>
<head>
<meta http-equiv="description" content="" />
<meta http-equiv="keywords" content="" />
<title>普通会员-订单详情</title>
<link rel="icon" href="../images/moke.ico" />
<%@include file="../../common/common.jsp" %>
</head>
<body class="h_bj">
<div class="container">
<jsp:include page="../../common/head.jsp" />
<div class="hy_i_center">
<jsp:include page="../member/tree.jsp" />
<div class="hy_right">
<jsp:include page="detailHead.jsp" />
<div class="tab">
<input type="hidden" name="orderId" id="orderId" value="${order.id }"/>
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
<p:page url="${ctx}/order/detail/document/changepage" pageData="${pageData}" />
<script type="text/javascript" src="${ctx}/js/ajaxfileupload.js"></script>
<script type="text/javascript">

function changePage(url,nowPage){
	var orderId = "${order.id}";
	document.location.href = url+nowPage+'&id='+orderId;
}


function upLoadFile(index){
	var fileVal = $("#file_"+index).val();
	var typeId = $("#hid_type_"+index).val();
	var fileId = $("#hid_file_"+index).val();
	var orderId = $("#orderId").val();
	var type = "";
	if (fileVal == "") {
		alert("请选择文件");
		return;
	}
	if (fileVal != "") {
		type = fileVal.split(".");
	}
// alert("orderId");
	$.ajaxFileUpload({
		url:'${ctx}/order/save/file/add?suffix='+type[1]+'&typeId='+typeId+'&fileId='+fileId+'&orderId='+orderId,
		secureuri:false,
		fileElementId:'file_'+index,
		dataType:'json',
		success:function(data){
			alert(data);
			if (data != "fail") {
				alert("上传成功!");
				$("#hid_file_"+index).val(data);
// 				doUpload(index);
			}else {
				alert("上传失败!");
			}
		}
	});

}

function doUpload(index){
	$("#div2_doc_"+index).css("display","block");
	$("#div1_doc_"+index).css("display","none");
}

function reUpLoad(index){
$("#div2_doc_"+index).css("display","none");
$("#div1_doc_"+index).css("display","block");
}
</script>
<p><input type="button" value="上一步" class="b1" /><input type="button" value="提交" class="b4" /></p>
</div>
</div>
</div>
<jsp:include page="../../common/foot.jsp" />
</div>
</body>
</html>
