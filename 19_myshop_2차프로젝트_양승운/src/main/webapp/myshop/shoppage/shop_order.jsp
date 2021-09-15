<%@page import="java.text.DecimalFormat"%>
<%@page import="myshop.member.MemberDao"%>
<%@page import="myshop.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myshop.product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
	tr td{
		font-size:18px;
	}
	.table-bordered{
		height:150px;
		text-align:center;
		margin-top:50px;
	}
	input{
		 border-radius:1px;
		-webkit-appearance: none;
		border: 1px solid #cacaca;
	}
	
</style>
	<%@ include file="shop_top.jsp" %>
	<jsp:useBean id="cartbean" class="myshop.order.CartDTO" scope="session"/>
	<%
		ArrayList<ProductDTO> cart_lists = cartbean.getAllProducts();
		String username = (String)session.getAttribute("memname");
		String userhp = (String)session.getAttribute("memhp");
		String useraddr = (String)session.getAttribute("memaddr");
		int oTotalPrice=0;
		int oTotalPoint=0;
		DecimalFormat def = new DecimalFormat("###,###");
	%>
		<div class="cart_container">
			<div class="cart_content_box">
				<h3 align="center" style="margin-top:50px;margin-bottom:50px;">주문결제</h3>
				<table class="table table-striped vertical-align">
					<tr>
						<th class="text-center"></th>
						<th>상품정보</th>
						<th class="text-center">가격</th>
						<th class="text-center">수량</th>
						<th class="text-center">적립포인트</th>
						<th class="text-center">합계</th>
					</tr>
					<% int productCount=0;
					for(ProductDTO b : cart_lists){
					productCount++;%>
					<tr>
						<td align="center"><img src="<%=request.getContextPath()%>/img/<%=b.getPimage()%>" width=100 height=100></td>
						<td align="left"><%=b.getPname() %></td>
						<td align="center"><%=def.format(b.getPrice()) %></td>
						<td align="center"><%=b.getPqty() %></td>
						<td align="center"><%=b.getTotalPoint()%></td>
						<td align="center"><%=def.format(b.getTotalPrice())%></td>
					</tr>
					<% 
					oTotalPoint += b.getTotalPoint();
					oTotalPrice += b.getTotalPrice();
					} %>
				</table>
				<div style="margin-top:20px; margin-bottom:10px; border-bottom:1px solid lightgray;"></div>
				<h3 align="center" style="margin-top:50px;margin-bottom:50px;">주문자 정보</h3>
				<form action="shop_order_proc.jsp" name="order_form">
				<table class="table table-striped">
					<tr>
						<td class="col-md-3" align="center">주문자 이름</td>
						<td><input type="text" name="username" value="<%=username %>"></td>
					</tr>
					<tr>
						<td align="center">휴대폰</td>
						<td><input type="text" name="userhp" value="<%=userhp %>"></td>
					</tr>
					<tr>
						<td align="center">주문자 배송주소</td>
						<td><input type="text" name="useraddr" value="<%=useraddr %>"></td>
					</tr>
				</table>
				<div style="margin-top:50px; margin-bottom:10px; border-bottom:1px solid lightgray;"></div>
				<table class="table table-bordered">
					<tr>
						<td class="col-md-1"><b>선택 상품수</b></td>
						<td class="col-md-3"><b>총 상품금액</b></td>
						<td class="col-md-2"><b>적립포인트 사용</b></td>
						<td class="col-md-4"><b>총 주문금액</b></td>
					</tr>
					<tr>
						<td><%=productCount %>개</td>
						<td><%=def.format(oTotalPrice) %>원</td>
						<td>0원</td>
						<td><%=def.format(oTotalPrice) %>원</td>
					</tr>
				</table>
				<div class="button_box">
					<button type="submit" class="btn btn-primary btn-lg" style="background:#32CD32;">상품결제</button>
					<button type="button" class="btn btn-primary btn-lg" onclick="location.href='shop_cartList.jsp'" style="background:#32CD32;">주문취소</button>
				</div>
				</form>		
			</div>
		</div>
	<%@ include file="shop_bottom.jsp" %>
