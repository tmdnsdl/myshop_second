<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>관리자 페이지</title>
<%@ include file="../../myshop/shoppage/shop_top.jsp" %>
	<div class="admin_container">		
		<nav class="admin_nav">
			<h3 align="center"><a href="admin_main.jsp">관리자 페이지</a></h3>
			<ul class="admin_menu">
				<li><a href="cate_input.jsp">카테고리 등록</a></li>
				<li><a href="cate_list.jsp">카테고리 목록</a></li>
				<li><a href="prod_input.jsp">상품 등록</a></li>
				<li><a href="prod_list.jsp">상품 목록</a></li>
				<li><a href="order_view.jsp">주문 조회</a></li>
			</ul>
		</nav>
		<div class="admin_content_box">
			<form action="cate_input_proc.jsp" method="post" onsubmit="return catecheck()">
			<p class="cate_title"><b>카테고리 등록</b></p>
				<table class="admin_table">
					<tr>
						<td>카테고리 코드</td>
						<td>
						<input type="text" class="form-control" name="code" placeholder="카테고리 코드">
						</td>
					</tr>
					<tr>
						<td>카테고리 이름</td>
						<td>
						<input type="text" class="form-control" name="cname" placeholder="카테고리 이름">
						</td>
					</tr>
					<tr align="center">
						<td colspan="2">
						<button class="btn btn-success" type="submit" style="background:#32CD32; color:white;">등록</button>
						<button class="btn btn-success" type="reset" style="background:#32CD32; color:white;">취소</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>		
<%@ include file="admin_bottom.jsp" %>
</body>
</html>