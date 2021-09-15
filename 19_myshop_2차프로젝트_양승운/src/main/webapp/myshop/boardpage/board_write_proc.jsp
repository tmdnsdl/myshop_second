<%@page import="myshop.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bean" class="myshop.board.BoardDTO"/>
<jsp:setProperty name="bean" property="*"/>
<%
	String memid = (String)session.getAttribute("memid");
	bean.setId(memid);
	BoardDao dao = BoardDao.getInstance();
	int cnt = dao.insertArticle(bean);
	if(cnt!=0)
		response.sendRedirect("board_main.jsp");
	else
		response.sendRedirect("board_write.jsp");
%>