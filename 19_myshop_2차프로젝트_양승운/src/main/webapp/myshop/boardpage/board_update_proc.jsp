<%@page import="myshop.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="bean" class="myshop.board.BoardDTO"/>
<jsp:setProperty name="bean" property="*"/>
<%
	BoardDao dao = BoardDao.getInstance();
	bean.setId((String)session.getAttribute("memid"));
	int cnt = dao.updateArticle(bean); 
	if(cnt!=0)
		response.sendRedirect("board_main.jsp?pageNum="+pageNum);
	else
		response.sendRedirect("board_update.jsp?num="+bean.getNum()+"&pageNum=1");
%>