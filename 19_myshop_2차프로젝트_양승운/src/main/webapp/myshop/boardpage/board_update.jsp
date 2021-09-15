<%@page import="myshop.board.BoardDTO"%>
<%@page import="myshop.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../myshop/shoppage/shop_top.jsp" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	BoardDao dao = BoardDao.getInstance();
	BoardDTO article = dao.getArticle(num);
%>
<div class="board_container">
	<div class="board_content_box">
		<h3 align="center">문의 수정</h3>
		<form action="board_update_proc.jsp" method="post">
			<table class="board_table">
				<tr>		
					<td>문의사항</td>		
					<td>
						<select class="form-control" name="type">
							<option <%if(article.getType().equals("주문/배송")){%>selected<%}%>>주문/배송</option>
							<option <%if(article.getType().equals("결제/취소")){%>selected<%}%>>결제/취소</option>
							<option <%if(article.getType().equals("교환/반품")){%>selected<%}%>>교환/반품</option>
							<option <%if(article.getType().equals("회원/가입")){%>selected<%}%>>회원/가입</option>
						</select>
						<input type="hidden" name="num" value="<%=num%>">
						<input type="hidden" name="pageNum" value="<%=pageNum%>">
					</td>		
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" class="form-control" name="email" value="<%=article.getEmail()%>"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" class="form-control" name="subject" value="<%=article.getSubject()%>"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea class="form-control" name="content" rows="5"><%=article.getContent()%></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="btn btn-success" type="submit" style="background:#32CD32; color:white;">수정</button>
						<button class="btn btn-success" type="button" style="background:#32CD32; color:white;" onclick="location.href='board_main.jsp'">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<%@ include file="../../myshop/shoppage/shop_bottom.jsp" %>