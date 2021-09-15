<%@page import="myshop.board.ReplyDTO"%>
<%@page import="myshop.board.BoardDao"%>
<%@page import="myshop.board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../shoppage/shop_top.jsp" %>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDao dao = BoardDao.getInstance();
		BoardDTO article = dao.getArticle(num);
		ReplyDTO b = dao.getReply(article.getNum());
	%>
		<div class="board_container">
			<div class="board_content_box">
				<h3 align="center">문의게시판</h3>
				<table class="table table-striped">
					<tr>
						<th class="text-center" width="10%"><%=article.getType() %></th>
						<th class="text-center" width="10%"><%=article.getId() %></th>
						<th class="text-center" width="60%"><%=article.getSubject() %></th>
						<th class="text-center" width="20%"><%=article.getReg_date() %></th>
					</tr>
					<tr>
						<td colspan="4" style="text-align:left; padding-left:30px;"><%=article.getContent() %></td>
					</tr>
				</table>
				<div style="border-bottom:1px solid lightgray; margin-bottom:20px;"></div>
				<div style="text-align:center;">
					<%if(article.getId().equals(memid)){ %>
					<button class="btn btn-primary btn-lg" style="background:#32CD32; color:white;" type="button" onclick="location.href='board_update.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">수정</button>
					<button class="btn btn-primary btn-lg" style="background:#32CD32; color:white;" type="button" onclick="location.href='board_delete.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">삭제</button>
					<%} %>
					<%if(memid.equals("admin")){ %>
						<button class="btn btn-primary btn-lg" style="background:#32CD32; color:white;" type="button" onclick="location.href='board_reply.jsp?num=<%=num%>'">답글쓰기</button>
					<%} %>
					<button class="btn btn-primary btn-lg" style="background:#32CD32; color:white;" type="button" onclick="location.href='board_main.jsp?pageNum=<%=pageNum%>'">목록</button>
				</div>
				<%if(b!=null){ %>
				<table class="reply_table">
					<tr>
						<th width="10%" style="padding:10px;">너구리몰</th>
						<th width="90%" class="text-right" style="padding:10px;"><%=b.getReg_date() %></th>						
					</tr>
					<tr>
						<td colspan=2 style="text-align:left; padding:10px;"><%=b.getContent() %></td>					
					</tr>
				</table>
				<%} %>
			</div>
		</div>
	<%@ include file="./../shoppage/shop_bottom.jsp" %>
