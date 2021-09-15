
function findIdcheck(){
	if($('input[name="name"]').val()==''){
		alert("이름을 입력하세요");
		$('input[name="name"]').focus();
		return false;
	}
	if($('input[name="rrn"]').val()==''){
		alert("주민등록번호를 입력하세요");
		$('input[name="rrn"]').focus();
		return false;
	}
	const regexp = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;

	if($('input[name="rrn"]').val()!=''){
		if($('input[name="rrn"]').val().search(regexp)==-1){
			alert('올바른 형식이 아닙니다');
			$('input[name="rrn"]').focus();
			return false;
		}
	}	
}

function findPwcheck(){
	if($('input[name="id"]').val()==''){
		alert("아이디를 입력하세요");
		$('input[name="id"]').focus();
		return false;
	}
	if($('input[name="rrn"]').val()==''){
		alert("주민등록번호를 입력하세요");
		$('input[name="rrn"]').focus();
		return false;
	}
	const regexp = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;

	if($('input[name="rrn"]').val()!=''){
		if($('input[name="rrn"]').val().search(regexp)==-1){
			alert('올바른 형식이 아닙니다');
			$('input[name="rrn"]').focus();
			return false;
		}
	}	
}

function logincheck(){
	if($('input[name="id"]').val()==''){
		alert("아이디를 입력하세요");
		$('input[name="id"]').focus();
		return false;
	}
	if($('input[name="pw"]').val()==''){
		alert("비밀번호를 입력하세요");
		$('input[name="pw"]').focus();
		return false;
	}
}

$(function(){
	use="";
	idcheck=false;
	pwcheck=false;
});

function duplicate(){
	if($('input[name="id"]').val()==""){
		alert("아이디를 입력하세요");
		$('input[name="id"]').focus();
		return false;
	}
	$.ajax({
		url:"idcheck.jsp",
		data:({
			id : $('input[name="id"]').val()
		}),
		success:function(data){
			if($.trim(data)=='y'){
				alert('사용가능한 아이디입니다');
				use="y";
				idcheck=true;
			}
			else{
				alert('사용할 수 없는 아이디입니다');
				use="n";
				idcheck=false;
			}
		}
	});
}

function duplicatecheck(){
	idcheck=false;
}



function Pwcheck(){
	const regexp = /^(?=.*?[a-z])(?=.*?[0-9]).{6,16}$/;
	
	if($('input[name="pw"]').val()!=""){
		if($('input[name="pw"]').val().search(regexp)==-1){
			alert('비밀번호 형식이 틀렸습니다');
			$('input[name="pw"]').val('');
		}
	}
}

function pwConfirm(){
	const pw = $('input[name="pw"]').val();
	const pw_confirm = $('input[name="pw_confirm"]').val();
	if(pw_confirm!=pw){
		alert('비밀번호가 다릅니다');
		$('input[name="pw_confirm"]').val('');
		pwcheck=false;
	}
	else{
		pwcheck=true;
	}
}

function registercheck(){
	if($('input[name="id"]').val()==''){
		alert("아이디를 입력하세요");
		$('input[name="id"]').focus();
		return false;
	}
	else if(idcheck==false){
		alert('중복체크 필요');
		return false;
	}
	else if(use=="n"){
		alert('이미 사용중인 아이디입니다.');
		return false;
	}
	if(pwcheck==false){
		alert("비밀번호가 다릅니다");
		return false;
	}
	if($('input[name="name"]').val()==''){
		alert("이름을 입력하세요");
		$('input[name="name"]').focus();
		return false;
	}
	if($('input[name="rrn"]').val()==''){
		alert("주민등록번호를 입력하세요");
		$('input[name="rrn"]').focus();
		return false;
	}
	const regexp = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;

	if($('input[name="rrn"]').val()!=''){
		if($('input[name="rrn"]').val().search(regexp)==-1){
			alert('주민등록번호를 확인하세요');
			$('input[name="rrn"]').focus();
			return false;
		}
	}
	if($('input[name="email"]').val()==''){
		alert("이메일을 입력하세요");
		$('input[name="email"]').focus();
		return false;
	}	
	if($('input[name="hp"]').val()==''){
		alert("전화번호를 입력하세요");
		$('input[name="hp"]').focus();
		return false;
	}	
	if($('input[name="address"]').val()==''){
		alert("주소를 입력하세요");
		$('input[name="address"]').focus();
		return false;
	}	
	if($('input[name="confirm"]').is(":checked")==false){
		alert("이용약관 동의는 필수입니다.");
		return false;
	}	
}

