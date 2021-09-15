<%@page import="java.text.DecimalFormat"%>
<%@page import="myshop.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myshop.product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%@ include file="shop_top.jsp" %>
		<div class="product_container">
			<div class="product_content_box">
				<% int pnum = Integer.parseInt(request.getParameter("pnum"));
				ProductDao pdao = ProductDao.getInstance();
				ProductDTO bean = pdao.selectByPnum(pnum);
				DecimalFormat def = new DecimalFormat("###,###");%>
				<div style="display:flex; margin-top:50px;">
					<div style="width:600px;"><img src="<%=request.getContextPath() %>/img/<%=bean.getPimage()%>" width=620></div>
					<div style="width:600px; margin-left:40px;">
						<div class="product_content_txt">
							<span style="color:gray;">[<%=bean.getPcode() %>]&nbsp;<%=bean.getPcategory() %></span>
							<span style="font-size:30px;"><b><%=bean.getPname() %></b></span>
							<span style="border-bottom:1px solid lightgray; padding-top:10px; margin-bottom:10px;"></span>
							<span style="font-size:20px; color:red;"><b><%=def.format(bean.getPrice()) %>원</b></span>
							<span><img src="../../img/free_delivery.png"></span>
							<span style="font-size:16px;">포인트 적립 : <%=bean.getPoint() %> 포인트</span>
							<form name="prodview_form">
								<span style="font-size:16px;">
									주문 수량 &nbsp;
									<img src="<%=request.getContextPath()%>/img/bullet_minus.png" width=24 height=24 style="border:0.5px solid #cacaca; cursor:pointer;" onclick="minusOqty()">
									<input type="text" name="oqty" size=1 value="1" size=2 readonly>
									<input type="hidden" name="mid" value="<%=memid%>">
									<img src="<%=request.getContextPath()%>/img/bullet_plus.png" width=24 height=24 style="border:0.5px solid #cacaca; cursor:pointer;" onclick="plusOqty()">
								</span>
								<span style="font-size:16px;">재고 수량 &nbsp;<input type="text" name="pqty" size=2 value="<%=bean.getPqty()%>" disabled></span>
								<div style="text-align:center;margin-top:30px;">
									<button type="button" class="btn btn-primary btn-lg" style="background:#32CD32;" onclick="cartAdd(<%=pnum%>)">장바구니 담기</button>
									<button type="button" class="btn btn-primary btn-lg" style="background:#32CD32;" onclick="alert(0)">바로구매</button>
								</div>
							</form>
						</div>
					</div>
				</div> 
				<div style="border-top:1px solid lightgray; margin-top:100px;"></div>
				<div style="text-align:center; margin-top:100px;">
					<img src="<%=request.getContextPath() %>/img/<%=bean.getPcontents_image()%>">
				</div>
			</div>
		</div>
	<%@ include file="shop_bottom.jsp" %>

