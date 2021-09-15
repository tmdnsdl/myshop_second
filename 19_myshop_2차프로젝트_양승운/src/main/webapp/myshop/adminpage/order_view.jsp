<%@page import="java.text.DecimalFormat"%>
<%@page import="myshop.order.OrderDTO"%>
<%@page import="myshop.order.OrderDao"%>
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
		<% 
			String mid = request.getParameter("mid");
			OrderDao odao = OrderDao.getInstance();
			ArrayList<OrderDTO> orderlist=null;
			orderlist = odao.getMemberOrders();
			if(mid!=null){
				orderlist = odao.getMemberOrders(mid);
			}
			DecimalFormat df = new DecimalFormat("###,###");
		%>
		<div class="admin_view_box">
				<table class="table table-striped" style="margin-bottom:0;">
					<tr>
						<td colspan="9" style="padding-bottom:10px;">
							<b style="font-size:20px;">주문 조회</b>
						</td>
					</tr>
					<tr>
						<td colspan="9" style="padding-bottom:10px;">
							<form action="order_view.jsp" method="post">
							회원아이디로 주문 조회 &nbsp; <input type="text" name="mid" placeholder="아이디">
							<input type="submit" value="조회"></form>
						</td>
					</tr>
					<tr>
						<th class="text-center">아이디</th>
						<th class="text-center">상품명</th>
						<th class="text-center">수량</th>
						<th class="text-center">가격</th>
						<th class="text-center">주문자명</th>
						<th class="text-center">핸드폰</th>
						<th class="text-center">배송주소</th>
					</tr>
					<%
					if(orderlist==null || orderlist.size()==0){%>
					<tr>
						<td colspan="7" align="center">주문 상품이 없습니다.</td>
					</tr>
					<%}
					if(orderlist!=null){
						for(OrderDTO bean :orderlist){%>
						<tr>
							<td><%=bean.getMemid()%></td>
							<td><%=bean.getPname()%></td>
							<td><%=bean.getOqty()%></td>
							<td><%=bean.getOprice()%></td>
							<td><%=bean.getOrdername()%></td>
							<td><%=bean.getOrderhp()%></td>
							<td><%=bean.getOrderaddr()%></td>
						</tr>
					<%}}%>
				</table>
		</div>
	</div>		
<%@ include file="admin_bottom.jsp" %>