function cartAdd(pnum){
		var memid = prodview_form.mid.value;
		console.log(memid);
		if(memid=='admin'){
			alert("관리자는 주문할 수 없습니다");
			return;
		}
		else if(memid!=""){
			oqty = prodview_form.oqty.value;
			pqty = prodview_form.pqty.value;
			if(oqty=="" || oqty<1){
				alert("수량을 다시 입력해주세요");
				location.href="shop_prodview.jsp?pnum="+pnum;
				return;
			}
			if(oqty>pqty){
				alert("재고가 없습니다");
				location.href="shop_prodview.jsp?pnum="+pnum;
				return;
			}
			location.href="shop_cartAdd.jsp?pnum="+pnum+"&oqty="+oqty;
		}
		else{
			alert("로그인 후 이용 가능합니다");
			return;
		}
	}
	
	function minusOqty(){
		if(prodview_form.oqty.value==1){
			alert("수량을 확인해주세요");
		}
		else{
			prodview_form.oqty.value--;
		}
	}
	function plusOqty(){
		prodview_form.oqty.value++;
	}
	
	function mOqty(pnum,oqty){
		if(edit_input.oqty.value==1){
			alert("수량을 확인해주세요");
		}
		else{
			oqty--;
			location.href="shop_cartEdit.jsp?pnum="+pnum+"&oqty="+oqty;
		}
	}
	function pOqty(pnum,oqty){
		oqty++;
		location.href="shop_cartEdit.jsp?pnum="+pnum+"&oqty="+oqty;
	}
	
	function catecheck(){
		if($('input[name="code"]').val()==''){
			alert("카테고리 코드를 입력하세요");
			return false;
		}
		if($('input[name="cname"]').val()==''){
			alert("카테고리 이름을 입력하세요");
			return false;
		}
	}
	
	function prodcheck(){
		if(prod_form.pname.value==""){
			alert("상품명을 입력하세요");
			return false;
		}
		if(prod_form.pcompany.value==""){
			alert("제조사를 입력하세요");
			return false;
		}
		if(prod_form.pimage.value==''){
			alert("상품이미지를 선택해주세요");
			return false;
		}
		if(prod_form.pqty.value==''){
			alert("수량을 입력하세요");
			return false;
		}
		if(prod_form.price.value==''){
			alert("가격을 입력하세요");
			return false;
		}
		if(prod_form.pcontents_image.value==''){
			alert("컨텐츠 이미지를 선택해주세요");
			return false;
		}
		if(prod_form.point.value==''){
			alert("포인트를 입력하세요");
			return false;
		}
	}
	
	function writeIdcheck(){
		if($('input[name="memid"]').val()==''){
			alert('로그인 후 작성 가능합니다');
			return false;
		}
		else{
			location.href='board_write.jsp';
		}
	}
	function boardcheck(){
		if($('input[name="email"]').val()==''){
			alert("이메일을 입력하세요");
			$('input[name="email"]').focus();
			return false;
		}	
		if($('input[name="subject"]').val()==''){
			alert("제목을 입력하세요");
			$('input[name="subject"]').focus();
			return false;
		}	
		if($('input[name="content"]').val()==''){
			alert("내용을 입력하세요");
			$('input[name="content"]').focus();
			return false;
		}	
	}


