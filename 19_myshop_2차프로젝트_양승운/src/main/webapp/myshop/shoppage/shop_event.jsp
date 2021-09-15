<%@page import="myshop.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myshop.product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="shop_top.jsp" %>
		<div class="shop_container">
			<div class="shop_content_box">
			<%String [] event = 
			{"main_1_20.jpg","main_1_24.jpg","main_1_28.jpg","main_1_29.jpg","main_1_43.jpg","main_1_44.jpg"}; %>
				<h3 align="center">이벤트</h3>
				<div class="shop_product_list">
					<% int count=0;
					for(int i=0;i<event.length;i++){
						count++;
					%>
					<div class="thumbnail">
       					<img src="<%=request.getContextPath()%>/img/<%=event[i]%>" style="width:400px;height:400px;">
        				<div class="caption">
	          				<h4>8월의 이벤트</h4>
	          				<p>[기간] 2021/08/01 ~ 2021/08/31</p>
          				</div>
          			</div>	
					<%
						if(count%3==0){%>
							</div><div class="shop_product_list">
						<%}
					}%>
				</div>
			</div>
		</div>
	<%@ include file="shop_bottom.jsp" %>
