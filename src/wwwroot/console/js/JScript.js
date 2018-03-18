// JScript 文件

function isdel()
{
  var ok=confirm("确定删除吗?删除后数据不能恢复!请小心删除!")
  if(!ok)
  return false
  else 
  return true;
 }

//全选
function CheckAll(form)  
{
  for (var i=0;i<form.elements.length;i++)    
  {
    var e = form.elements[i];
    if (e.name != 'chkall')       
    e.checked = form.chkall.checked; 
  }
}
  
//得到所选中的值
function initchk()
{
    
    var chb_list=document.getElementsByName("chk");
    var id_list="";
    
    for(var i=0;i<chb_list.length;i++)
    {
        if(chb_list[i].checked)
            id_list=id_list+chb_list[i].value+",";
    }
    
   return id_list;
}


//审核前的判断
function check()
{
    var tagid = initchk();
    {
        if(tagid.length=="")
         {
             alert("请至少选择一项！");
              return false;
         }
         else
         {
             return true;
         }
    }
}

//登录
function Check_Login()
{
   if(document.getElementById("Txt_Username").value=="")
    {
       alert("请输入帐号");
       return false;
　   }
　   else if(document.getElementById("Txt_pwd").value=="")  
　   {  
       alert("请输入密码");
       return false;
      }
  
     
}
//屏蔽菜单栏目
function displaymenu()
{
    document.getElementById("frmTitle").style.display="none";
    
}
