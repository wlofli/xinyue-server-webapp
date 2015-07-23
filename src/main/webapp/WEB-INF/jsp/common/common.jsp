<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %> 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link href="${ctx}/css/style.css" type="text/css" rel="stylesheet" />
<link rel="icon" href="${ctx}/images/moke.ico" />
<script type="text/javascript" src="${ctx}/js/tab.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/js/messages_zh.min.js"></script>
<script type="text/javascript" src="${ctx }/js/My97DatePicker.4.8/WdatePicker.js"></script>

<script type="text/javascript">
jQuery.validator.addMethod("charstr", function(value, element) { 
	var chrnum = /^([a-zA-Z0-9]+)$/; 
	var chinese = /^[\u4e00-\u9fa5]+$/;
	return this.optional(element) || (chrnum.test(value)) || (chinese.test(value)); 
	}, "<span class='zc_zs'>* 只能输入数字、字母或中文</span>"); 
</script>
