<%@page import="myshop.product.ProductDTO"%>
<%@page import="myshop.product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cartbean" class="myshop.order.CartDTO" scope="session"/>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	int oqty = Integer.parseInt(request.getParameter("oqty"));

	ProductDao pdao = ProductDao.getInstance();
	ProductDTO bean = pdao.selectByPnum(pnum); 
		if(oqty>bean.getPqty()){%>
		<script>
			alert("수량 초과");
			location.href="shop_cartList.jsp";
		</script>	
		<%return;}
	cartbean.setEdit(pnum, oqty); 
	response.sendRedirect("shop_cartList.jsp");
%>
