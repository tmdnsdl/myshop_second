<%@page import="myshop.product.ProductDTO"%>
<%@page import="java.io.File"%>
<%@page import="myshop.product.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int pnum = Integer.parseInt(request.getParameter("pnum"));
	ProductDao pdao = ProductDao.getInstance();
	ProductDTO bean = pdao.selectByPnum(pnum);	
	int cnt = pdao.deleteData(pnum); 
	
	if(cnt==1){
		File dir = new File(config.getServletContext().getRealPath("img"));
		if(bean.getPimage()!=null){
			File deletePimage = new File(dir, bean.getPimage());
			if(deletePimage.exists()){
				deletePimage.delete();
			}
		}
		if(bean.getPcontents_image()!=null){
			File deletePcontents_image = new File(dir, bean.getPcontents_image());
			if(deletePcontents_image.exists()){
				deletePcontents_image.delete();
			}
		}
	%>
	<script type="text/javascript">
		alert("delete 성공");
		location.href="prod_list.jsp";
	</script>
	<%}
	else{%>
	<script type="text/javascript">
		alert("delete 실패");
		location.href="prod_list.jsp";
	</script>	
	<%}
	
%>