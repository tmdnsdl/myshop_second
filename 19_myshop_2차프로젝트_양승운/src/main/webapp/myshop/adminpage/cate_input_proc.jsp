<%@page import="myshop.category.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bean" class="myshop.category.CategoryDTO"/>
<jsp:setProperty property="*" name="bean"/>
<%
	CategoryDao cdao = CategoryDao.getInstance();
	int cnt = cdao.insertCategory(bean); 
	if(cnt==1){%>
	<script type="text/javascript">
		alert("insert 성공");
		location.href="cate_list.jsp";
	</script>
	<%}
	else{%>
	<script type="text/javascript">
		alert("insert 실패");
		location.href="cate_input.jsp";
	</script>	
	<%}
%>