var data = {
    user: {
        id: null,
        password: null,
        passwordVerify: null,
        userEmail: null,
        userEmailHost: null,
        email: null,
        isYouth: 'Y',
        usedAgree: 'Y',
        privateAgree: 'Y',
        bdYear: null,
        bdMonth: null,
        bdDate: null,
        gender: null,
        birthAgree: 'Y',
        genderAgree: 'Y',
        emailAgree: 'Y',
        periodAgree: 'Y',
        emailToken: null,
        emailCertCode: null,
        snsConnection: '',
        returnUrl: '',
        completeUrl: '',
        snsTp: '',
        snsId: '',
        name: '',
        memberEmail: '',
        viewMode: '',
        dice: ''
    },
    valid: {
        id: false,
        password: false,
        passwordVerify: false,
        name: false,
        email: false
    },
    alert: {
        id: null,
        password: null,
        passwordVerify: null,
        name: null,
        email: null
    },
    setStatus: function ($el, valid, message, alert) {
        var $parent = $el.parents('dd');
        var $msg = $($parent.find('p.msg')[0]);
        $msg.html(message);
        if (valid) {
            $msg.removeClass('dont');
            $parent.find('div.input').addClass('checked');
        } else {
            $msg.addClass('dont');
            $parent.find('div.input').removeClass('checked');
        }

        /*this['valid'][$el.data('bind')] = valid;
        if(alert != undefined) {
            this['alert'][$el.data('bind')] = alert;
        } else {
            this['alert'][$el.data('bind')] = message;
        }*/

        var allValid = true;
        for(var key in this['valid']) {
            allValid = allValid && this['valid'][key];
        } 
    }
};

// 유효성 검사 상태..
var ValidationStatus = function() {
    this.valid = false;
    this.message = '';
    this.alert = '';
    this.data = {};
};


// 아이디 검사
$("#newId").each(function () {
    var $this = $(this); // 나를 가져와..
    var prevUserId = ''; // focus 되었다가 blur 처리된 이전 id 값
    var checker = function () { // 체크시작
        var userId = $this.val(); // id값 가져오고
        if (userId !== '' && (prevUserId === userId)) return; // 공백이거나 값이 변한게 없다. 그럼 할게없음 return
        var validate = validateId(userId); // userId 유효성 검사 실행 
        data.setStatus($this, validate.valid, validate.message); // $this와 
        return validate.valid;
    };

    $this.on('focus', function () {
        // prevUserId = $(this).val();
    });
    $this.on('keyup', checker);
    
    $this.on('blur', function () {
        var userId = $this.val();
        if(checker && prevUserId !== userId) {
            validateDuplicationId(userId, function(status) {
                prevUserId = $this.val();
                data.setStatus($this, status.valid, status.message);
                data.valid.id = true;
                console.log(data.user.id);
            });
        }
    });
    if($this.val() !== '') {
        $this.trigger('change').trigger('blur');
    }
});

//아이디 정규식 검사
var validateId = function (userId) {
    userId = $.trim(userId);
    if (userId === $("#userName").attr('placeholder')) return {valid: false, message: '아이디를 입력해주세요.'};
    else if (userId === '' || userId.length < 4) return {valid: false, message: '아이디는 4자 이상이어야 합니다.'};
    else if (/^[a-zA-Z0-9_\-]+$/.test(userId) === false) return {valid: false, message: '아이디는 영문자, 숫자, -, _ 문자만 사용 가능합니다.'};
    else return {valid: false, message: "중복확인이 필요합니다."};
};

// 아이디 중복 체크
function validateDuplicationId(userId, callback) {
    var url = 'idCheck';
    $.ajax({
        "type":"POST",
        "url":url,
        "data":{'id' : userId },
        "dataType":"json"
    }).done(function(resp){
        var str = '';
        var status = new ValidationStatus();
        status.valid = resp.success;
        if (status.valid) {
            status.message = resp.message;
            status.data = resp.data;
            data.user.id = userId;
        } else {
            status.message = resp.message;
            status.data = resp.data;
        } 
        if(typeof callback === 'function') {
            callback(status);
        } 
    });
}
/* 아이디 체크 끝 --------------------------------------------------------------------------------------- */


