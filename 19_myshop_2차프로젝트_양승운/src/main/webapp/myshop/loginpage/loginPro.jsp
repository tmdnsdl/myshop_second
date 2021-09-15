<%@page import="myshop.member.MemberDTO"%>
<%@page import="myshop.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDao mdao = MemberDao.getInstance();
	MemberDTO member = mdao.getMemberInfo(id,pw); 
	
	if(member!=null){
	session.setAttribute("memid", id);
	session.setAttribute("memno", member.getNo());
	session.setAttribute("memname", member.getName());
	session.setAttribute("memhp", member.getHp());
	session.setAttribute("memaddr", member.getAddress());
	session.setAttribute("mememail", member.getEmail());
	%>
	<script type="text/javascript">
	alert("로그인 성공");
	<%if(id.equals("admin")){%>
	location.href="<%=request.getContextPath()%>/myshop/adminpage/admin_main.jsp";		
	<%}else{%>	
	location.href="<%=request.getContextPath()%>/myshop/shoppage/shop_main.jsp";				
	<%}%>
	</script>
	<%}
	else{%>
	<script type="text/javascript">
	alert("아이디/비밀번호를 확인해주세요");
	location.href="<%=request.getContextPath()%>/myshop/loginpage/login_main.jsp";
	</script>
	<%}%>