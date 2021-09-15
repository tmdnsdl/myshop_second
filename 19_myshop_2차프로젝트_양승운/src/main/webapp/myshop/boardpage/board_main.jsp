<%@page import="myshop.board.BoardDao"%>
<%@page import="myshop.board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="./../shoppage/shop_top.jsp" %>
	<%
		int pageSize = 10; 
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize+1; 
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		ArrayList<BoardDTO> boardlist = null;
		
		BoardDao dao = BoardDao.getInstance();
		count = dao.getArticleCount(); 
		if(count >0){
			boardlist = dao.getArticles(startRow, endRow);
		}
		number = count-(currentPage-1) * pageSize;
	%>
		<div class="board_container">
			<div class="board_content_box">
				<h3 align="center">문의게시판</h3>
				<table class="table table-striped">
					<tr>
						<th class="text-center" width="5%">번호</th>
						<th class="text-center" width="10%">문의내용</th>
						<th class="text-center" width="10%">아이디</th>
						<th class="text-center" width="50%">제목</th>
						<th class="text-center" width="20%">작성일</th>
					</tr>
					<%if(count == 0){%>
						<tr>
							<td colspan=5 align="center">문의사항이 없습니다</td>
						</tr>
					<%}
					else{
						for(BoardDTO b : boardlist){%>
							<tr style="cursor:pointer" onclick="location.href='board_content.jsp?num=<%=b.getNum()%>&pageNum=<%=pageNum%>'">
								<td><%=number-- %></td>
								<td><%=b.getType() %></td>
								<td><%=b.getId()%></td>
								<td><%=b.getSubject() %>&nbsp;<%if(b.getRe_count()>0){%><b>[답변완료]</b><%} %></td>
								<td><%=b.getReg_date() %></td>
							</tr>
						<%}
					}%>
					<tr>
						<td colspan=5 align=center>
							<%
							if(count>0){
								int pageCount = count/pageSize +  (count%pageSize==0? 0:1);
								int pageBlock = 10;
								int startPage = ((currentPage-1)/pageBlock*pageBlock)+1;
								int endPage = startPage + pageBlock-1;
								if(endPage > pageCount){
									endPage = pageCount;
								}
								if(startPage > 10){%>
									<a href="board_main.jsp?pageNum=<%=startPage-10%>">[이전]</a>	
								<%}
								for(int i=startPage;i<=endPage;i++){%>
									<a href="board_main.jsp?pageNum=<%=i%>">[<%=i%>]</a>	
								<%}
								if(endPage < pageCount){%>
									<a href="board_main.jsp?pageNum=<%=startPage+10%>">[다음]</a>
								<%}
							}%>
						</td>
					</tr>
				</table>
				<div style="text-align:center;">				
					<input type="hidden" name="memid" value="<%=memid%>">
					<button type="button" class="btn btn-primary btn-lg" style="background:#32CD32; color:white;" onclick="return writeIdcheck()">글쓰기</button>
				</div>
			</div>
		</div>
	<%@ include file="./../shoppage/shop_bottom.jsp" %>
