<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${page.totalNum >= 0}">
  <c:choose>
  	<c:when test="${page.pageNo == 0 }">
  		 <div class="hy_dd_page"><span>共${page.totalNum }条记录</span><a href="javascript:changep(${page.pageNo - 1 })" class="dd_page_n">上一页</a><span>第${page.pageNo + 1}/${page.totalPage }页</span><a href="javascript:changep(${page.pageNo + 1})" class="dd_page_h">下一页</a></div>
  	</c:when>
	<c:when test="${page.pageNo == page.totalPage - 1 }">
		 <div class="hy_dd_page"><span>共${page.totalNum }条记录</span><a href="javascript:changep(${page.pageNo - 1 })" class="dd_page_h">上一页</a><span>第${page.pageNo + 1}/${page.totalPage }页</span><a href="javascript:changep(${page.pageNo + 1})" class="dd_page_n">下一页</a></div>
	</c:when>
	<c:otherwise>
		 <div class="hy_dd_page"><span>共${page.totalNum }条记录</span><a href="javascript:changep(${page.pageNo - 1 })" class="dd_page_h">上一页</a><span>第${page.pageNo + 1}/${page.totalPage }页</span><a href="javascript:changep(${page.pageNo + 1})" class="dd_page_h">下一页</a></div>
	</c:otherwise>
  </c:choose>
</c:if>
<script>
var maxPage = "${page.totalPage}";
function changep(n){
// 	alert(n)
 if(n <  0 || n >= maxPage){
// 	 alert("nono");
	 return;
 }
 changePage(n);
}
</script>