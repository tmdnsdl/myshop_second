<%@page import="myshop.product.ProductDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int filesize = 1024 * 1024 * 50; // 50메가
	String uploadDir = config.getServletContext().getRealPath("img");
	MultipartRequest mr = new MultipartRequest(request,uploadDir,filesize,"UTF-8");
	
	ProductDao pdao = ProductDao.getInstance();
	int cnt = pdao.insertProduct(mr); 
	if(cnt>0){%>
	<script type="text/javascript">
		alert("insert 성공");
		location.href="prod_list.jsp";
	</script>
	<%}
	else{%>
	<script type="text/javascript">
		alert("insert 실패");
		location.href="prod_input.jsp";
	</script>	
	<%}
	
%>