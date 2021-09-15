<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="cartbean" class="myshop.order.CartDTO" scope="session"/>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	cartbean.removeProduct(pnum);
	response.sendRedirect("shop_cartList.jsp");
%>