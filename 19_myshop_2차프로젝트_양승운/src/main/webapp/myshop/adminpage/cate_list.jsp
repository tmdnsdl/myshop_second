<%@page import="myshop.category.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myshop.category.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>관리자 페이지</title>
<%@ include file="../../myshop/shoppage/shop_top.jsp" %>
	<div class="admin_view_container">		
		<nav class="admin_nav">
			<h3 align="center"><a href="admin_main.jsp">관리자 페이지</a></h3>
			<ul class="admin_menu">
				<li><a href="cate_input.jsp">카테고리 등록</a></li>
				<li><a href="cate_list.jsp">카테고리 목록</a></li>
				<li><a href="prod_input.jsp">상품 등록</a></li>
				<li><a href="prod_list.jsp">상품 목록</a></li>
				<li><a href="order_view.jsp">주문 조회</a></li>
			</ul>
		</nav>
		<div class="admin_view_box">
			<table class="table table-striped" style="margin-bottom:0;">
				<tr>
					<td colspan="4" style="padding-bottom:10px;">
						<b style="font-size:20px;">카테고리 목록</b>
					</td>
				</tr>
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center">카테고리 코드</th>
					<th class="text-center">카테고리명</th>
					<th class="text-center">삭제</th>
				</tr>
				<%
				CategoryDao cdao = CategoryDao.getInstance();
				ArrayList<CategoryDTO> cate_lists = cdao.getCategoryList();
				if(cate_lists.size()==0){%>
				<tr>
					<td colspan="4" align="center">등록된 카테고리가 없습니다.</td>
				</tr>
				<%}
				else{
					for(CategoryDTO bean :cate_lists){%>
					<tr>
						<td><%=bean.getCnum()%></td>
						<td><%=bean.getCode()%></td>
						<td><%=bean.getCname()%></td>
						<td><a href="cate_delete.jsp?cnum=<%=bean.getCnum()%>">삭제</a></td>
					</tr>
				<%}}%>
			</table>
		</div>
	</div>		
<%@ include file="admin_bottom.jsp" %>
</body>
</html>