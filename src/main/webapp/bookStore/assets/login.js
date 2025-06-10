
// 페이지 로드 시 포커스
window.onload = function() {
	const pageId = document.body.id;
	if (pageId === "update") {
		document.getElementById("password").focus();
	} else {
		document.getElementById("id").focus();
	}	
}

// 엔터 입력시 자동 포커스
function enter(event) {
    console.log("enter 호출됨");

    let key = event.key;
    let allUserInput = document.querySelectorAll('.input');

    if (key === 'Enter') {
        event.preventDefault();
        let currentIndex = Array.from(allUserInput).indexOf(event.target);

        if (currentIndex >= 0 && currentIndex < allUserInput.length - 1) {
            allUserInput[currentIndex + 1].focus();
        } else if (currentIndex === allUserInput.length - 1) {
            document.getElementById("btn01").focus();
        }
    }
}

// 로그인 유효성 검사 
function validateLogIn(){
    let id = document.getElementById("id").value.trim();
    let pwd = document.getElementById("password").value.trim();
    
    let errMsg;
    if (id == "") {
        errMsg = "⚠️ 아이디를 입력해 주세요.";
        alert(errMsg);
        document.getElementById("id").focus();
        return false;
    } 
    else if (pwd == "") {
        errMsg = "⚠️ 비밀번호를 입력해 주세요.";
        alert(errMsg);
        document.getElementById("password").focus();
        return false;
    }
    return true;
}

// 비밀번호 찾기 유효성 검사
function validateFind(){
    let id = document.getElementById("id").value.trim();
    let email = document.getElementById("email").value.trim();
    
    let errMsg;
    if (id == "") {
        errMsg = "⚠️ 아이디를 입력해 주세요.";
        alert(errMsg);
        document.getElementById("id").focus();
        return false;
    } 
    else if (email == "") {
        errMsg = "⚠️ 이메일을 입력해 주세요.";
        alert(errMsg);
        document.getElementById("email").focus();
        return false;
    }
    return true;
}

// 회원가입 유효성 검사
function validateSignUp(){
    let pwd = document.getElementById("password").value.trim();
    let name = document.getElementById("name").value.trim();
    let eamil = document.getElementById("email").value.trim();
    let phone = document.getElementById("phone").value.trim();
    let add1 = document.getElementById("add1").value.trim();
    let add2 = document.getElementById("add2").value.trim();
    
    let errMsg;

    if (pwd == "") {
        errMsg = "⚠️ 비밀번호를 입력해 주세요.";
        alert(errMsg);
        document.getElementById("password").focus();
        return false;
    } else if (name == "") {
        errMsg = "⚠️ 이름을 입력해 주세요.";
        alert(errMsg);
        document.getElementById("name").focus();
        return false;
    } else if (eamil == "") {
        errMsg = "⚠️ 이메일을 입력해 주세요.";
        alert(errMsg);
        document.getElementById("email").focus();
        return false;
    } else if (phone == "") {
        errMsg = "⚠️ 전화번호를 입력해 주세요.";
        alert(errMsg);
        document.getElementById("phone").focus();
        return false;
    } else if (add1 == "") {
        errMsg = "⚠️ 주소를 입력해 주세요.";
        alert(errMsg);
        document.getElementById("add1").focus();
        return false;
    } else if (add2 == "") {
        errMsg = "⚠️ 상세주소를 입력해 주세요.";
        alert(errMsg);
        document.getElementById("add2").focus();
        return false;
    }  
    return true;
}