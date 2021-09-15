<%@page import="java.io.File"%>
<%@page import="myshop.product.ProductDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int filesize = 1024 * 1024 * 50; // 50메가
	String uploadDir = config.getServletContext().getRealPath("img");
	MultipartRequest mr = new MultipartRequest(request,uploadDir,filesize,"UTF-8");
	
	String pimage = mr.getFilesystemName("pimage");
	String pimage_old = mr.getParameter("pimage_old");

	String pcontents_image = mr.getFilesystemName("pcontents_image");
	String pcontents_image_old = mr.getParameter("pcontents_image_old");
	
	ProductDao pdao = ProductDao.getInstance();
	int cnt = pdao.updateProduct(mr);  
	
	File dir = new File(uploadDir);
	if(pimage!=null){
		if(pimage_old!=null){
			File deletePimage = new File(dir, pimage_old);
			if(deletePimage.exists()){
				deletePimage.delete();
			}
		}
	}
	if(pcontents_image!=null){
		if(pcontents_image_old!=null){
			File deletePcontents_image = new File(dir, pcontents_image_old);
			if(deletePcontents_image.exists()){
				deletePcontents_image.delete();
			}
		}
	}
	
	if(cnt>0){%>
	<script type="text/javascript">
		alert("update 성공");
		location.href="prod_list.jsp";
	</script>
	<%}
	else{%>
	<script type="text/javascript">
		alert("update 실패");
		location.href="prod_update.jsp?pnum=<%=mr.getParameter("pnum")%>";
	</script>	
	<%}
	
%>