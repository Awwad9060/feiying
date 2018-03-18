
//注册信息检测

var username_long = '您输入的用户名超过18个字符。';
var username_short = '您输入的用户名小于6个字符。';
var username_pass = "可以使用。";

//对用户名进行检测
function checkusername(o)
{
       //var reg = "^\\w+$"; //判断是否是中文
       var reg=/^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){1,19}$/; 
    
        var perusername = document.getElementById("shortname").value;
        
        if(perusername=="")
        {
             document.getElementById("peruser").innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'>请填写用户名</font>";
             return false;
        }
      else
      {
   
        if(perusername.length < 6) 
        {
		    document.getElementById("peruser").innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'>  " + username_short + "</font>";
		    return false;
	    }
	    else if(perusername.length >5 && perusername.length<19)
	    {
	       if (foundSpecialChars(perusername))
	       {
	        document.getElementById("peruser").innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'> 用户名不能包含特殊符号！</font>";
		    document.getElementById("shortname").focus();
		    return false;
	       }
	       if(!reg.exec(perusername))
           {
            document.getElementById("peruser").innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'> 用户名只能以英文字母开头！</font>";
            return false;
           }
           if(o=="per")
           {
               var res = regAgree.CheckUserName(perusername);
           }
           if(o=="ent")
           {
               var res = regAgree.CheckUserName(perusername);  
           }
           
           if(res.value=="ok")
             document.getElementById("peruser").innerHTML = "<img src='images/note_ok.gif' /><font color='#009900'>" + username_pass + "</font>";
           if(res.value=="false")
            {    
                 document.getElementById("peruser").innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'> 该用户名已经被注册</font>";
                 return false;
	        }
	    }
	    else if(perusername.length > 18)
	    {
	        document.getElementById("peruser").innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'>  " + username_long + "</font>";
		    return false;
	    }
	  }
	  return true;
    }

//密码检测
function checkpwd()
{
      var pwd = document.getElementById("pwd1");
     
      if(pwd.value=="")
      {
          document.getElementById("errpwd").innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'>密码不能为空且大于6个字符！</font>";
          return false;
      }
      else
      {
          if(pwd.value.length<6)
          {
              document.getElementById("errpwd").innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'> 密码必须大于6个字符！</font>";
		      return false;
          }
          else
           document.getElementById("errpwd").innerHTML = "<img src='images/note_ok.gif' />";
      }
       return true;
 }
 
 //密码的确认检测
 function confirmpwd()
 {
     var chkpassword = document.getElementById("pwd2").value;
     var pwd = document.getElementById("pwd1").value;
     if(chkpassword!="")
     {
         if(chkpassword!=pwd)
         {
            document.getElementById("errchkpwd").innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'> 两次密码不一致！</font>";
		    return false;
         }
         else
         document.getElementById("errchkpwd").innerHTML = "<img src='images/note_ok.gif' />";
     }
     else
     {
          document.getElementById("errchkpwd").innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'> 请再输入一次上面的密码！</font>";
	      return false;
     }
     
      return true;
 }
 
 //邮箱的检测
 function checkemail()
 {
    
    var email = document.getElementById("emailusername").value;
    if(email=="")
    {    
        document.getElementById("erremail").innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'> 邮箱不能为空！</font>";
        return false;
    }
    else
    {
        if(email.search(/^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/gi) < 0)
        {
           document.getElementById("erremail").innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'> 邮箱格式错误！</font>";
           return false;
        }
        else
        document.getElementById("erremail").innerHTML = "<img src='images/note_ok.gif' />"; 
    }
    return true;
 }
 
 
 //邮箱的检测
 function checkTruename()
 {
    var trueName = document.getElementById("trueName").value;
    if(trueName=="")
    {    
        document.getElementById("errTrueName").innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'> 真实姓名不能为空,方便联系！</font>";
        return false;
    }else{
        document.getElementById("errTrueName").innerHTML = "<img src='images/note_ok.gif' />";
    }
     return true;
 }
 
 
  //备用邮箱的检测
 function checkemailbak()
 {
    var emailback = document.getElementById("Email2").value;
    
    var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    
    if(emailback=="")
    {
       document.getElementById("erremailbak").innerHTML = "<img src='images/note_ok.gif' /><font color='#009900'> 该邮箱可以为空！</font>"; 
    }
    else
    {
        if(!reg.test(emailback))
        {
         document.getElementById("erremailbak").innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'> 请填写正确的邮箱格式！</font>";
         return;
       }
       else
       {
            document.getElementById("erremailbak").innerHTML = "<img src='images/note_ok.gif' />"; 
       }
    }
     return true;
 }
 
 
 
 //MSN验证
 function checkmsn()
 {
    var reg= /(\S)+[@]{1}(\S)+[.]{1}(\w)/; 
    var ms = document.getElementById("msn");
    if(ms.value=="")
    {
        document.getElementById("errmsn").innerHTML = "<img src='images/note_ok.gif' /><font color='#009900'> MSN号可以为空！</font>";
    }
    else
    {
        if(!reg.test(ms.value))
	   {
	      document.getElementById("errmsn").innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'> 请填写正确的MSN号！</font>";
          return;
	   }
	   else
	   {
		    document.getElementById("errmsn").innerHTML = "<img src='images/note_ok.gif' />";
	   }
	}
	 return true;
 }
 
 //QQ号的验证
 function checkqq()
 {
    var q = document.getElementById("qq");
    var reg = /^[1-9]\d{4,8}$/;
    
    if(q.value=="")
    {
        document.getElementById("errqq").innerHTML = "<img src='images/note_ok.gif' /><font color='#009900'>QQ号可以为空！</font>";
    }
    else
    {
        if(!reg.test(q.value))
	   {
	      document.getElementById("errqq").innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'>请填写正确的QQ号！</font>";
          return;
	   }
	   else
	   {
		    document.getElementById("errqq").innerHTML = "<img src='images/note_ok.gif' />";
	   }
	}
	 return true;
 }

//检测是否有非法字符
function foundSpecialChars(str)
{
	var chars = "~!@#$%^&*()+=|\/?<>,:;'\"`[]{}";
	for (var i=0; i<chars.length; i++)
	{
		if ( str.indexOf(chars.substring(i, i+1)) != -1 )
		{
			return true;
		}
	}
	return false;
}



//验证电话号码是否填写正确
function chkTel(tel,errmsg)
{
    var modphone = document.getElementById(tel).value
	
    var reg=/(^([0-9]{3}-?[0-9]{8})|([0-9]{4}-?[0-9]{7})$)/ 
    
    if(modphone=="")
    {
       document.getElementById(errmsg).innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'> 联系电话不能为空！</font>";
       return false; 
    }  
    else
   {
    if(!reg.test(modphone))
    {
	    document.getElementById(errmsg).innerHTML = "<img src='images/note_error.gif' /><font color='#FF0000'> 电话格式错误！</font>";
        return false;
    }
	else
	{
	   document.getElementById(errmsg).innerHTML = "<img src='images/note_ok.gif' />";
	}
  }
   return true;
	
}

    


