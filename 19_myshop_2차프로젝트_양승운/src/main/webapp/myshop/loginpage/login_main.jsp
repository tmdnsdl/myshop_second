<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>로그인 페이지</title>
<%@ include file="../../myshop/shoppage/shop_top.jsp" %>
<div class="login_container">
	<div class="login_box">
		<h3>로그인</h3>
		<form action="loginPro.jsp" method="post" onsubmit="return logincheck()">
			<table class="login_table">
				<tr align="center" class="login_cate_box">
					<td><a href="register.jsp"><b style="color:#555;">회원가입</b></a></td>
					<td><a href="findId.jsp"><b style="color:#555; margin-left:10px; margin-right:-10px;">아이디찾기</b></a></td>
					<td><a href="findPw.jsp"><b style="color:#555">비밀번호찾기</b></a></td>
				</tr>
				<tr class="login_input_box">
					<td colspan="3"><input type="text" class="form-control" name="id" placeholder="아이디">
					<input type="password" class="form-control" name="pw" placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td colspan="3">
					<button class="btn btn-default btn-lg btn-block" type="submit" style="background:#32CD32; color:white;">로그인</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<%@ include file="../../myshop/shoppage/shop_bottom.jsp" %>