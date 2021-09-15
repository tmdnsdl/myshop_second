<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<title>로그인 페이지</title>
<%@ include file="../../myshop/shoppage/shop_top.jsp" %>
<div class="login_container">
	<div class="login_box">
		<h3>아이디/비밀번호 찾기</h3>
		<form action="findPwProc.jsp" method="post" onsubmit="return findPwcheck()">
			<table class="login_table">
				<tr align="center" class="login_cate_box">
					<td><a href="login_main.jsp"><b style="color:#555">로그인</b></a></td>
					<td style="padding-left:15px;"><a href="findId.jsp"><b style="color:#555">아이디찾기</b></a></td>
					<td><a href="findPw.jsp"><b style="color:#555">비밀번호찾기</b></a></td>
				</tr>
				<tr class="login_find_box">
					<td colspan="3">
					<span>아이디</span>
					<input type="text" class="form-control" name="id" placeholder="아이디">
					<span>주민등록번호</span>
					<input type="text" class="form-control" name="rrn" placeholder="000000-0000000" maxlength="14"></td>
				</tr>
				<tr>
					<td colspan="3">
					<button class="btn btn-default btn-lg btn-block" type="submit" style="background:#32CD32; color:white;">비밀번호 찾기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<%@ include file="../../myshop/shoppage/shop_bottom.jsp" %>