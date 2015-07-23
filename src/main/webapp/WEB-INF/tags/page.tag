<%@ tag language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ attribute required="true" name="url" type="java.lang.String"%>
<%@ attribute required="true" name="pageData" type="com.xinyue.manage.beans.PageData"%>

<c:set var="uri" value='<%=url + ((url.indexOf("?")) >= 0?"&":"?") %>'></c:set>
<c:if test="${pageData.totalPage > 0}">

<div class="hy_dd_page">
	<span>共${pageData.total }条记录</span>
	<span>${pageData.currentPage}/${pageData.totalPage }页</span>
	
	
	<c:choose>
		<c:when test="${pageData.currentPage == 1 }">
			<a href="javascript:void(0)" class="dd_page_n">首页</a>
		</c:when>
		<c:otherwise>
			<a href="javascript:void(0)" onclick="changePage('${uri}topage=' , 1)" class="dd_page_h">首页</a>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${pageData.currentPage > 1 }">
			<a href="javascript:void(0)" onclick="changePage('${uri}topage=' , ${pageData.currentPage-1 })" class="dd_page_h">上一页</a>
		</c:when>
		<c:otherwise>
			<a href="javascript:void(0)" class="dd_page_n">上一页</a>
		</c:otherwise>
	</c:choose>
	

	<c:choose>
		<c:when test="${pageData.currentPage < pageData.totalPage }">
			<a href="javascript:void(0)" onclick="changePage('${uri}topage=' , ${pageData.currentPage+1 })" class="dd_page_h">下一页</a>
		</c:when>
		<c:otherwise>
			<a href="javascript:void(0)" class="dd_page_n">下一页</a>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${pageData.currentPage == pageData.totalPage }">
			<a href="javascript:void(0)" class="dd_page_n">未页</a>
		</c:when>
		<c:otherwise>
			<a href="javascript:void(0)" onclick="changePage('${uri}topage=' , ${pageData.totalPage })" class="dd_page_h">未页</a>
		</c:otherwise>
	</c:choose>
	
	
	<span>跳转到第</span><input type="text" class="ymsr" id="page"/><span>页</span><input type="button" value="跳转" onclick="changePage('${uri}topage=' , document.getElementById('page').value)" class="tz_btn" />
	
</div>
</c:if>