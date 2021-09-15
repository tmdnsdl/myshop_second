<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너구리 공식 쇼핑몰</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/myshop.css?ver=<%=System.currentTimeMillis() %>">
<link rel="icon" href="<%=request.getContextPath()%>/img/logo.jpg" type="image/icon type">
</head>
<body>
	<header id="header">
		<div class="top_box">
			<div class="top_content_box">
				<div class="top_right_link">
					<ul class="top_right_text">
						<%
						String memid="";
						if(session.getAttribute("memid")!=null){
							memid = (String)session.getAttribute("memid");
							if(memid.equals("admin")){%>
							<li><a href="../../myshop/adminpage/admin_main.jsp">관리자</a></li>
							<%}%>
							<li><a href="../../myshop/loginpage/logout.jsp">로그아웃</a></li>
						<%}
						
						if(session.getAttribute("memid")==null){%>
							<li><a href="../../myshop/loginpage/login_main.jsp">로그인</a></li>
							<li><a href="../../myshop/loginpage/register.jsp">회원가입</a></li>
						<%}%>
						<li><a href="../../myshop/shoppage/shop_cartList.jsp">장바구니</a></li>
						<%if(session.getAttribute("memid")!=null){%>
						<li><a href="../../myshop/loginpage/update_info.jsp">마이페이지</a></li> 
						<%}%>
						<li><a href="../../myshop/boardpage/board_main.jsp">고객센터</a></li> 
					</ul> 
				</div> 
			</div>
		</div>
		<div class="mid_box">		
			<div class="mid_content_box">
				<div class="slide_product">
					<div id="carousel-sub-generic" class="carousel slide" data-ride="carousel">
             			<div class="carousel-inner">
             				<div class="item active">
								<img src="<%=request.getContextPath()%>/img/prod_1.jpg">
							</div>	 
             				<div class="item">
								<img src="<%=request.getContextPath()%>/img/prod_2.jpg">
							</div>	 
             				<div class="item">
								<img src="<%=request.getContextPath()%>/img/prod_3.jpg">
							</div>	 
						</div>
					</div>	
				</div>			
				<div class="main_logo">
					<a href="<%=request.getContextPath()%>/myshop/shoppage/shop_main.jsp">
						<img src="<%=request.getContextPath()%>/img/logo.png" width=300 height=100>
					</a>
				</div>			 
				<div class="search_bar">
					<form name="searchEngine">
						<input type="text" class="form-control" name="pname" placeholder="상품 검색" onkeyup="enterkey()">
					</form>
				</div>			
			</div>		
		</div>
		<nav class="bottom_box">
			<div class="bottom_content_box">
				<ul class="bottom_nav_text">
					<li>전체메뉴</li>
					<li><a href="<%=request.getContextPath()%>/myshop/shoppage/shop_new.jsp">신제품</a></li>
					<li><a href="<%=request.getContextPath()%>/myshop/shoppage/shop_best.jsp">베스트</a></li>
					<li><a href="<%=request.getContextPath()%>/myshop/shoppage/shop_free.jsp">이달의 상품</a></li>
					<li><a href="<%=request.getContextPath()%>/myshop/shoppage/shop_event.jsp">이벤트</a></li>
					<li>리뷰</li>
				</ul>
				<div style="position:absolute; right:0; top:0;">
					<img src="<%=request.getContextPath()%>/img/sale_1.jpg">
				</div>	
			</div>		
		</nav>
	</header>

							