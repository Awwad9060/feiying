<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ids_add.aspx.cs" Inherits="console_IDS_ids_add" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
     <link rel="stylesheet" href="../css/control.css" type="text/css" />
     <script  type="text/javascript" src="../js/ticketadd.js"></script>
     <script type="text/javascript" language="javascript">
    
    function checkInfo()
    { 
      if(document.getElementById("fromCity").value=="")
       {
          alert("出发城市不能为空！");
          return false;
       }       
      if(document.getElementById("txtSearch_tocity").value=="")
       {
          alert("目的城市不能为空！");
          return false;
       }
       
   
       return true; 
             
    }
   
   　//检测图片后缀名
function CheckFile(sender,arg)
{
    var enableExt =["jpg","gif","bmp","png"]; // add your enable extension on that
    if (arg.Value=="")
    {
        arg.IsValid =true;
    }
    else
    {
        var temp = arg.Value.split(".");
        var extension = temp[temp.length-1];
        extension = extension.toLowerCase();
        var isValid = false;
        
        for(i=0;i<enableExt.length;i++)
        {
           if (extension==enableExt[i])
           {
                isValid=true;
           }
        }
        arg.IsValid = isValid;
    }
}  
    </script>
</head>
<body>
    <form id="form1"   runat="server">
  <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" id="TABLE1">
            <tr>
                <td align="right" bgcolor="#799AE1" class="B" style="width: 200px" >
                    </td>
                <td height="25" align="left" bgcolor="#799AE1" class="B" style="width: 839px">
                    <asp:Label ID ="lblTitle" runat ="server"></asp:Label></td>
                <td align="center" bgcolor="#799AE1" class="B" style="width: 253px">
                    </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 150px">航线：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               出发城市：<select id="fromCity" name="fromCity_more" runat="server">
                            </select>
                            &nbsp;&nbsp;&nbsp;
                        目的城市：
                        <input  id="txtSearch_tocity" autocomplete="off" runat="server" type="text" size="18" /> *支持智能搜索
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
 
 
            
              <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 150px">
                    年份：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_idsYear" runat="server" type="text" size="30" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
            
            <tr>
                 <td align="right" bgcolor="#F6F6F6" style="width: 150px">
                   走势图：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 839px; height: 30px">
                <asp:Label ID="isUploadPic" runat="server" Text=""></asp:Label>
	  	               <input id="isReload" type="hidden" runat="server" value="0" />
	  	               <input id="oldPic" type="hidden" runat="server" value="" />
                    </td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 30px;">
                  </td>
            </tr>
            <tr id="picUpload" >
                <td align="right" bgcolor="#F6F6F6" style="width: 150px">
                    图片路径：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                 <asp:FileUpload ID="FileUpload_picPath" runat="server" Width="285px" />
            <label>
          &nbsp;</label><asp:CustomValidator ID="CustomValidator_pic" runat="server" 
                ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_picPath" 
                Display="Dynamic" ErrorMessage="&lt;br/&gt;*只支持 jpg , gif , bmp , png 等图片格式"></asp:CustomValidator>   </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
              <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 150px">
                    最低走势：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                月份 <input  id="txt_lowMonth" runat="server" type="text" size="20" /> 价格 <input  id="txt_lowPrice" runat="server" type="text" size="20" /> 
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 150px">
                    最高走势：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                月份 <input  id="txt_heightMonth" runat="server" type="text" size="20" /> 价格 <input  id="txt_heightPrice" runat="server" type="text" size="20" /> 
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 150px">
                   走势点评：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                 <input  id="txt_comment" runat="server" type="text" size="50" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
             
              <tr>
              <td align="right" bgcolor="#F6F6F6" style="width: 150px">
                   IDS平均价格：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                 <input  id="txt_idsPrice" runat="server" type="text" size="30" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
              <tr>
               <td align="right" bgcolor="#F6F6F6" style="width: 150px">
                   IDS点评：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                 <input  id="txt_idsComment" runat="server" type="text" size="50" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
             </tr> 
             
            
           
            
               <tr>
                 <td align="right" bgcolor="#F6F6F6" style="width: 150px">
                    航线热卖度：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_remai" runat="server" type="text" size="20" />填写1-5的整数或者小数
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
     <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 150px">
                    价格满意度：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_manyi" runat="server" type="text" size="20" />填写1-5的整数或者小数
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px" colspan="3">
                    <asp:Button ID="btnSave" runat="server" Text="保 存"  Height="23" OnClientClick="return checkInfo()"
                      OnClick="btnSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                 <input name="Submit3" type="button" style="height: 23px;"onclick="location.href='ids_list.aspx'" value="返 回" />
                    </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                 </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
   
    var arrList = new Array();//要搜索的数据
    var objouter, objInput, objInputId = "txtSearch_tocity";//控件ID
    var selectedIndex = -1, intTmp;
    //初始化
    function smanPromptList() {
        this.style = "overflow:hidden;width:393px;height:auto;background:#FFFFFF;border:1px solid #000000;font-size:14px;cursor:default;"
        if (arrList.constructor != Array) {
            alert('smanPromptList初始化失败:第一个参数非数组!');
            return;
        }
        document.write("<div id='__smanDisp' style='position:absolute;display:none;" + this.style + "' onblur></div>");
        document.write("<style type=\"text/css\">.sman_selectedStyle{background-Color:#3366CC;color:#FFFFFF}</style>");

        arrList.sort(function(a, b) {
            if (a.length > b.length) return 1;
            else if (a.length == b.length) return a.localeCompare(b);
            else return -1;
        });
        objouter = document.getElementById("__smanDisp") //显示的DIV对象 
        objInput = document.getElementById(objInputId);  //文本框对象
        if (objInput == null) {
            alert('smanPromptList初始化失败:没有找到"' + objInputId + '"文本框');
            return;
        }
        objInput.onblur = function() { objouter.style.display = 'none'; }
        objInput.onkeyup = checkKeyCode;
        objInput.onfocus = checkAndShow;
    }

    function getAbsoluteHeight(ob) {
        return ob.offsetHeight;
    }
    function getAbsoluteWidth(ob) {
        return ob.offsetWidth;
    }
    function getAbsoluteLeft(ob) {
        var s_el = 0, el = ob;
        while (el) {
            s_el = s_el + el.offsetLeft;
            el = el.offsetParent;
        };
        return s_el;
    }
    function getAbsoluteTop(ob) {
        var s_el = 0, el = ob;
        while (el) {
            s_el = s_el + el.offsetTop;
            el = el.offsetParent;
        };
        return s_el;
    }
    function outSelection(Index) {
        objInput.value = objouter.children[Index].innerText.Trim();
        objouter.style.display = 'none';
    }
    function divPosition() {
        objouter.style.top = (getAbsoluteHeight(objInput) + getAbsoluteTop(objInput))+"px";
        objouter.style.left = getAbsoluteLeft(objInput) + "px";
        objouter.style.width = getAbsoluteWidth(objInput) + "px";
    }
    function chageSelection(isUp) {
        if (objouter.style.display == 'none') {
            objouter.style.display = '';
        }
        else {
            if (isUp)
                selectedIndex++;
            else
                selectedIndex--;
        }
        var maxIndex = objouter.children.length - 1;
        if (selectedIndex < 0) { selectedIndex = 0; }
        if (selectedIndex > maxIndex) { selectedIndex = maxIndex; }
        if (selectedIndex == maxIndex) { selectedIndex = -1; }

        for (intTmp = 0; intTmp <= maxIndex; intTmp++) {
            if (intTmp == selectedIndex) {
                objouter.children[intTmp].className = "sman_selectedStyle";
                objInput.value = objouter.children[selectedIndex].innerText.Trim();
            }
            else {
                objouter.children[intTmp].className = "";
            }
        }
    }
    function checkKeyCode() {
        var ie = (document.all) ? true : false
        if (ie) {
            var keyCode = event.keyCode
            if (keyCode == 40 || keyCode == 38) {
                var isUp = false
                if (keyCode == 40)
                    isUp = true;
                chageSelection(isUp)
            }
            else if (keyCode == 13) {
                outSelection(selectedIndex);
            }
            else {
                checkAndShow();
            }
        }
        else {
            checkAndShow();
        }
        divPosition();
    }

    function checkAndShow() {
        var strInput = objInput.value.Trim();
        if (strInput != "") {
            divPosition();
            selectedIndex = -1;
            arrList.length = 0;
            objouter.innerHTML = "";
            //=======================这里修改数据================================
                var result = console_IDS_ids_add.GetCity_to(strInput).value;
            //===================================================================
            var data = eval('(' + result + ')');
            for (var j = 0; j < data.length; j++) {

                arrList[j] = data[j];
            }

            for (intTmp = 0; intTmp < arrList.length; intTmp++) {
                for (i = 0; i < arrList[intTmp].length; i++) {
                    if (arrList[intTmp].substr(i, strInput.length).toUpperCase() == strInput.toUpperCase()) {
                        addOption(arrList[intTmp], strInput);
                    }
                    if (objouter.childNodes.length >= 10) {
                        break;
                    }
                }
            }
            if (objouter.childNodes.length > 0) {
                objouter.innerHTML += "<div style=\"width:395px;height:22px;text-align:right;color:Blue;text-decoration:underline;cursor:pointer;\">关闭</div>";
            }
            objouter.style.display = '';
        }
        else {
            objouter.style.display = 'none';
        }
    }
    //显示搜索的数据并关键字涂色
    function addOption(value, keyw) {
        var v = value.replace(keyw, "<b><font color=\"red\">" + keyw + "</font></b>");
        objouter.innerHTML += "<div style=\"width:395px;height:22px\" onmouseover=\"this.className='sman_selectedStyle'\" onmouseout=\"this.className=''\" onmousedown=\"document.getElementById('" + objInputId + "').value='" + value + "'\">" + v + "</div>"
    }
    String.prototype.Trim = function() {
        return this.replace(/(^\s*)|(\s*$)/g, "");
    }
    
    smanPromptList();
    
    </script>
    
</body>
</html>
