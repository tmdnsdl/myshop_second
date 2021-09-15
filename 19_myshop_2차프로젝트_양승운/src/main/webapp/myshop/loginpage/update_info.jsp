<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>마이페이지</title>
<%@ include file="../../myshop/shoppage/shop_top.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
String email = (String)session.getAttribute("mememail");
String hp = (String)session.getAttribute("memhp");
String addr = (String)session.getAttribute("memaddr");
%>
<div class="login_container">
	<div class="login_box">
		<h3>회원정보 수정</h3>
		<form action="update_info_proc.jsp" method="post">
			<table class="register_table">
				<tr>		
					<td>아이디</td>		
					<td>
						<input type="text" class="form-control" value="<%=memid%>" disabled>
						<input type="hidden" name="id" value="<%=memid%>">
					</td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td colspan=2><input type="password" class="form-control" name="pw" placeholder="비밀번호 확인"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan=2><input type="text" class="form-control" name="email" value="<%=email%>"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td colspan=2><input type="text" class="form-control" name="hp" value="<%=hp%>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td colspan=2><input type="text" class="form-control" name="address" value="<%=addr%>"></td>
				</tr>
				<tr align="center"><td colspan="3">
				<button style="margin-top:30px; background:#32CD32; color:white;" class="btn btn-success" type="submit">개인정보 수정</button>
				</td></tr>
			</table>
		</form>
	</div>
</div>
<%@ include file="../../myshop/shoppage/shop_bottom.jsp" %>