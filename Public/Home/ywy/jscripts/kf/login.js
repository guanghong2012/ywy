var lang;
lang=(typeof(language) != "undefined"?language:"")
document.write("<sc"+"ript lang"+"uage=\"java"+"script\" src=\"/jscripts/kf/yangcong.js\"></script>");
var islogin=function(subfn,loginfn,p){
		if(loginsuccess!=""){
			subfn.call();
		}else{
			var box=$.dialog({									
					lock:subfn.isLock===false?false:true,
					min:false,
					max:false,
					fixed:true,
					zIndex:10200
			});			
			$.get("/config/loadbox/loginbox.asp?lang="+lang+"&"+new Date().getTime(),function(bodys){
				if(bodys.indexOf("logined")>=0){	
					box.close();			
					subfn.call();				
				}else{
					box.title(lang!='en'?"账户登录":"Account login").content(bodys);
					loginLoad_cm(box,subfn,loginfn,p);
				}
			});
		}	
}
function loginLoad_cm(box,subfn,loginfn,p){
	loadcss_cm();	
	showcapimg_cm();	
	var lxform=$("#logboxform");
	lxform.find("#imgcode").click(function(){
		chgcode_cm(this)
	});	
	lxform.find("input[name='subbtn']").click(function(){		
		dologin_cm(box,subfn,loginfn,p);
	});
	lxform.find("input[name='closebtn']").click(function(){
		box.close();
	});
		
}

function loadcss_cm(){
	var loginboxcss="<li"+"nk href=\"/css/loginbox.css\" rel=\"stylesheet\" type=\"text/css\" />";
	if(!$("link[href*='loginbox.css']").get(0)){
		if(!$("link").get(0)){
			$("script").first().before(loginboxcss);
		}else{
			$("link").first().after(loginboxcss)	;
		}
	}
	
}
function isjson(obj){
	return typeof(obj) == "object" && Object.prototype.toString.call(obj).toLowerCase() == "[object object]" && !obj.length;    
}
function showcapimg_cm(){
	var imgcap =$("#caplogin");
	if (imgcap.get(0)){imgcap.attr("src","/config/getCode/caplogin.asp?t="+Math.random());}
}
function dologin_cm(box,subfn,loginfn,p){
	var u_name=$("#logboxform input[name='u_name']");
	var password=$("#logboxform input[name='password']");
	if(!/^[\w\d_\-\.@]{2,60}$/.test(u_name.val())){
		u_name.focus();
		echoerr_cm(lang!='en'?"用户名格式不正确":"User name format is not correct");
	}else if(!/^.{4,20}$/.test(password.val())){
		password.focus();
		echoerr_cm(lang!='en'?"密码格式不正确":"Incorrect password");
	}else{
		var actioninfo=getpostinfo_cm();
		actionlogin(box,subfn,loginfn,actioninfo,p);
	}
}
function actionlogin(box,subfn,loginfn,actioninfo,p){
	$("#logboxform .bottom").slideUp(0);
	$("#logboxform #loadinfo").slideDown(0);
	if(typeof(p)=="string"){
		p=p.replace(/\?/ig,"")
		p="&"+p;				
	}
	$.post("/config/loadbox/loginbox.asp",actioninfo+"&act=login&t="+Date.parse(new Date())+p,function(data){
			if(data!=""){				
				if(data.indexOf("loginAns.asp")>=0){
					window.location.href=data;
				}else if(data.indexOf("{")>=0){
					var jsonObj=eval("("+ data +")");					
					if(jsonObj.result=="ychash"){
						$.isyangcong(jsonObj.msg,function(){	
							actionlogin(box,subfn,loginfn,actioninfo)								
						});
					}else if(jsonObj.result=="200"){
						echosuccess_cm(box,subfn,loginfn);				
					}else if(jsonObj.result=="500"){
						echoerr_cm(jsonObj.msg);
						if(jsonObj.code=="True"){
							$("#codedd").slideDown(10);
						}
					}else{
						echoerr_cm(lang!='en'?"登录失败!!":"Login failed");
					}					
				}else{
					echoerr_cm(data);
				}
			}else{
					echoerr_cm(lang!='en'?"登录失败!!":"Login failed");
			}				
			$("#logboxform #loadinfo").slideUp(0);
	});
}
function echoerr_cm(msg){
	if(msg!=""){
		$("#logboxform #errinfo .errmsg").html(msg);
		$("#logboxform #errinfo").slideDown(10);
		$("#logboxform .bottom").slideDown(0);
		chgcode_cm($("#imgcode")[0])
	}else{		
		$("#logboxform .bottom").slideUp(0);
		$("#logboxform #errinfo .errmsg").html("");
		$("#logboxform #errinfo").slideUp(10);	
	}
}
function echosuccess_cm(box,subfn,loginfn){
	echoerr_cm("");
	
	$("#logboxform dd[id!='successinfo']").hide(0);
	$("#logboxform #successinfo").show(0);	
	loginsuccess="ok";
	if($.isFunction(loginfn)){
		loginfn(subfn);
	}else if($.isFunction(subfn)){
		subfn.call();
	}
	window.setTimeout(function(){
	box.close();	
	},500);
}
function getpostinfo_cm(){
	var lkts=$("#logboxform input[name='lkts']:hidden").val();
	var loginkey=$("#logboxform input[name='"+ lkts +"']");	
	var obj=$("#logboxform input[name!='']:visible");
	var result="";
	$.each(obj,function(i,n){
		result+=$(n).attr("name")+"="+escape($(n).val())+"&";
	});

	return (result+lkts+"="+loginkey.val());
}
function chgcode_cm(v){
	var now = new Date();
	if(v){ 
	var srcArr=v.src.split("&");
	v.src =srcArr[0]+"&x=" + now.toUTCString();
	}
}
