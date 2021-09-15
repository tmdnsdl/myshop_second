<%@page import="myshop.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int num = Integer.parseInt(request.getParameter("num"));
int pageNum = Integer.parseInt(request.getParameter("pageNum"));
String id = (String)session.getAttribute("memid");
BoardDao dao = BoardDao.getInstance();
int cnt = dao.deleteArticle(num, id);   
int pageSize=10;

if(cnt!=0){
	int recordcount = dao.getArticleCount(); 
	int pageCount = recordcount/pageSize +  (recordcount%pageSize==0? 0:1);
	if(pageCount < pageNum){
	response.sendRedirect("board_main.jsp?pageNum="+(pageNum-1));		
	}
	else{
	response.sendRedirect("board_main.jsp?pageNum="+pageNum);				
	}
}
else{%>
<script type="text/javascript">
	alert("삭제 권한이 없습니다");
	history.back();
</script>	
	<%}%>