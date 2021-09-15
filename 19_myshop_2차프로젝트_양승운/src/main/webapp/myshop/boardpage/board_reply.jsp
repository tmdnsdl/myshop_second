<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../myshop/shoppage/shop_top.jsp" %>
<div class="board_container">
	<div class="board_content_box">
		<h3 align="center">답글작성</h3>
		<%
			int num = Integer.parseInt(request.getParameter("num"));	
		%>
		<form action="board_reply_proc.jsp" method="post">
			<input type="hidden" name="num" value="<%=num%>">
			<input type="hidden" name="type" value="답글">			
			<table class="board_table">
				<tr>
					<td>이메일</td>
					<td><input type="text" class="form-control" name="email" value="admin@ngr.com"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" class="form-control" name="subject" placeholder="제목"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea class="form-control" name="content" rows="6"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="btn btn-success" type="submit" style="background:#32CD32; color:white;">작성</button>
						<button class="btn btn-success" type="button" style="background:#32CD32; color:white;" onclick="location.href='board_main.jsp'">목록이동</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<%@ include file="../../myshop/shoppage/shop_bottom.jsp" %>