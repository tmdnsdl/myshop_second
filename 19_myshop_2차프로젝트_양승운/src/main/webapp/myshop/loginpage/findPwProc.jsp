<%@page import="myshop.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
findIdProc.jsp<br>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String rrn = request.getParameter("rrn");

	MemberDao mdao = MemberDao.getInstance();
	String pw = mdao.getMemberByIdAndRrn(id,rrn);
	
	if(!pw.equals("")){%>
	<script type="text/javascript">
	alert("비밀번호는 <%=pw%> 입니다.");
	location.href="login_main.jsp";
	</script>
	<%}
	else{%>
	<script type="text/javascript">
	alert("아이디/주민등록번호를 확인하세요");
	location.href="findPw.jsp";
	</script>
	<%}%>