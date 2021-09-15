<%@page import="java.text.DecimalFormat"%>
<%@page import="myshop.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myshop.product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%@ include file="shop_top.jsp" %>
	<jsp:useBean id="cartbean" class="myshop.order.CartDTO" scope="session"/>
	<%ArrayList<ProductDTO> cart_lists = cartbean.getAllProducts();
		int cTotalPrice=0;
		int cTotalPoint=0;
		DecimalFormat def = new DecimalFormat("###,###");
	%>
		<div class="cart_container">
			<div class="cart_content_box">
				<h3 align="center" style="margin-top:50px;margin-bottom:50px;">장바구니</h3>
				<form action="shop_cartEdit.jsp" name="edit_input">
				<table class="table table-striped">
					<tr>
						<th class="text-center"></th>
						<th class="text-center">상품정보</th>
						<th class="text-center">가격</th>
						<th class="text-center">수량</th>
						<th class="text-center">적립포인트</th>
						<th class="text-center">합계</th>
						<th class="text-center"></th>
					</tr>
				<%if(cart_lists.size()==0){ %>	
					<tr><td colspan=7>장바구니가 비어있습니다</td></tr>
					<%}
					for(ProductDTO b : cart_lists){%>
					<tr>
						<td><img src="<%=request.getContextPath()%>/img/<%=b.getPimage()%>" width=100 height=100></td>
						<td><%=b.getPname() %></td>
						<td>
							<input class="input_edit" type="text" name="price" value="<%=def.format(b.getPrice())%>" disabled size=2>
							<input type="hidden" name="point" value="<%=b.getPoint()%>" disabled>
						</td>
						<td>
							<img src="<%=request.getContextPath()%>/img/bullet_minus.png" width=24 height=24 style="border:0.5px solid #cacaca; cursor:pointer;" onclick="mOqty(<%=b.getPnum()%>,<%=b.getPqty()%>)">
							<input type="text" class="input_oqty" name="oqty" value="<%=b.getPqty()%>" size=1 readonly>
							<img src="<%=request.getContextPath()%>/img/bullet_plus.png" width=24 height=24 style="border:0.5px solid #cacaca; cursor:pointer;" onclick="pOqty(<%=b.getPnum()%>,<%=b.getPqty()%>)">
						</td>
						<td><input class="input_edit" type="text" name="totalpoint" value="<%=b.getTotalPoint()%>" disabled size=2></td>
						<td><input class="input_edit" type="text" name="totalprice" value="<%=def.format(b.getTotalPrice())%>" disabled size=2></td>
						<td>
							<a href="shop_cartDel.jsp?pnum=<%=b.getPnum()%>">
							<img src="<%=request.getContextPath()%>/img/delete_1.png" width=20 height=20>
							</a>
						</td>
					</tr>
					<%
						cTotalPrice+=b.getTotalPrice();
					}%>
				</table>
				<div style="margin-top:10px; margin-bottom:10px; border-bottom:1px solid lightgray;"></div>
				<div style="width:70%; margin:0 auto; margin-top:50px; margin-bottom:50px;">
					<table class="table table-bordered">
						<tr>
							<td class="col-md-2">선택 상품수</td>
							<td class="col-md-4">총 상품금액</td>
							<td class="col-md-2">포인트 사용</td>
							<td class="col-md-4">총 주문금액</td>
						</tr>
						<tr>
							<td><%=cart_lists.size() %>개</td>
							<td><%=def.format(cTotalPrice) %>원</td>
							<td>0원</td>
							<td><%=def.format(cTotalPrice) %>원</td>
						</tr>
					</table>
				</div>
				<div style="text-align:center;">
					<button type="button" class="btn btn-primary btn-lg" style="background:#32CD32;" onclick="location.href='shop_order.jsp'">상품주문</button>
					<button type="button" class="btn btn-primary btn-lg" style="background:#32CD32;" onclick="location.href='shop_main.jsp'">쇼핑계속하기</button>
				</div>
				</form>
			</div>
		</div>
	<%@ include file="shop_bottom.jsp" %>
