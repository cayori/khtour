function checklogin(form) {
	if (document.form.id.value == "") {
		alert("아이디를 입력하십시오.");
		document.form.id.focus();
		return false;
	}

	if (document.form.password.value == "") {
		alert("비밀번호를 입력하십시오.");
		document.form.password.focus();
		return false;
	}

	if (document.form.saveid.checked) {
		saveLogin(document.form.id.value);
	} else {
		saveLogin("");
	}

	return true;

}

function confirmSave(checkbox)

{

	var isRemember;

	// 로그인 정보 저장한다고 선택할 경우
	if (checkbox.checked) {

		isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? nnPC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");

		if (!isRemember)

			checkbox.checked = false;
	}
}

// 쿠키값 가져오기

function getnull(key) {
	var cook = document.cookie + ";";
	var idx = cook.indexOf(key, 0);
	var val = "";

	if (idx != -1) {
		cook = cook.substring(idx, cook.length);
		begin = cook.indexOf("=", 0) + 1;
		end = cook.indexOf(";", begin);
		val = unescape(cook.substring(begin, end));
	}

	return val;
}

// 쿠키값 설정

function setnull(name, value, expiredays) {
	var today = new Date();
	today.setDate(today.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires="
			+ today.toGMTString() + ";"

}

// 쿠키에서 로그인 정보 가져오기

function getLogin() {

	var frm = document.form;

	// userid 쿠키에서 id 값을 가져온다.
	var id = getnull("userid");
	// 가져온 쿠키값이 있으면
	if (id != "") {
		frm.id.value = id;
		frm.saveid.checked = true;
	}
}

// 쿠키에 로그인 정보 저장
function saveLogin(id) {

	if (id != "") {
		// userid 쿠키에 id 값을 7일간 저장
		setnull("userid", id, 7);
	} else {
		// userid 쿠키 삭제
		setnull("userid", id, -1);
	}
}