<%@page import="java.text.DecimalFormat"%>
<%@page import="myshop.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myshop.product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%@ include file="shop_top.jsp" %>
		<div class="shop_container">
			<div class="shop_content_box">
				<% 
				ProductDao pdao = ProductDao.getInstance();
				DecimalFormat def = new DecimalFormat("###,###");
				ArrayList<ProductDTO> item_lists = pdao.selectByPspec("신제품");%>
				<h3 align="center">신제품</h3>
				<div class="shop_product_list">
				<%int count=0;
					for(ProductDTO bean :item_lists){
						count++;%>
							<div class="thumbnail" onclick="location.href='shop_prodview.jsp?pnum=<%=bean.getPnum()%>'">
								<img src="<%=request.getContextPath()+"/img/"+bean.getPimage()%>">
								<div class="caption">
									<b class="caption_product_name"><%=bean.getPname()%></b>
									<b class="caption_product_price"><%=def.format(bean.getPrice())%>원</b>
									<img src="../../img/free_delivery.png">
								</div>
							</div>
			          	<%if(count==36){%>
			          		</div>
			          		<%break;
			          	}
			          	if(count%4==0){%>
							</div><div class="shop_product_list">
							<%}
						}%>
				</div>
			</div>
	<%@ include file="shop_bottom.jsp" %>
