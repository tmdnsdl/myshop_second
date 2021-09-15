<%@page import="myshop.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="myshop.member.MemberDTO"/>
<jsp:setProperty name="dto" property="*"/>

<%
	MemberDao mdao = MemberDao.getInstance();
	int cnt = mdao.insertData(dto);  
	if(cnt==1){%>
		<script type="text/javascript">
		alert("가입 성공");
		location.href="login_main.jsp";
		</script>
	<%}
	else{%>
		<script type="text/javascript">
		alert("가입 실패");
		location.href="register.jsp";
		</script>
	<%}%>