<%@page import="myshop.category.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myshop.category.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>관리자 페이지</title>
<%@ include file="../../myshop/shoppage/shop_top.jsp" %>
<%
	CategoryDao cdao = CategoryDao.getInstance();
	ArrayList<CategoryDTO> cate_lists = cdao.getCategoryList();
%>
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
			<form action="prod_input_proc.jsp" method="post" name="prod_form" onsubmit="return prodcheck()" enctype="multipart/form-data">
				<p class="prod_title"><b>상품 등록</b></p>
				<table class="admin_prod_table">
					<tr>
						<td>카테고리</td>
						<td><select class="form-control" name="pcategory_ch">
						<%if(cate_lists.size()==0){%>
							<option value="">카테고리 없음</option>	
						<%}%>
						<%for(CategoryDTO bean:cate_lists){%>
						<option value="<%=bean.getCode()+"/"+bean.getCname()%>">[<%=bean.getCode()%>]&nbsp;<%=bean.getCname()%></option> 
						<%}%>
					</select></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td>
							<input type="text" class="form-control" name="pname" placeholder="상품명">
						</td>
					</tr>
					<tr>
						<td>제조사</td>
						<td>
							<input type="text" class="form-control" name="pcompany" placeholder="제조사">
						</td>
					</tr>
					<tr>
						<td>상품이미지</td>
						<td>
							<input type="file" name="pimage">
						</td>
					</tr>
					<tr>
						<td>상품 수량</td>
						<td>
							<input type="text" class="form-control" name="pqty" placeholder="50">
						</td>
					</tr>
					<tr>
						<td>상품 가격</td>
						<td>
							<input type="text" class="form-control" name="price" placeholder="숫자만 입력">
						</td>
					</tr>
					<tr>
						<td>상품 분류</td>
						<td>
							<select class="form-control" name="pspec">
								<option value="신제품">신제품</option>					
								<option value="베스트">베스트</option>					
								<option value="이달의 상품">이달의 상품</option>					
							</select>
						</td>
					</tr>
					<tr>
						<td>컨텐츠 이미지</td>
						<td>
							<input type="file" name="pcontents_image">
						</td>
					</tr>
					<tr>
						<td>상품 포인트</td>
						<td>
							<input type="text" class="form-control" name="point" value="100">
						</td>
					</tr>
					<tr><td colspan=2>&nbsp;</td></tr>
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
