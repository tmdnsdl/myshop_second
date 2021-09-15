<%@page import="myshop.product.ProductDTO"%>
<%@page import="myshop.product.ProductDao"%>
<%@page import="myshop.category.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myshop.category.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>관리자 페이지</title>
<%@ include file="../../myshop/shoppage/shop_top.jsp" %>
<%
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	ProductDao pdao =ProductDao.getInstance();
	ProductDTO pb = pdao.selectByPnum(pnum); 
	CategoryDao cdao = CategoryDao.getInstance();
	ArrayList<CategoryDTO> cate_lists = cdao.getCategoryList();
	String pcate = pb.getPcode()+pb.getPcategory();
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
			<form action="prod_update_proc.jsp" method="post" enctype="multipart/form-data">
				<p class="prod_title"><b>상품 수정</b></p>
				<table class="admin_update_table">
					<tr>
						<td>카테고리</td>
						<td><select class="form-control" name="pcategory_ch">
						<%if(cate_lists.size()==0){%>
							<option value="">카테고리 없음</option>	
						<%}%>
						<%for(CategoryDTO cb:cate_lists){
						String ccate = cb.getCode()+cb.getCname();%>
						<option value="<%=cb.getCode()+"/"+cb.getCname()%>" <%if(ccate.equals(pcate)){%>selected<%}%>>[<%=cb.getCode()%>]&nbsp;<%=cb.getCname()%></option> 
						<%}%>
					</select></td>
					</tr>
					<tr>
						<td>상품명</td>
						<td>
							<input type="hidden" name="pnum" value="<%=pb.getPnum()%>">
							<input type="text" class="form-control" name="pname" value="<%=pb.getPname()%>">
						</td>
					</tr>
					<tr>
						<td>제조사</td>
						<td>
							<input type="text" class="form-control" name="pcompany" value="<%=pb.getPcompany()%>">
						</td>
					</tr>
					<tr>
						<td>상품이미지</td>
						<td>
							<input type="file" name="pimage" style="padding-bottom:5px;">
							<input type="text" class="form-control" value="<%=pb.getPimage()%>" disabled>
							<input type="hidden" name="pimage_old" value="<%=pb.getPimage()%>">
						</td>
					</tr>
					<tr>
						<td>상품 수량</td>
						<td>
							<input type="text" class="form-control" name="pqty" value="<%=pb.getPqty()%>">
						</td>
					</tr>
					<tr>
						<td>상품 가격</td>
						<td>
							<input type="text" class="form-control" name="price" value="<%=pb.getPrice()%>">
						</td>
					</tr>
					<tr>
						<td>상품 분류</td>
						<td>
							<select class="form-control" name="pspec">
								<option value="신제품" <%if(pb.getPspec().equals("신제품")){%>selected<%}%>>신제품</option>					
								<option value="베스트" <%if(pb.getPspec().equals("베스트")){%>selected<%}%>>베스트</option>					
								<option value="무료배송" <%if(pb.getPspec().equals("무료배송")){%>selected<%}%>>무료배송</option>					
							</select>
						</td>
					</tr>
					<tr>
						<td>컨텐츠 이미지</td>
						<td>
							<input type="file" name="pcontents_image" style="padding-bottom:5px;">
							<input type="text" class="form-control" value="<%=pb.getPcontents_image()%>" disabled>
							<input type="hidden" name="pcontents_image_old" value="<%=pb.getPcontents_image()%>">
						</td>
					</tr>
					<tr>
						<td>상품 포인트</td>
						<td>
							<input type="text" class="form-control" name="point" value="<%=pb.getPoint()%>">
						</td>
					</tr>
					<tr align="center">
						<td colspan="2" style="padding-top:20px;">
						<button class="btn btn-success" type="submit" style="background:#32CD32; color:white;">수정</button>
						<button class="btn btn-success" type="button" style="background:#32CD32; color:white;" onclick="location.href='prod_list.jsp'">취소</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>		
<%@ include file="admin_bottom.jsp" %>
