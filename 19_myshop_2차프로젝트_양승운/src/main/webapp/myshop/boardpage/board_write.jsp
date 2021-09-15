<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../myshop/shoppage/shop_top.jsp" %>
<div class="board_container">
	<div class="board_content_box">
		<h3 align="center">문의 글쓰기</h3>
		<form action="board_write_proc.jsp" method="post" onsubmit="boardcheck()">
			<table class="board_table">
				<tr>		
					<td>문의사항</td>		
					<td>
						<select class="form-control" name="type">
							<option>주문/배송</option>
							<option>결제/취소</option>
							<option>교환/반품</option>
							<option>회원/가입</option>
						</select>
					</td>		
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" class="form-control" name="email" placeholder="abc@naver.com"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" class="form-control" name="subject" placeholder="제목"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea class="form-control" name="content" rows="5"></textarea></td>
				</tr>
				<tr>
					<td colspan="2">
						<button class="btn btn-success" type="submit" style="background:#32CD32; color:white;">글쓰기</button>
						<button class="btn btn-success" type="button" style="background:#32CD32; color:white;" onclick="location.href='board_main.jsp'">목록이동</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<%@ include file="../../myshop/shoppage/shop_bottom.jsp" %>