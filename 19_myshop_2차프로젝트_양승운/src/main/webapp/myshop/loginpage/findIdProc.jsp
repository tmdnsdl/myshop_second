<%@page import="myshop.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findIdProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String rrn = request.getParameter("rrn");

	MemberDao mdao = MemberDao.getInstance();
	String id = mdao.getMemberByrrn(name,rrn);
	
	if(!id.equals("")){%>
	<script type="text/javascript">
	alert("아이디는 <%=id%> 입니다.");
	location.href="login_main.jsp";
	</script>
	<%}
	else{%>
	<script type="text/javascript">
	alert("이름/주민등록번호를 확인해주세요");
	location.href="findId.jsp";
	</script>
	<%}%>