/* 비밀번호 체크 시작 ------------------------------------------------------------------------------------ */
$('#newPw').each(function () {
    var $this = $(this);
    var $confirm = $('#newPwConfirm');
    $this.on('keyup keypress blur change', function() {
        var validate = fnCheckPassword($this.val());
        if(validate['isOk']) {
            validate['sMessage'] = '사용 가능한 비밀번호 입니다.';
        }
        data.setStatus($this, validate['isOk'], validate['sMessage']);
        data.valid.password = true;
        $confirm.trigger('keyup')
    });

    $confirm.each(function () {
        $confirm.on('keyup keypress blur change', function () {
            var validate ={
            		valid: null,
            		message: ''
            };
            if ($this.val() !== '' && $confirm.val() === '') {
                validate = {valid: false, message: '필수 입력 정보입니다'};
            } else {
                if ($this.val() !== '' && $this.val() === $confirm.val()) {
                    validate = {valid: true, message: ''};
                    data.valid.passwordVerify = true;
                } else if($confirm.val() !== ''){
                    validate = {valid: false, message: '비밀번호가 일치하지 않습니다.'};
                }
            }
            if(validate) {
                data.setStatus($confirm, validate.valid, validate.message);
            }
            if(validate.valid){
            	data.user.password = $confirm.val();
                console.log(data.user.password);
            }
        });
    });
});
/* 비밀번호 체크 끝 ------------------------------------------------------------------------------------ */

//이름 체크
$('#newName').each(function() {
    var $this = $(this);
    $this.on('keyup change blur', function(e) {
        var validation = validateName($this.val());
        data.setStatus($this, false, validation.message);
        if(validation.valid && e.type === 'blur') {
        	data.user.name = $this.val();
            data.setStatus($this, validation.valid, validation.message);
            data.valid.name = true;
        }
    });
    if($this.val() !== '') {
        $this.trigger('change').trigger('blur');
    }
});

function validateName(userName) {
    userName = $.trim(userName);
    if (userName === '' || (userName === $("#userName").attr('placeholder'))) return {valid: false, message:'이름을 입력 해주세요.'};

    var korReg = /^[가-힝]{1,15}$/ ;
    var engReg = /^[a-zA-Z]{1,30}$/ ;
    if(getByteLength(userName) > 30) {
        return {valid: false, message:'이름은 최대 30byte(한글 15자/영문 30자)까지 입력이 가능합니다.'};
    } else if (!korReg.test(userName) && !engReg.test(userName)) {
        return {valid: false, message:'이름은 한글, 영문 대소문자만 사용해주세요.'};
    }
    return {valid: true, message:''};
}

//문자열 바이트
function getByteLength(s,b,i,c){
    for(b=i=0;c==s.charCodeAt(i++);b+=c>>11?2:c>>7?2:1){};
    return b;
}

/*function validforbiddenWord(value, callback) {
    $.ajax({"type":"POST","url":"/user/check_username_forbiddenword","data":{"userName":value},"dataType":"json","async" : false}
    ).done(function (resp) {
        var status = new ValidationStatus();
        status.valid = resp.success === "OK";
        if (resp.success === "OK") {
            status.message = resp.result.message;
        } else {
            status.message = '이름에 [' + resp.error.data.name + ']은(는) 사용할 수 없는 단어입니다.<br/>금칙어로 입력이 제한된 단어를 삭제하신 후 다시 등록해주세요.<br/>안내 : 건전한 인터넷 문화 조성을 위한 회원님의 적극적인 협조를 부탁 드립니다.';
        }
        if(typeof callback === 'function') {
            callback(status);
        }
    });
}*/

/* 이름 체크 끝 ------------------------------------------------------------------------------------ */

// 성별
$('input[name="gender"]').on('change', function() {
    if(data.user.genderAgree === 'Y') {
        data.user.gender = this.value;
        console.log(data.user.gender);
    }
});

/* 성별 체크 끝 ------------------------------------------------------------------------------------ */

// 생년월일 체크시작
$('dd.date').each(function() {
    var $this = $(this);
    var $year = $('select#year');
    var $month = $('select#month');
    var $day = $('select#day');

    // <dummy sg:if="$self->viewType === 'pc'">
    /*$year = $('#year_inp');
    $month = $('#month_inp');
    $day = $('#day_inp');*/
    // </dummy>

    var date = new Date();
    $this.find('select').on('change', function() {
    	console.log("날짜 변화 감지중??");
    	var year = parseInt($year.val());
        var month = parseInt($month.val());
        var day = parseInt($day.val());
        console.log(month+"값 받아짐??");
        if(year > 0 && month > 0 && day > 0) {
            date.setFullYear(year);
            date.setMonth(month);
            date.setDate(day);
            console.log("저장함?");
        }
        if(data.user.birthAgree === 'Y' && date.getFullYear() === year && date.getMonth() === month && date.getDate() === day) {
            data.user.bdYear = $year.val();
            data.user.bdMonth = $month.val();
            data.user.bdDate = $day.val();
            console.log(data.user.bdYear);
            console.log(data.user.bdMonth);
            console.log(data.user.bdDate);
        } else {
            data.user.bdYear = '';
            data.user.bdMonth = '';
            data.user.bdDate = '';
        }
    });
});

/* 생년월일 체크 끝 ------------------------------------------------------------------------------------ */


