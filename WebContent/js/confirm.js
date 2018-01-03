function write(form){
	if(document.form.name.value == ""){
		alert("제목을 입력하세요");
		document.form.name.focus();
		return false;
	}
	if(document.form.air.value == ""){
		alert("항공사를 입력하세요");
		document.form.air.focus();
		return false;
	}
	if(document.form.country.value == ""){
		alert("국가를 입력하세요");
		document.form.country.focus();
		return false;
	}
	if(document.form.region.value == ""){
		alert("지역을 입력하세요");
		document.form.region.focus();
		return false;
	}
	if(document.form.price.value == ""){
		alert("가격을 입력하세요");
		document.form.price.focus();
		return false;
	}
	if(document.form.content.value == ""){
		alert("설명을 입력하세요");
		document.form.content.focus();
		return false;
	}
	if(document.form.people.value == ""){
		alert("인원을 입력하세요");
		document.form.people.focus();
		return false;
	}
	if(document.form.room.value == ""){
		alert("객실수를 입력하세요");
		document.form.room.focus();
		return false;
	}
	if(document.form.tel.value == ""){
		alert("호텔 전화번호를 입력하세요");
		document.form.tel.focus();
		return false;
	}
}


function checkmodify(form) {
	if (document.form.email.value == "") {
		alert("이메일을 입력하십시요.");
		document.form.email.focus();
		return false;
	}

	if (document.form.email2.value == "") {
		alert("이메일을 입력하십시요.");
		document.form.email2.focus();
		return false;
	}

	if (document.form.tel.value == "") {
		alert("연락처를 입력하십시요.");
		document.form.tel.focus();
		return false;
	}

	if (document.form.newpassword.value != ""
			&& document.form.newpassword.value.length <= 5) {
		alert("비밀번호는 6자리 이상이어야 합니다.");
		document.form.newpassword.focus();
		return false;
	}

	if (document.form.newpassword.value != "") {
		if (document.form.newpassword.value != document.form.newpassword2.value) {
			alert("비밀번호가 일치하지 않습니다.");
			document.form.newpassword.focus();
			return false;
		}
	}
}



function checkinput(form) {

	if (document.form.id.value == "") {
		alert("아이디를 입력하십시오.");
		document.form.id.focus();
		return false;
	}

	if (document.form.id.value.length <= 5) {
		alert("아이디는 6자리 이상이어야 합니다.");
		document.form.id.focus();
		return false;
	}

	if (document.form.confirmidcheck == "no") {
		alert("아이디 중복 확인을 하십시오.")
		return false;
	}

	if (document.form.password.value == "") {
		alert("비밀번호를 입력하십시오.");
		document.form.password.focus();
		return false;
	}

	if (document.form.password.value.length <= 5) {
		alert("비밀번호는 6자리 이상이어야 합니다.");
		document.form.password.focus();
		return false;
	}

	if (document.form.password2.value == "") {
		alert("동일한 비밀번호를 입력하십시오.");
		return false;
	}

	if (document.form.password.value != document.form.password2.value) {
		alert("비밀번호가 동일하지 않습니다.");
		document.form.password.focus();
		return false;
	}

	if (document.form.name.value == "") {
		alert("이름을 입력하십시요.");
		document.form.name.focus();
		return false;
	}

	if (document.form.email.value == "") {
		alert("이메일을 입력하십시요.");
		document.form.email.focus();
		return false;
	}

	if (document.form.email2.value == "") {
		alert("이메일을 입력하십시요.");
		document.form.email2.focus();
		return false;
	}

	if (document.form.tel.value == "") {
		alert("연락처를 입력하십시요.");
		document.form.tel.focus();
		return false;
	}

	if (document.form.confirmidcheck.value == "no"
			|| document.form.confirmidcheck.value == null) {
		alert("아이디 중복 확인을 하십시오.");
		document.form.id.focus();
		return false;
	}

	// 약관 동의 안했을 시 오류창 2개다 동의해야만 경고창이 뜨지않게 구현
	var input = document.form.check;
	var boxcheck = true;

	for (var i = 0; i < input.length; i++) {
		if (input[0].checked == 1) {
			if (input[1].checked == 1) {
				boxcheck = false;
				break;
			} else {
				boxcheck = true;
				break;
			}
		} else {
			boxcheck = true;
			break;
		}
	}

	if (boxcheck) {
		alert("약관에 모두 동의하여야 가입이 가능합니다.");
		return false;
	}
}
