/**
 * 描述:业务受理平台增强校验【手机、身份证、银行卡、邮箱、中文姓名】
 * @author huangshengwen
 * @create 2021/01/12
 */

/**
 * 验证中文名称
 * @param name
 * @returns {boolean}
 */
function isChinaName(name) {
    var pattern = /^[\u4E00-\u9FA5]{1,6}$/;
    return pattern.test(name) && name.length >= 2;
}

/**
 * 银行卡校验
 * @param bankno 银行卡号
 * @returns {boolean}
 */
function isBankNo(bankno) {
    var lastNum = bankno.substr(bankno.length - 1, 1);//取出最后一位（与luhn进行比较）

    var first15Num = bankno.substr(0, bankno.length - 1);//前15或18位
    var newArr = new Array();
    for (var i = first15Num.length - 1; i > -1; i--) {    //前15或18位倒序存进数组
        newArr.push(first15Num.substr(i, 1));
    }
    var arrJiShu = new Array();  //奇数位*2的积 <9
    var arrJiShu2 = new Array(); //奇数位*2的积 >9

    var arrOuShu = new Array();  //偶数位数组
    for (var j = 0; j < newArr.length; j++) {
        if ((j + 1) % 2 == 1) {//奇数位
            if (parseInt(newArr[j]) * 2 < 9)
                arrJiShu.push(parseInt(newArr[j]) * 2);
            else
                arrJiShu2.push(parseInt(newArr[j]) * 2);
        } else //偶数位
            arrOuShu.push(newArr[j]);
    }

    var jishu_child1 = new Array();//奇数位*2 >9 的分割之后的数组个位数
    var jishu_child2 = new Array();//奇数位*2 >9 的分割之后的数组十位数
    for (var h = 0; h < arrJiShu2.length; h++) {
        jishu_child1.push(parseInt(arrJiShu2[h]) % 10);
        jishu_child2.push(parseInt(arrJiShu2[h]) / 10);
    }

    var sumJiShu = 0; //奇数位*2 < 9 的数组之和
    var sumOuShu = 0; //偶数位数组之和
    var sumJiShuChild1 = 0; //奇数位*2 >9 的分割之后的数组个位数之和
    var sumJiShuChild2 = 0; //奇数位*2 >9 的分割之后的数组十位数之和
    var sumTotal = 0;
    for (var m = 0; m < arrJiShu.length; m++) {
        sumJiShu = sumJiShu + parseInt(arrJiShu[m]);
    }

    for (var n = 0; n < arrOuShu.length; n++) {
        sumOuShu = sumOuShu + parseInt(arrOuShu[n]);
    }

    for (var p = 0; p < jishu_child1.length; p++) {
        sumJiShuChild1 = sumJiShuChild1 + parseInt(jishu_child1[p]);
        sumJiShuChild2 = sumJiShuChild2 + parseInt(jishu_child2[p]);
    }
    //计算总和
    sumTotal = parseInt(sumJiShu) + parseInt(sumOuShu) + parseInt(sumJiShuChild1) + parseInt(sumJiShuChild2);

    //计算luhn值
    var k = parseInt(sumTotal) % 10 == 0 ? 10 : parseInt(sumTotal) % 10;
    var luhn = 10 - k;

    if (lastNum == luhn) {
        $("#banknoInfo").html("luhn验证通过");
        return true;
    } else {
        $("#banknoInfo").html("银行卡号必须符合luhn校验");
        return false;
    }
}

/**
 * 身份证验证
 * @param idCardNo 身份证号
 * @returns {boolean} 是否为身份证
 */
function isIdCardNo(idCardNo) {
    if (idCardNo.length < 15) {
        return true;
    } else {
        var factorArr = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1);
        var parityBit = new Array("1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2");
        var varArray = new Array();
        var lngProduct = 0;
        var intCheckDigit;
        var intStrLen = idCardNo.length;
        var idNumber = idCardNo;
        if ((intStrLen != 15) && (intStrLen != 18)) {
            return false;
        }
        for (i = 0; i < intStrLen; i++) {
            varArray[i] = idNumber.charAt(i);
            if ((varArray[i] < '0' || varArray[i] > '9') && (i != 17)) {
                return false;
            } else if (i < 17) {
                varArray[i] = varArray[i] * factorArr[i];
            }
        }
        if (intStrLen == 18) {
            var date8 = idNumber.substring(6, 14);
            if (_isDate8(date8) == false) {
                return false;
            }
            for (i = 0; i < 17; i++) {
                lngProduct = lngProduct + varArray[i];
            }
            intCheckDigit = parityBit[lngProduct % 11];
            if (varArray[17] != intCheckDigit) {
                return false;
            }
        } else {
            var date6 = idNumber.substring(6, 12);
            if (_isDate6(date6) == false) {
                return false;
            }
        }
        return true;
    }
}

/**
 * 手机号验证
 * @param phoneNo 手机号
 * @returns {boolean}
 */
function isMobilePhone(phoneNo) {
    var mobile = /^1(3\d|4\d|5\d|6\d|7\d|8\d|9\d)\d{8}$/g;
    return (phoneNo.length == 11 && mobile.test(phoneNo));
}

/**
 * 固话验证
 * @param phoneNo 固话
 * @returns {boolean}
 */
function isFixedPhone(phoneNo) {
    var isPhone = /^([0-9]{3,4}-)?[0-9]{7,8}$/;
    return isPhone.test(phoneNo);
}

/**
 * 电话号码验证
 * @param phoneNo 电话号码
 * @returns {boolean}
 */
function isPhone(phoneNo) {
    return isMobilePhone(phoneNo) || isFixedPhone(phoneNo);
}

function _isDate6(sDate) {
    if (!/^[0-9]{6}$/.test(sDate)) {
        return false;
    }
    var year, month, day;
    year = sDate.substring(0, 4);
    month = sDate.substring(4, 6);
    if (year < 1700 || year > 2500) returnfalse
    if (month < 1 || month > 12) return false
    return true
}

function _isDate8(sDate) {
    if (!/^[0-9]{8}$/.test(sDate)) {
        return false;
    }
    var year, month, day;
    year = sDate.substring(0, 4);
    month = sDate.substring(4, 6);
    day = sDate.substring(6, 8);
    var iaMonthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    if (year < 1700 || year > 2500) return false
    if (((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0)) iaMonthDays[1] = 29;
    if (month < 1 || month > 12) return false
    if (day < 1 || day > iaMonthDays[month - 1]) return false
    return true
}


$.validator.addMethod("isChinaName", isChinaName, '请输入正确的姓名');
$.validator.addMethod("isBankNo", isBankNo, '请输入正确的银行卡号');
$.validator.addMethod("isIdCardNo", isIdCardNo, '请输入正确的身份证信息');
$.validator.addMethod("isMobilePhone", isMobilePhone, '请输入正确的手机号码');
$.validator.addMethod("isFixedPhone", isFixedPhone, '请输入正确的固话号码');
$.validator.addMethod("isPhone", isPhone, '请输入正确的电话号码');