/* 이메일 체크 시작 -------------------------------------------------------------------------------------*/
$('#email').each(function() {
    var $this = $(this);
    var prevEmail = null;

        $this.on('keyup change blur', function(e) {
	        if(prevEmail === $this.val()) return;
	        var validation = validateEmail($this.val());
	        data.setStatus($this, false, validation.message);
	        if(validation.valid) {
	            if(e.type === 'blur') {
	                prevEmail = $this.val();
	                $this.val($.trim($this.val()));
	                validDuplicateEmail($this.val(), function(validation) {
	                    data.setStatus($this, validation.valid, validation.message, validation.alert);
	                    //data.user.emailToken = validation.data;
	                    data.user.emailCertCode = '';
	                    prevEmail = $this.val();
	                });
	            }/* else {
	                resetCert();
	                $('button.btn_send_mail').show();
	            }*/
	        } else {
	            resetCert();
	        }
	    });


    $('#certCode').on('keyup change blur', function() {
        var $certCode = $(this);
        if($certCode.val().length === 6) {
            $certCode.parent('div').addClass('checked');
            $('button.btn_mail_auth').removeAttr('disabled');
        } else {
            $certCode.parent('div').removeClass('checked');
            $('button.btn_mail_auth').attr('disabled', 'disabled');
        }
    }).on('paste', function(e) {
        e.preventDefault();
        var text = e.originalEvent.clipboardData.getData('Text');
        text = text.replace(/\s+/g,'').trim();
        $(this).val(text);
    });

    $('button.btn_send_mail').on('click', function() {
        var $email = $('#email');
        var sp = $email.val().split('@');
        var userEmail = sp[0];
        var userEmailHost = sp[1];
        $.ajax({
            "type":"POST",
            "url":"validateEmail",
            "data":{"userEmail":userEmail, "userEmailHost":userEmailHost, "email": $email.val()},
            "dataType":"json"
        }).done(function(resp) {
            if (resp.sendMail) {
                $('div.auth_mail_box').show();
                $("button.btn_send_mail").hide();
                var $dd = $('#certCode').removeAttr('disabled').focus().parents('dd');
                $($dd.find('p.msg')[1]).html(userEmail+"@"+userEmailHost+"로 인증메일이 발송되었습니다.\n인증번호를 입력해 주세요.");
                data.user.dice = resp.dice;
                console.log(data.user.dice);
            } else {
                data.setStatus($this, false, resp.message);
            }
        });
    });
    
    // 이메일 인증 완료
    $(".btn_mail_auth").on('click', function() {
        var $certButton = $(this);
        var certCode = parseInt($('#certCode').val());
        console.log($('#certCode').val());
        /*var sp = $('#userEmail').val().split('@');
        var userEmail = sp[0];
        var userEmailHost = sp[1];*/
        if(certCode === data.user.dice){
            data.setStatus($this, true, '이메일 소유확인이 완료되었습니다. 가입절차를 진행해주세요.');
            data.valid.email = true;
            data.user.email = $this.val();
            resetCert();
        } else {
            var $dd = $certButton.parents('dd');
            $('#certCode').val('').trigger('change');
            $($dd.find('p.msg')[1]).html('인증번호가 일치하지 않습니다. 확인 후 다시 입력해주세요.');
        }
        
        /*$.ajax({
            "type":"POST",
            "url":"/user/validate_email",
            "data":{"email_local":userEmail, "email_domain":userEmailHost, "certCode":certCode, "email":$('#userEmail').val()},
            "dataType":"json"
        }).done(function(resp){
            if (resp.success === "OK") {
                data.user.emailToken = resp.result.data.token;
                data.user.emailCertCode = certCode;
                data.setStatus($this, true, '이메일 소유확인이 완료되었습니다. 가입절차를 진행해주세요.');
                resetCert();
            } else {
                var $dd = $certButton.parents('dd');
                $('#certCode').val('').trigger('change');
                $($dd.find('p.msg')[1]).html('인증번호가 일치하지 않습니다. 확인 후 다시 입력해주세요.');
            }
        });*/
    });
    
    var resetCert = function() {
        $('button.btn_send_mail').hide();
        $('div.auth_mail_box').hide();
        $("button.btn_mail_auth").attr('disabled', 'disabled');
        var $dd = $('#certCode').val('').parents('dd');
        $($dd.find('p.msg')[1]).html('');
    };

    if($this.val() !== '') {
        $this.trigger('change').trigger('blur');
    }
});

//이메일 체크
function validateEmail(email) {
    var validation = new ValidationStatus();
    var reg = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/;
    var validation = new ValidationStatus();
    validation.valid = false;
    if (email === '') {
        validation.message = '이메일 입력 해주세요.';
    } else if(!reg.test(email)) {
        validation.message = '올바른 이메일 형식을 입력해주세요.';
    } else {
        validation.valid = true;
    }
    return validation;
}

