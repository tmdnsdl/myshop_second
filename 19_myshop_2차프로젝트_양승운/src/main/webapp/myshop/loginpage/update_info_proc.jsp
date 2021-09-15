<%@page import="myshop.member.MemberDTO"%>
<%@page import="myshop.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="dto" class="myshop.member.MemberDTO"/>
<jsp:setProperty name="dto" property="*"/>
	<%MemberDao mdao = MemberDao.getInstance();
	MemberDTO member = mdao.getMemberInfo(dto.getId(),dto.getPw()); 
	
	
	if(member!=null){
		int cnt = mdao.updateMember(dto);
		if(cnt==1){
			session.setAttribute("memhp", dto.getHp());
			session.setAttribute("memaddr", dto.getAddress());
			session.setAttribute("mememail", dto.getEmail());
			%>
			<script type="text/javascript">
				alert("수정 성공");
				location.href="<%=request.getContextPath()%>/myshop/shoppage/shop_main.jsp";
			</script>
		<%}
		else{%>
			<script type="text/javascript">
				alert("수정 실패");
				location.href="<%=request.getContextPath()%>/myshop/loginpage/update_info.jsp";
			</script>
		<%}
	}
	else{%>
	<script type="text/javascript">
		alert("비밀번호가 틀립니다");
		location.href="<%=request.getContextPath()%>/myshop/loginpage/update_info.jsp";
	</script>
	<%}%>