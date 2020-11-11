var fnCheckPassword = function (sPassword, isSignup) {
    var oResult = {
        "isOk": true,
        "sMessage": isSignup ? '사용 가능한 비밀번호 입니다.' : ""
    };

    sPassword = $.trim(sPassword);
    var nLength = sPassword.length;

    if (nLength === 0) {
        oResult['isOk'] = false;
        oResult['sMessage'] =  isSignup ? '필수 입력 정보입니다' : "비밀번호를 입력해주세요.";
        return oResult;
    }

    for (var nCharIndex = 0, nEqualCount = 1, seqEqualCount = 1, ascii_pw = 0, ascii_pw_now = 0, cTargetChar = null; nCharIndex < nLength; nCharIndex++) {
        if (nCharIndex === 0) {
            cTargetChar = sPassword[nCharIndex];
        } else {
            ascii_pw_now = sPassword[nCharIndex].charCodeAt(0); // index에 해당하는 유니코드 값을 반환한다.
            ascii_pw = sPassword[nCharIndex-1].charCodeAt(0);
            if (sPassword[nCharIndex] === cTargetChar) {
                nEqualCount++;
            }else if(ascii_pw_now === ascii_pw +1){
                seqEqualCount++;
            } else {
                cTargetChar = sPassword[nCharIndex];
                nEqualCount = 1;
                seqEqualCount = 1;
            }
        }

        if (nEqualCount >= 4 || seqEqualCount >= 4) {
            oResult['isOk'] = false;
            oResult['sMessage'] = "비밀번호는 연속되거나 동일한 숫자, 문자(4개 이상)의 입력을 제한합니다.";
            return oResult;
        }
    }

    if (/[0-9]{6}/.test(sPassword)) {
        oResult['isOk'] = false;
        oResult['sMessage'] = "연속된 숫자 6개 이상은 입력이 제한됩니다.";
        return oResult;
    }

    var nValidCount =
        /*bHasNumber*/ /[0-9]/.test(sPassword) +
        /*bHasSpecialChar*/ /[^0-9a-zA-Z]/.test(sPassword) +
        /*bHasUpperCase*/ /[A-Z]/.test(sPassword) +
        /*bHasLowerCase*/ /[a-z]/.test(sPassword);

    if (nValidCount < 3 || nLength < 8 || nLength > 20) {
        oResult['isOk'] = false;
        oResult['sMessage'] = "비밀번호는 8~20자의 영문 대/소문자, 숫자, 특수문자 등 3종류 이상으로 조합해주세요.";
        return oResult;
    }

    return oResult;
}

var NumberPasswordError = function(code, message) {
    this.constructor.prototype.__proto__ = Error.prototype

    if (Error.hasOwnProperty('captureStackTrace')) {
        Error.captureStackTrace(this, this.constructor)
    } else {
        this.stack = (new Error()).stack;
    }
    this.name = this.constructor.name
    this.code = code;
    this.message = message
}

var validNumberPassword = function(value, birthArrayParam, hpArrayParam) {
    var birthArray = birthArrayParam || [];
    var hpArray = hpArrayParam || [];

    var prevalue = -9;
    var conCount = 0;
    var sameCount = 0;
    $.each(value, function(){
        var curvalue = parseInt(this);
        curvalue === prevalue ? sameCount++ : sameCount = 0;
        curvalue === prevalue + 1 ? conCount++ : conCount = 0;
        prevalue = curvalue;

        if( sameCount >= 3) {
            throw new NumberPasswordError('same', '연속된 동일 숫자는 4자 이상 사용 할 수 없습니다.');
        }
        if( conCount >= 3) {
            throw new NumberPasswordError('con', '연속된 숫자는 4자 이상 사용 할 수 없습니다.');
        }
    });

    $.each(birthArray, function() {
        if(value.indexOf(this) !== -1) {
            throw new NumberPasswordError('birth', '본인 개인정보를 활용한 비밀번호는 사용할 수 없습니다.');
        }
    });

    $.each(hpArray, function() {
        if(value.indexOf(this) !== -1) {
            throw new NumberPasswordError('hp', '본인 개인정보를 활용한 비밀번호는 사용할 수 없습니다.');
        }
    });
    return true;
}