<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>회원가입 페이지</title>
<%@ include file="../../myshop/shoppage/shop_top.jsp" %>
<div class="login_container">
	<div class="login_box">
		<h3>회원가입</h3>
		<form action="registerProc.jsp" method="post" onsubmit="return registercheck()">
			<table class="register_table">
				<tr>		
				<td>아이디</td>		
				<td><input type="text" class="form-control" name="id" placeholder="아이디" onkeydown="duplicatecheck()"></td>
				<td align="right"><button type="button" class="btn btn-success" onclick="return duplicate()">중복확인</button></td>		
				</tr>
				<tr>
					<td>비밀번호</td>
					<td colspan=2><input type="password" class="form-control" name="pw" placeholder="6~16자 사이의 숫자/영문자 조합" onblur="Pwcheck()"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td colspan=2><input type="password" class="form-control" name="pw_confirm" placeholder="비밀번호 확인" onblur="pwConfirm()"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan=2><input type="text" class="form-control" name="name" placeholder="이름"></td>
				</tr>
				<tr>
					<td>주민등록번호</td>
					<td colspan=2><input type="text" class="form-control" name="rrn" placeholder="000000-0000000" maxlength="14"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan=2><input type="text" class="form-control" name="email" placeholder="이메일"></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td colspan=2><input type="text" class="form-control" name="hp" placeholder="01012345678"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td colspan=2><input type="text" class="form-control" name="address" placeholder="주소"></td>
				</tr>
				<tr>
					<td colspan=3 height="50px"><input type='checkbox' name="confirm"> 이용약관 동의</td>
				</tr>
				<tr align="center"><td colspan="3">
				<button style="margin-top:30px; width:100px;" class="btn btn-success" type="submit" style="background:#32CD32; color:white;">회원가입</button>
				</td></tr>
			</table>
		</form>
	</div>
</div>
<%@ include file="../../myshop/shoppage/shop_bottom.jsp" %>