<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<footer id="footer">
		<div class="footer_box">
			<div class="footer_content">
				<div class="footer_content_box">
					<div style="margin-right:50px;">
						<p style="margin-bottom:0;font-size:18px;">고객센터</p>
						<p style="margin-bottom:3px;font-size:22px;">1566-7878</p>
						<dl class="footer_info">
							<dt>평일</dt> 
							<dd>오전 09:00 ~ 오후 5:00</dd>
						</dl>
						<dl class="footer_info">
								<dt>점심</dt>
								<dd>오후 12:00 ~ 오후 1:00</dd>
						</dl>
						<dl class="footer_info">
								<dt>휴무</dt>
								<dd>토 / 일 / 공휴일은 휴무</dd>
						</dl>
					</div>
					<div style="border-right:0.5px solid lightgray; margin-right:50px;"></div>
					<div>
						<div>
							<ul class="footer_nav">
								<li><a href="<%=request.getContextPath()%>/myshop/shoppage/shop_intro.jsp"><b>회사소개</b></a></li>
								<li><b>공지사항</b></li>
								<li><b>자주묻는질문</b></li>
								<li><a href="<%=request.getContextPath()%>/myshop/boardpage/board_main.jsp"><b>고객센터</b></a></li> 
								<li><b>이용약관</b></li> 
								<li><b>개인정보취급방침</b></li> 
							</ul>
						</div>
						<p style="margin-top:40px;">Copyright NGR All Right Reserved</p>
						<div>
						고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 구매안전서비스 소비자 피해보상보험
						서비스를 이용하실 수 있습니다
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
<script src="../../js/jquery-1.11.3.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/jquery.js"></script>
<script src="../../js/check.js"></script>
<script>
  $('.carousel').carousel();
  function enterkey() {
      if (window.event.keyCode == 13) {
    	  
      }
}
</script>
</html>