// 이메일 중복 체크
function validDuplicateEmail(value, callback) {
    var sp = value.split('@');
    var userEmail = sp[0];
    var userEmailHost = sp[1];
    var url = "emailCheck"
    $.ajax({
        "type":"POST",
        "url":url,
        "data":{"userEmail":userEmail, "userEmailHost":userEmailHost},
        "dataType":"json"
    }).done(function(resp) {
        var status = new ValidationStatus();
        console.log(resp);
        if(resp.chk) {
            //status.data = resp.result.data.token;
            $('button.btn_send_mail').show();
        } else {
            var dupId = resp.dupId;
            var message  = dupId+" 아이디로 이미 가입된 이메일입니다. 다른 이메일을 기입해주세요.";
            status.message = message
        }
        status.message = '이메일 인증 진행 후 가입을 완료해주세요';
        if(typeof callback === 'function') {
        callback(status);
        }
    });
}

/* 이메일 체크 끝 --------------------------------------------------------------------------------*/


/* 회원 가입 */
var delayRun = function () {regist(data)};
$('button.regist_button').on('click', function() {
    setTimeout(delayRun, 1000);
});

function regist(data) {
	console.log("회원가입 이벤트");
    //if(window.pending) return;

    for(var key in data.valid) {
        if(!data.valid[key]) {
            invalidMessage(key, data.alert[key]);
            return;
        }
    }

    /*var $year = $('#year');
    var $month = $('#month');
    var $day = $('#day');
    if($('#year_inp').length > 0) {
        $year = $('#year_inp');
        $month = $('#month_inp');
        $day = $('#day_inp');
    }

    data.user.bdYear = parseInt($year.val());
    data.user.bdMonth = parseInt($month.val());
    data.user.bdDate = parseInt($day.val());
     */
    window.pending = true;
    console.log("여기까지 오나?");
    $.ajax({
        "type":"POST",
        "url":"regist",
        "data":data.user,
        "dataType":"json"
    }).done(function(resp) {
        if(!resp.regist) {
            window.pending = false;
            alert(resp.message);
            return;
        }
        /*if(resp.result.data.snsErrorMessage) {
            alert(resp.result.data.snsErrorMessage);
        }*/
        /*document.location.href = '/user/signup/complete?&returnUrl='
            + encodeURI('') + '&completeUrl=' + encodeURI('');*/
        document.complete.submit();return;
    });
}

var invalidMessage = function(key, message) {
    var $el = null;
    switch (key) {
        case 'email':
            $el = $('#email');
            break;
        case 'id':
            $el = $('#newId');
            break;
        case 'name':
            $el = $('#newName');
            break;
        case 'password':
            $el = $('#newPw');
            break;
        case 'passwordVerify':
            $el = $('#newPwConfirm');
            break;
    }
    if($el) {
        var $parent = $el.parents('dd');

        if(message === null) {
            message = $($parent.find('p.msg')[0]).text();
        }
        
        if(message && message !== '') {
            alert(message);
            $el.focus().select();
        }
    }
}


/* 회원가입 끝! ------------------------------------------------------------------------------------------------------- */

// 로그인

$('button.login_button').on('click', function() {
	
    var loginId = $('#loginId').val();
    var loginPw = $('#loginPw').val();
    var $dd = $(this).parent('dd');
    console.log("로그인 이벤트"+loginId+"/"+loginPw);
    
    $.ajax({
        "type":"POST",
        "url":"login",
        "data":{"loginId":loginId,"loginPw":loginPw},
        "dataType":"json"
    }).done(function(resp) {
    	console.log(resp);
        if(resp.login) {
            document.complete.submit();
        } else{
        	$($dd.find('p.msg')[0]).html(resp.message);
        }
        
    });
	
});

/* 로그인 끝! ------------------------------------------------------------------------------------------------------- */

/*  회원가입 날짜 그려주기, 글자 수 체크 */
var today = new Date();
var toyear = parseInt(today.getFullYear ());
var start = toyear;
var end = toyear - 60;

$('#year').append("<option selected>년도</option>");
for (i=start;i>=end;i--) $('#year').append("<option value="+i+">"+i+"</option>");

$('#month').append("<option selected>월</option>");
for (i=1;i<=12;i++) $('#month').append("<option value="+i+">"+i+"</option>");

$('#day').append("<option selected>일</option>");
for (i=1;i<=31;i++) $('#day').append("<option value="+i+">"+i+"</option>");

function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      //object.maxLength : 매게변수 오브젝트의 maxlength 속성 값입니다.
      object.value = object.value.slice(0, object.maxLength);
    }    
}