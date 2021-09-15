<%@page import="myshop.product.ProductDTO"%>
<%@page import="myshop.product.ProductDao"%>
<%@page import="java.util.ArrayList"%>
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
					<td colspan="9" style="padding-bottom:10px;">
						<b style="font-size:20px;">상품 목록</b>
					</td>
				</tr>
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center">상품 카테고리</th>
					<th class="text-center">상품명</th>
					<th class="text-center">상품분류</th>
					<th class="text-center">제조사</th>
					<th class="text-center">상품가격</th>
					<th class="text-center">상품수량</th>
					<th class="text-center">수정/삭제</th>
				</tr>
				<%
				ProductDao pdao = ProductDao.getInstance();
				ArrayList<ProductDTO> prod_lists = pdao.getProductList();
				if(prod_lists.size()==0){%>
				<tr>
					<td colspan="8" align="center">등록된 상품이 없습니다.</td>
				</tr>
				<%}
				else{
					for(ProductDTO bean :prod_lists){%>
					<tr>
						<td><%=bean.getPnum()%></td>
						<td>[<%=bean.getPcode()%>]&nbsp;<%=bean.getPcategory()%></td>
						<td><a href="prod_view.jsp?pnum=<%=bean.getPnum()%>"><%=bean.getPname()%></a></td>
						<td><%=bean.getPspec()%></td>
						<td><%=bean.getPcompany()%></td>
						<td><%=bean.getPrice()%></td> 
						<td><%=bean.getPqty()%></td>
						<td>
						<a href="prod_update.jsp?pnum=<%=bean.getPnum()%>">수정</a>&nbsp;/
						<a href="prod_delete.jsp?pnum=<%=bean.getPnum()%>">삭제</a>
						</td>
					</tr>
				<%}}%>
			</table>
		</div>
	</div>		
<%@ include file="admin_bottom.jsp" %>
