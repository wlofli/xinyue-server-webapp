<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- add by lzc -->
<c:if test="${page.totalPage >= 0}">
<ul>
<!-- pageNo从0开始 -->
  <c:choose>
	<c:when test="${page.pageNo == 0 }">
		<li><a href="javascript:changep(-1)">首页</a></li>
	</c:when>
	<c:otherwise>
		<li><a href="javascript:changep(0)">首页</a></li>
	</c:otherwise>
  </c:choose>
  <li><a href="javascript:changep(${page.pageNo - 1 })">上一页</a></li>
  <c:choose>
  	<c:when test="${page.totalPage > 1 + page.pageNo + page.startIndex  }">
<!--   	y > x + n -->
  		<c:if test="${page.pageNo  - page.startIndex > 0 }">
  			<li>......</li>
  			<c:forEach var="i" begin="${page.pageNo + 1 - page.startIndex }" end="${page.pageNo }">
  				<li><a href="javascript:changep(${i - 1 })">${i }</a></li>
  			</c:forEach>
  		</c:if>
  		
  		
  		
  		<c:if test="${page.pageNo  - page.startIndex <= 0 }">
  			<c:forEach var="i" begin="1" end="${page.pageNo }">
  				<li><a href="javascript:changep(${i - 1 })">${i }</a></li>
  			</c:forEach>
  		</c:if>
  		
  		
<!--   		当前页 -->
		<li><a href="javascript:changep(-1)" class="hit">${page.pageNo + 1 }</a></li>
  		
  		
  		
  		<c:forEach var="i" begin="${page.pageNo + 2 }" end="${page.pageNo + 1 + page.startIndex }" >
			<li><a href="javascript:changep(${i - 1 })">${i }</a></li>
		</c:forEach>
		<li>......</li>
  	</c:when>
  	<c:when test="${page.totalPage <= 1 + page.pageNo + page.startIndex  }">
<!--   	y < x + n -->
		<c:if test="${page.pageNo + 1 - page.startIndex > 0 }">
			<li>......</li>
	  		<c:forEach var="i" begin="${page.pageNo + 1 -page.startIndex }" end="${page.pageNo  }">
	  			<li><a href="javascript:changep(${i - 1 })">${i }</a></li>
	  		</c:forEach>
  		</c:if>
  		<c:if test="${page.pageNo + 1 - page.startIndex <= 0 }">
  			<c:forEach var="i" begin="1" end="${page.pageNo }">
  				<li><a href="javascript:changep(${i - 1 })">${i }</a></li>
  			</c:forEach>
  		</c:if>
  		
<!--   		当前页 -->
  		<li><a href="javascript:changep(-1)" class="hit">${page.pageNo + 1 }</a></li>
  		
  		
  		
  		<c:forEach var="i" begin="${page.pageNo + 2 }" end="${page.totalPage }">
  			<li><a href="javascript:changep(${i - 1  })">${i }</a></li>
  		</c:forEach>
  	</c:when>
  </c:choose>
<li><a href="javascript:changep(${page.pageNo + 1})">下一页</a></li>
<c:choose>
	<c:when test="${page.pageNo + 1 == page.totalPage }">
		<li class="bor_none"><a href="javascript:changep(-1)">尾页</a></li>
	</c:when>
	<c:otherwise>
		<li class="bor_none"><a href="javascript:changep(${page.totalPage - 1 })">尾页</a></li>
	</c:otherwise>
</c:choose>

<li class="clear"></li>
</ul>
</c:if>
<script>
var maxPage = "${page.totalPage}";
function changep(n){
// 	alert("maxPage = " + maxPage)
if(n <  0 || n >= maxPage){
// 	 alert("nono");
	 return;
}
changePage(n);
}
</script>