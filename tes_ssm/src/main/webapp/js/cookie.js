//获取指定名称的cookie的值
function getCookie(objName){
	//得到分割的cookie的键值对
	var arrStr=document.cookie.split(";");
	for(var i=0;i<arrStr.length;i++){
		var temp=arrStr[i].split("=");
		if(temp[0]==objName){
			return unescape(temp[1]);
		}
	}
	return "";
}
//添加cookie
function addCookie(objName,objValue,objHours){
	var str=objName+"="+escape(objValue);
	if(objHours>0){
		var ms=objHours*3600*1000;
		var date=new Date();//当前时间
		date.setTime(date.getTime()+ms);
		str+="; Expires="+date.toGMTString();		
	}
	document.cookie=str;
}
//删除cookie
function delCookie(objName){
	var exp=new Date();
	exp.setTime(exp.getTime()-1);
	var cval=getCookie(objName);
	if(cval!=null){
		document.cookie=objName+"="+cval+"; Expires="+exp.toGMTString();
	}
}
//设置cookie为30天
function setCookie(objName,objValue){
	var day=30;
	var exp=new Date();
	exp.setTime(exp.getTime()+day*24*3600*1000);
	document.cookie=objName+"="+escape(objValue)+"; Expires="+exp.toGMTString();
}




