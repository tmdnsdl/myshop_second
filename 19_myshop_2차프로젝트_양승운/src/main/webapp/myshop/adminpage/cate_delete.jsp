<%@page import="myshop.category.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cnum= Integer.parseInt(request.getParameter("cnum"));
	CategoryDao cdao = CategoryDao.getInstance();
	int cnt = cdao.deleteCategoryByCnum(cnum); 
	if(cnt>0){%>
	<script type="text/javascript">
		alert("delete 성공");
		location.href="cate_list.jsp";
	</script>
	<%}
	else{%>
	<script type="text/javascript">
		alert("delete 실패");
		location.href="cate_list.jsp";
	</script>	
	<%}
%>