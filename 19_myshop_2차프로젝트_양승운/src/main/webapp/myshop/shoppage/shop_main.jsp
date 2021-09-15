<%@page import="java.text.DecimalFormat"%>
<%@page import="myshop.product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="myshop.product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="shop_top.jsp"%>
<div class="carousel_container">
	<div id="carousel-main-generic" class="carousel slide"
		data-ride="carousel">
		<div class="carousel-inner">
			<div class="item active">
				<img src="../../img/main_1_198.jpg">
			</div>
			<div class="item">
				<img src="../../img/main_1_235.jpg">
			</div>
			<div class="item">
				<img src="../../img/main_1_250.jpg">
			</div>
			<div class="item">
				<img src="../../img/main_1_258.jpg">
			</div>
			<div class="item">
				<img src="../../img/main_1_272.jpg">
			</div>
			<div class="item">
				<img src="../../img/main_1_277.jpg">
			</div>
			<div class="item">
				<img src="../../img/main_1_279.jpg">
			</div>
		</div>
		<a class="left carousel-control" href="#carousel-main-generic"
			data-slide="prev"> <span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#carousel-main-generic"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</div>
</div>
<div class="shop_container">
	<div class="shop_content_box">
		<%
		String [] spec = {"신제품","베스트","이달의 상품"};
		ProductDao pdao = ProductDao.getInstance();
		DecimalFormat def = new DecimalFormat("###,###");
		String pname = request.getParameter("pname");
		if(pname==null){
			for(int i=0;i<spec.length;i++){
				ArrayList<ProductDTO> item_lists = pdao.selectByPspec(spec[i]);
				if(item_lists.size()!=0){%>
			<h3 align="center"><%=spec[i]%></h3>
			<div class="shop_product_list">
				<%}
				int count=0;
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
					<%
					if(count==8){%>
					</div>
						<%break;
					}
					if(count%4==0){%>
					</div>
					<%}
				}
			}
		}
		else{
			ArrayList<ProductDTO> search_lists = pdao.selectBySearch(pname);%>
			<h3 align="center">검색 결과</h3>
			<div class="shop_product_list">
			<%int count=0;
				for(ProductDTO b :search_lists){
					count++;%>
						<div class="thumbnail" onclick="location.href='shop_prodview.jsp?pnum=<%=b.getPnum()%>'">
							<img src="<%=request.getContextPath()+"/img/"+b.getPimage()%>">
							<div class="caption">
								<b class="caption_product_name"><%=b.getPname()%></b>
								<b class="caption_product_price"><%=def.format(b.getPrice())%>원</b>
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
				<%}%>
		</div>
	</div>
<%@ include file="shop_bottom.jsp"%>
