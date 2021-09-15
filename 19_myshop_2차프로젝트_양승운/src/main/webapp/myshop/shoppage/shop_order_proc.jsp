<%@page import="myshop.order.OrderDao"%>
<%@page import="myshop.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cartbean" class="myshop.order.CartDTO" scope="session"/>
<%
	ArrayList<ProductDTO> cart_lists = cartbean.getAllProducts();
	int memno = (Integer)session.getAttribute("memno");
	String memid = (String)session.getAttribute("memid");
	String ordername= request.getParameter("username");
	String orderhp= request.getParameter("userhp");
	String orderaddr= request.getParameter("useraddr");
	
	OrderDao odao = OrderDao.getInstance();
	int cnt = odao.insertOrder(cart_lists, memno,ordername,orderhp,orderaddr);  
	 
	if(memid.equals("admin")){
		cartbean.removeAllProduct();%>
		<script>
		alert('관리자는 주문할 수 없습니다');
		location.href="shop_main.jsp";
		</script>
		<%}
	else{
	if(cnt>0){
		cartbean.removeAllProduct();
	%>
		<script>
		alert('<%=cnt%>건의 주문이 완료되었습니다');
		location.href="shop_main.jsp";
		</script>
	<%}
	else{%>
		<script>
		alert('주문 실패');
		location.href="shop_main.jsp";
		</script>
	<%}
	}%>