<%@page import="myshop.product.ProductDTO"%>
<%@page import="myshop.product.ProductDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>관리자 페이지</title>
<%@ include file="../../myshop/shoppage/shop_top.jsp" %>
	<div class="admin_view_container">		
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
		<div class="admin_view_box">
			<%int pnum = Integer.parseInt(request.getParameter("pnum"));
			ProductDao pdao = ProductDao.getInstance();
			ProductDTO bean = pdao.selectByPnum(pnum);%>
			<table class="table table-striped">
				<tr>
					<td colspan="9" style="padding-bottom:10px;">
						<b style="font-size:20px;">상품 상세보기</b>
					</td>
				</tr>
				<tr>					
					<td>번호</td>
					<td><%=bean.getPnum()%></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><%=bean.getPname()%></td>
				</tr>
				<tr>
					<td>상품코드</td>
					<td><%=bean.getPcode()%></td>
				</tr>
				<tr>
					<td>상품카테고리</td>
					<td><%=bean.getPcategory()%></td>
				</tr>
				<tr>
					<td>제조사</td>
					<td><%=bean.getPcompany()%></td>
				</tr>
				<tr>
					<td>상품이미지</td>
					<td><img src="<%=request.getContextPath()+"/img/"+bean.getPimage()%>"></td>
				</tr>
				<tr>
					<td>상품수량</td>
					<td><%=bean.getPqty()%></td>
				</tr>
				<tr>
					<td>상품가격</td>
					<td><%=bean.getPrice()%></td>
				</tr>
				<tr>
					<td>상품분류</td>
					<td><%=bean.getPspec()%></td>
				</tr>
				<tr>
					<td>컨텐츠 이미지</td>
					<td><img src="<%=request.getContextPath()+"/img/"+bean.getPcontents_image()%>"></td>
				</tr>
				<tr>
					<td>상품포인트</td>
					<td><%=bean.getPoint()%></td>
				</tr>
				<tr>
					<td>등록일</td>
					<td><%=bean.getPinputdate()%></td>
				</tr>
				<tr>
					<td colspan=2 style="padding-top:20px;">
						<button class="btn btn-success" style="background:#32CD32; color:white;" onclick="location.href='prod_update.jsp?pnum=<%=bean.getPnum()%>'">수정</button>
						<button class="btn btn-success" style="background:#32CD32; color:white;" onclick="location.href='prod_delete.jsp?pnum=<%=bean.getPnum()%>'">삭제</button>
					</td>
				</tr>
			</table>
		</div>
	</div>		
<%@ include file="admin_bottom.jsp" %>
