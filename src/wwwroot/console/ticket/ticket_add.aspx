<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ticket_add.aspx.cs" Inherits="cms_ticket_ticket_add"  %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
     <title>添加机票信息</title>
     <script  type="text/javascript" src="../js/ticketadd.js"></script>
     <link rel="stylesheet" href="../css/control.css" type="text/css" />
     <script language="javascript" type="text/javascript" src="../../tools/fckeditor/fckeditor.js"></script>
     <script language="javascript" type="text/javascript" src="../../js/DateControls.js"></script>
     <script type="text/javascript" language="javascript">
    
    function checkInfo()
    { 
      if(document.getElementById("txtSearch_tocity").value=="")
       {
          alert("到达城市不能为空！");
          document.getElementById("txtSearch_tocity").focus();
          return false;
       }
        if(document.getElementById("txtSearch_fromport").value=="")
       {
          alert("出发机场不能为空！");
          document.getElementById("txtSearch_fromport").focus();
          return false;
       } 
       if(document.getElementById("txtSearch_toport").value=="")
       {
          alert("到达机场不能为空！");
          document.getElementById("txtSearch_toport").focus();
          return false;
       }  
       if(document.getElementById("txtSearch").value=="")
       {
          alert("航空公司不能为空！");
          document.getElementById("txtSearch").focus();
          return false;
       }  
       if(document.getElementById("untaxPrice_more").value=="")
       {
          alert("价格不能为空！");
          document.getElementById("untaxPrice").focus();
          return false;
       }  
       
        
       return true;         
    }
   
    </script>
</head>
<body>
    <form id="form1" action="ticket_add.aspx" runat="server" >
    <div >
        <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" id="ticket_table">
            <tr>
                <td align="right" bgcolor="#799AE1" class="B" style="width: 278px" >
                    </td>
                <td height="25" align="left" bgcolor="#799AE1" class="B" style="width: 1101px">
                    <asp:Label ID ="lblTitle" runat ="server"></asp:Label></td>
                <td align="right" bgcolor="#799AE1" class="B" style="width: 253px">
                    </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 278px">
                    机票标题：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
               <input  id="title" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
               
            
           <%-- 添加航线 --%>
             <tr>
                <td  align="right" bgcolor="#F6F6F6" style="width:278px" valign=top>
                    航线：
                    <br />
                    <br /><br /><br /><br /><br />
                    机场： 
                 </td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                    <div id="add_airall">
                        <div id="add_air1">
                        出发城市：<select id="fromCity" name="fromCity_more" runat="server">
                            </select>
                            &nbsp;&nbsp;&nbsp;
                        目的城市：
                        <input  id="txtSearch_tocity" runat="server" type="text" size="18" /> *支持智能搜索，支持代码和中文
                        <br />
                        <br /><br />
                        出发机场：
                        <input  id="txtSearch_fromport" runat="server" type="text" size="40" /> *支持智能搜索，支持代码和中文
                        <br />
                        目的机场：
                        <input  id="txtSearch_toport"  runat="server" type="text" size="40" /> *支持智能搜索，支持代码和中文
                        </div>
                        <div id="add_air2"></div>
                     </div>
               </td>
                <td align="left" bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>   
            
            
          <%--  添加航线--%>
            
                       
            <tr>
             <td  align="right" bgcolor="#F6F6F6" style="width: 278px">
                 </td>
                <td height="25" align="right" bgcolor="#F6F6F6" style="width: 1101px"><div id="txtNumDiv" runat="server">航线乘于<input  id="txtNum" runat="server" type="text" size="3" value="1" />*纯数字(不要超过5)</div>          
               </td>
               
                <td align="left" bgcolor="#F6F6F6" style="width: 253px"></td>
         
            </tr>
            
          
<%--             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 278px">
                    行程：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                    <asp:RadioButton ID="tripType2" GroupName="tripType" runat="server" Text="往返" Checked="true"/> <asp:RadioButton ID="tripType1" GroupName="tripType"   runat="server" Text="单程" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>--%>
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 278px">
                    航空公司：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                   
                     <input  id="txtSearch" runat="server" type="text" size="40" /> *支持智能搜索，支持二字码和中文
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 278px">
                    中转机场：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                    <input  id="txtSearch_relayport" runat="server" type="text" size="58" />
                    </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 278px">
                    免费行李额：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                     <input  id="bagPrice" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 278px">
                    回程并不订期票：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                   <asp:RadioButton ID="returnTip2" GroupName="returnTip" Checked="true"  runat="server" Text="否" /> <asp:RadioButton ID="returnTip1" GroupName="returnTip"  runat="server" Text="是" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 278px">
                    客票类型：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                     <input  id="engerTicket" runat="server" type="text" size="58" value="电子客票"/>
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
            
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 278px">
                    舱位：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                     <input  id="seatShip" runat="server" type="text" size="58" value="经济舱" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 278px">
                    旺季附加费：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
                     <input  id="attPrice" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 278px">
                    儿童折扣价：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
                     <input  id="childPrice" runat="server" type="text" size="58" />*纯数字
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
           </table> 
           
         <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
            <hr style="border:1px dashed; height:1px; width:600px;" align="left" color="#DDDDDD" />
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 310px">
                    不含税价格：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1239px">
                     <input  id="untaxPrice_more" name="untaxPrice_more" runat="server" type="text" size="58" /> *纯数字
               </td>
                <td style="display:none;" bgcolor="#F6F6F6" style="width: 253px">
                <input  id="IsLimited" name="IsLimited" runat="server" value="0" type="text" size="4" /> 1 表示机位有限，0表示无限制
                  </td>
                  <td bgcolor="#F6F6F6" style="width: 253px">&nbsp;</td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 310px; height: 42px;">
                    最短停留天数：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 1239px; height: 42px;">
                     <input  id="shortstayDate_more" name="shortstayDate_more" runat="server" type="text" size="58" value="3"/> *纯数字
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 42px;">
                  </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 310px">
                    最长停留天数：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1239px">
                     <input  id="longstayDate_more" name="longstayDate_more" runat="server" type="text" size="58"  value="30"/> *纯数字
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
         </table>
           <div id="priceMore"></div> 
           
             <table id="addpriceMore" runat="server" width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
            <tr>
             <td  align="right" bgcolor="#F6F6F6" style="width: 310px">
                 </td>
                <td height="25" align="right" bgcolor="#F6F6F6" style="width: 1239px">
                <span style="margin:0 15px 0 30px; text-decoration:underline; cursor:hand;" onclick="return price_more()">添加价格（最好不要超过5条）</span>
                 
               </td>
                <td align="left" bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            </table>
          
             <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
              <hr style="border:1px dashed; height:1px; width:600px;" align="left" color="#DDDDDD" />
                  <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 200px">
                    售票：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
                    开始售票<input  id="fromsaleDate_more" name="fromsaleDate_more" runat="server" readonly="readonly" onfocus="return setday(this)" type="text" style="width: 90px" />
                    结束售票<input  id="tosaleDate_more" name="tosaleDate_more" runat="server" readonly="readonly" onfocus="return setday(this)" type="text" style="width: 90px" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 200px">
                    出发：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
                    开始旅行<input  id="fromtripDate_more" readonly="readonly"  name="fromtripDate_more" onfocus="return setday(this)" runat="server" type="text" style="width: 90px" />
                    最迟出发<input  id="totripDate_more" readonly="readonly"  name="totripDate_more" onfocus="return setday(this)"  runat="server" type="text" style="width: 90px" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            </table>
             <div id="dateMore"></div> 
             
              <table  id="adddateMore" runat="server" width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
            <tr>
             <td  align="right" bgcolor="#F6F6F6" style="width: 310px">
                 </td>
                <td height="25" align="right" bgcolor="#F6F6F6" style="width: 1239px">
                <span style="margin:0 15px 0 30px; text-decoration:underline; cursor:hand;" onclick="return date_more()">添加日期（最好不要超过5条）</span>
                 
               </td>
                <td align="left" bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            </table>
          
             <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
            
          
            
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 200px">
                    退款条款：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  id="returnMoney" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 200px">
                    改期条款：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  id="updateProvision" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 200px">
                    积分：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  id="txt_score" runat="server" type="text" size="20" value="100" /> + <input  id="txt_addScore" runat="server" type="text" size="10" value="100"/> 纯数字
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
             </tr>
             
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 200px">
                    综评：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  id="txt_zongping" runat="server" type="text" size="20" value="3" />纯数字
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
             </tr>
             
              <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 200px">
                    喜爱度：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  id="txt_xiai" runat="server" type="text" size="20" value="2" />纯数字
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
             </tr>
             
              <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 200px">
                    消费度：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  id="txt_xiaofei" runat="server" type="text" size="20" value="4" />纯数字
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
             </tr>
             
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 200px">
                    满意度：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  id="txt_manyi" runat="server" type="text" size="20" value="3" />纯数字
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
             </tr>
             
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 200px">
                    服务：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  id="txt_fuwu" runat="server" type="text" size="20" value="2" />纯数字
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
             </tr>
             
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 200px">
                    是否特价：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
                <asp:RadioButton ID="isPass1" GroupName="isPass" runat="server" Text="是" /><asp:RadioButton ID="isPass2" Checked="true" GroupName="isPass" runat="server" Text="否" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
              <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 200px">
                    是否精选：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
                <asp:RadioButton ID="isRecom1" GroupName="isRecom"   runat="server" Text="是" /><asp:RadioButton ID="isRecom2" Checked="true" GroupName="isRecom" runat="server" Text="否" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width:200px">
                    限制条款：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 480px">
                  <FCKeditorV2:FCKeditor id="FCKeditor" BasePath="../../tools/fckeditor/"  
                  Height="400" 
                  Width="550"  runat="server">
              </FCKeditorV2:FCKeditor>              
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>

            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px" colspan="3">
                   <asp:Button ID="btnSave" runat="server" Text="保 存"  Height="23" OnClientClick="return checkInfo()"
                      OnClick="btnSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                 <input name="Submit3" type="button" style="height: 23px;"onclick="location.href='airline_list.aspx'" value="返 回" />
                    <br /><br /><br />
                    </td>
                    
            </tr>
            <tr>
                <td align="right" colspan="3">
                 </td>
            </tr>
        </table>
        </div>
            </form>
    <script type="text/javascript">
   
    var arrList = new Array();//要搜索的数据
    var objouter, objInput, objInputId = "txtSearch";//控件ID
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
        objouter.style.top = getAbsoluteHeight(objInput) + getAbsoluteTop(objInput)+'px';
        objouter.style.left = getAbsoluteLeft(objInput) + 'px';
        objouter.style.width = getAbsoluteWidth(objInput) + 'px';
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
            var result = cms_ticket_ticket_add.GetArray(strInput).value;
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
    
    
    
    
    var arrList1 = new Array();//要搜索的数据
    var objouter1, objInput1, objInputId1 = "txtSearch_tocity";//控件ID
    var selectedIndex1 = -1, intTmp1;
    //初始化
    function smanPromptList1() {
        this.style = "overflow:hidden;width:393px;height:auto;background:#FFFFFF;border:1px solid #000000;font-size:14px;cursor:default;"
        if (arrList1.constructor != Array) {
            alert('smanPromptList1初始化失败:第一个参数非数组!');
            return;
        }
        document.write("<div id='__smanDisp1' style='position:absolute;display:none;" + this.style + "' onblur></div>");
        document.write("<style type=\"text/css\">.sman_selectedStyle{background-Color:#3366CC;color:#FFFFFF}</style>");

        arrList1.sort(function(a, b) {
            if (a.length > b.length) return 1;
            else if (a.length == b.length) return a.localeCompare(b);
            else return -1;
        });
        objouter1 = document.getElementById("__smanDisp1") //显示的DIV对象 
        objInput1 = document.getElementById(objInputId1);  //文本框对象
        if (objInput1 == null) {
            alert('smanPromptList1初始化失败:没有找到"' + objInputId1 + '"文本框');
            return;
        }
        objInput1.onblur = function() { objouter1.style.display = 'none'; }
        objInput1.onkeyup = checkKeyCode1;
        objInput1.onfocus = checkAndShow1;
    }

    function getAbsoluteHeight1(ob) {
        return ob.offsetHeight;
    }
    function getAbsoluteWidth1(ob) {
        return ob.offsetWidth;
    }
    function getAbsoluteLeft1(ob) {
        var s_el = 0, el = ob;
        while (el) {
            s_el = s_el + el.offsetLeft;
            el = el.offsetParent;
        };
        return s_el;
    }
    function getAbsoluteTop1(ob) {
        var s_el = 0, el = ob;
        while (el) {
            s_el = s_el + el.offsetTop;
            el = el.offsetParent;
        };
        return s_el;
    }
    function outSelection1(Index) {
        objInput1.value = objouter1.children[Index].innerText.Trim();
        objouter1.style.display = 'none';
    }
    function divPosition1() {
        objouter1.style.top = getAbsoluteHeight1(objInput1) + getAbsoluteTop1(objInput1) +'px';
        objouter1.style.left = getAbsoluteLeft1(objInput1) + 'px';
        objouter1.style.width = getAbsoluteWidth1(objInput1) + 'px';
    }
    function chageSelection1(isUp) {
        
        if (objouter1.style.display == 'none') {
            objouter1.style.display = '';
        }
        else {
            if (isUp)
                selectedIndex1++;
            else
                selectedIndex1--;
        }
        var maxIndex = objouter1.children.length - 1;
        if (selectedIndex1 < 0) { selectedIndex1 = 0; }
        if (selectedIndex1 > maxIndex) { selectedIndex1 = maxIndex; }
        if (selectedIndex1 == maxIndex) { selectedIndex1 = -1; }

        for (intTmp1 = 0; intTmp1 <= maxIndex; intTmp1++) {
            if (intTmp1 == selectedIndex1) {
                objouter1.children[intTmp1].className = "sman_selectedStyle";
                objInput1.value = objouter1.children[selectedIndex1].innerText.Trim();
            }
            else {
                objouter1.children[intTmp1].className = "";
            }
        }
    }
    function checkKeyCode1() {
        var ie = (document.all) ? true : false
        if (ie) {
            var keyCode = event.keyCode
            if (keyCode == 40 || keyCode == 38) {
                var isUp = false
                if (keyCode == 40)
                    isUp = true;
                chageSelection1(isUp)
                
            }
            else if (keyCode == 13) {
                outSelection1(selectedIndex1);
            
            }
            else {
            
                checkAndShow1();
            }
        }
        else {
            checkAndShow1();
        }
        divPosition1();
    }

    function checkAndShow1() {

        var strInput = objInput1.value.Trim();
        if (strInput != "") {
            divPosition1();
            selectedIndex1 = -1;
            arrList1.length = 0;
            objouter1.innerHTML = "";
            //=======================这里修改数据================================
            var result = cms_ticket_ticket_add.GetCity_to(strInput).value;
            //===================================================================
            var data = eval('(' + result + ')');
            for (var j = 0; j < data.length; j++) {

                arrList1[j] = data[j];
            }

            for (intTmp1 = 0; intTmp1 < arrList1.length; intTmp1++) {
                for (i = 0; i < arrList1[intTmp1].length; i++) {
                    if (arrList1[intTmp1].substr(i, strInput.length).toUpperCase() == strInput.toUpperCase()) {
                        addOption1(arrList1[intTmp1], strInput);
                    }
                    if (objouter1.childNodes.length >= 10) {
                        break;
                    }
                }
            }
            if (objouter1.childNodes.length > 0) {
                objouter1.innerHTML += "<div style=\"width:395px;height:22px;text-align:right;color:Blue;text-decoration:underline;cursor:pointer;\">关闭</div>";
            }
            objouter1.style.display = '';
        }
        else {
            objouter1.style.display = 'none';
        }
    }
    //显示搜索的数据并关键字涂色
    function addOption1(value, keyw) {
        var v = value.replace(keyw, "<b><font color=\"red\">" + keyw + "</font></b>");
        objouter1.innerHTML += "<div style=\"width:395px;height:22px\" onmouseover=\"this.className='sman_selectedStyle'\" onmouseout=\"this.className=''\" onmousedown=\"document.getElementById('" + objInputId1 + "').value='" + value + "'\">" + v + "</div>"
    }
    String.prototype.Trim = function() {
        return this.replace(/(^\s*)|(\s*$)/g, "");
    }
    smanPromptList1();
    
    
    
    
    var arrList2 = new Array();//要搜索的数据
    var objouter2, objInput2, objInputId2 = "txtSearch_fromport";//控件ID
    var selectedIndex2 = -1, intTmp2;
    //初始化
    function smanPromptList2() {
        this.style = "overflow:hidden;width:393px;height:auto;background:#FFFFFF;border:1px solid #000000;font-size:14px;cursor:default;"
        if (arrList2.constructor != Array) {
            alert('smanPromptList2初始化失败:第一个参数非数组!');
            return;
        }
        document.write("<div id='__smanDisp2' style='position:absolute;display:none;" + this.style + "' onblur></div>");
        document.write("<style type=\"text/css\">.sman_selectedStyle{background-Color:#3366CC;color:#FFFFFF}</style>");

        arrList2.sort(function(a, b) {
            if (a.length > b.length) return 1;
            else if (a.length == b.length) return a.localeCompare(b);
            else return -1;
        });
        objouter2 = document.getElementById("__smanDisp2") //显示的DIV对象 
        objInput2 = document.getElementById(objInputId2);  //文本框对象
        if (objInput2 == null) {
            alert('smanPromptList2初始化失败:没有找到"' + objInputId2 + '"文本框');
            return;
        }
        objInput2.onblur = function() { objouter2.style.display = 'none'; }
        objInput2.onkeyup = checkKeyCode2;
        objInput2.onfocus = checkAndShow2;
    }

    function getAbsoluteHeight2(ob) {
        return ob.offsetHeight;
    }
    function getAbsoluteWidth2(ob) {
        return ob.offsetWidth;
    }
    function getAbsoluteLeft2(ob) {
        var s_el = 0, el = ob;
        while (el) {
            s_el = s_el + el.offsetLeft;
            el = el.offsetParent;
        };
        return s_el;
    }
    function getAbsoluteTop2(ob) {
        var s_el = 0, el = ob;
        while (el) {
            s_el = s_el + el.offsetTop;
            el = el.offsetParent;
        };
        return s_el;
    }
    function outSelection2(Index) {
        objInput2.value = objouter2.children[Index].innerText.Trim();
        objouter2.style.display = 'none';
    }
    function divPosition2() {
        objouter2.style.top = getAbsoluteHeight2(objInput2) + getAbsoluteTop2(objInput2) + 'px';
        objouter2.style.left = getAbsoluteLeft2(objInput2) + 'px';
        objouter2.style.width = getAbsoluteWidth2(objInput2) + 'px';
    }
    function chageSelection2(isUp) {
        
        if (objouter2.style.display == 'none') {
            objouter2.style.display = '';
        }
        else {
            if (isUp)
                selectedIndex2++;
            else
                selectedIndex2--;
        }
        var maxIndex = objouter2.children.length - 1;
        if (selectedIndex2 < 0) { selectedIndex2 = 0; }
        if (selectedIndex2 > maxIndex) { selectedIndex2 = maxIndex; }
        if (selectedIndex2 == maxIndex) { selectedIndex2 = -1; }

        for (intTmp2 = 0; intTmp2 <= maxIndex; intTmp2++) {
            if (intTmp2 == selectedIndex2) {
                objouter2.children[intTmp2].className = "sman_selectedStyle";
                objInput2.value = objouter2.children[selectedIndex2].innerText.Trim();
            }
            else {
                objouter2.children[intTmp2].className = "";
            }
        }
    }
    function checkKeyCode2() {
        var ie = (document.all) ? true : false
        if (ie) {
            var keyCode = event.keyCode
            if (keyCode == 40 || keyCode == 38) {
                var isUp = false
                if (keyCode == 40)
                    isUp = true;
                chageSelection2(isUp)
                
            }
            else if (keyCode == 13) {
                outSelection2(selectedIndex2);
            }
            else {
                checkAndShow2();
            }
        }
        else {
            checkAndShow2();
        }
        divPosition2();
    }

    function checkAndShow2() {
        var strInput = objInput2.value.Trim();
        if (strInput != "") {
            divPosition2();
            selectedIndex2 = -1;
            arrList2.length = 0;
            objouter2.innerHTML = "";
            //=======================这里修改数据================================
            var result = cms_ticket_ticket_add.GetAirport(strInput).value;
            //===================================================================
            var data = eval('(' + result + ')');
            for (var j = 0; j < data.length; j++) {

                arrList2[j] = data[j];
            }

            for (intTmp2 = 0; intTmp2 < arrList2.length; intTmp2++) {
                for (i = 0; i < arrList2[intTmp2].length; i++) {
                    if (arrList2[intTmp2].substr(i, strInput.length).toUpperCase() == strInput.toUpperCase()) {
                        addOption2(arrList2[intTmp2], strInput);
                    }
                    if (objouter2.childNodes.length >= 10) {
                        break;
                    }
                }
            }
            if (objouter2.childNodes.length > 0) {
                objouter2.innerHTML += "<div style=\"width:395px;height:22px;text-align:right;color:Blue;text-decoration:underline;cursor:pointer;\">关闭</div>";
            }
            objouter2.style.display = '';
        }
        else {
            objouter2.style.display = 'none';
        }
    }
    //显示搜索的数据并关键字涂色
    function addOption2(value, keyw) {
        var v = value.replace(keyw, "<b><font color=\"red\">" + keyw + "</font></b>");
        objouter2.innerHTML += "<div style=\"width:395px;height:22px\" onmouseover=\"this.className='sman_selectedStyle'\" onmouseout=\"this.className=''\" onmousedown=\"document.getElementById('" + objInputId2 + "').value='" + value + "'\">" + v + "</div>"
    }
    String.prototype.Trim = function() {
        return this.replace(/(^\s*)|(\s*$)/g, "");
    }
    
    smanPromptList2();
    
    
    var arrList3 = new Array();//要搜索的数据
    var objouter3, objInput3, objInputId3 = "txtSearch_toport";//控件ID
    var selectedIndex3 = -1, intTmp3;
    //初始化
    function smanPromptList3() {
        this.style = "overflow:hidden;width:393px;height:auto;background:#FFFFFF;border:1px solid #000000;font-size:14px;cursor:default;"
        if (arrList3.constructor != Array) {
            alert('smanPromptList3初始化失败:第一个参数非数组!');
            return;
        }
        document.write("<div id='__smanDisp3' style='position:absolute;display:none;" + this.style + "' onblur></div>");
        document.write("<style type=\"text/css\">.sman_selectedStyle{background-Color:#3366CC;color:#FFFFFF}</style>");

        arrList3.sort(function(a, b) {
            if (a.length > b.length) return 1;
            else if (a.length == b.length) return a.localeCompare(b);
            else return -1;
        });
        objouter3 = document.getElementById("__smanDisp3") //显示的DIV对象 
        objInput3 = document.getElementById(objInputId3);  //文本框对象
        if (objInput3 == null) {
            alert('smanPromptList3初始化失败:没有找到"' + objInputId3 + '"文本框');
            return;
        }
        objInput3.onblur = function() { objouter3.style.display = 'none'; }
        objInput3.onkeyup = checkKeyCode3;
        objInput3.onfocus = checkAndShow3;
    }

    function getAbsoluteHeight3(ob) {
        return ob.offsetHeight;
    }
    function getAbsoluteWidth3(ob) {
        return ob.offsetWidth;
    }
    function getAbsoluteLeft3(ob) {
        var s_el = 0, el = ob;
        while (el) {
            s_el = s_el + el.offsetLeft;
            el = el.offsetParent;
        };
        return s_el;
    }
    function getAbsoluteTop3(ob) {
        var s_el = 0, el = ob;
        while (el) {
            s_el = s_el + el.offsetTop;
            el = el.offsetParent;
        };
        return s_el;
    }
    function outSelection3(Index) {
        objInput3.value = objouter3.children[Index].innerText.Trim();
        objouter3.style.display = 'none';
    }
    function divPosition3() {
        objouter3.style.top = getAbsoluteHeight3(objInput3) + getAbsoluteTop3(objInput3) + 'px';
        objouter3.style.left = getAbsoluteLeft3(objInput3) + 'px';
        objouter3.style.width = getAbsoluteWidth3(objInput3) + 'px';
    }
    function chageSelection3(isUp) {
        
        if (objouter3.style.display == 'none') {
            objouter3.style.display = '';
        }
        else {
            if (isUp)
                selectedIndex3++;
            else
                selectedIndex3--;
        }
        var maxIndex = objouter3.children.length - 1;
        if (selectedIndex3 < 0) { selectedIndex3 = 0; }
        if (selectedIndex3 > maxIndex) { selectedIndex3 = maxIndex; }
        if (selectedIndex3 == maxIndex) { selectedIndex3 = -1; }

        for (intTmp3 = 0; intTmp3 <= maxIndex; intTmp3++) {
            if (intTmp3 == selectedIndex3) {
                objouter3.children[intTmp3].className = "sman_selectedStyle";
                objInput3.value = objouter3.children[selectedIndex3].innerText.Trim();
            }
            else {
                objouter3.children[intTmp3].className = "";
            }
        }
    }
    function checkKeyCode3() {
        var ie = (document.all) ? true : false
        if (ie) {
            var keyCode = event.keyCode
            if (keyCode == 40 || keyCode == 38) {
                var isUp = false
                if (keyCode == 40)
                    isUp = true;
                chageSelection3(isUp)
                
            }
            else if (keyCode == 13) {
                outSelection3(selectedIndex3);
            }
            else {
                checkAndShow3();
            }
        }
        else {
            checkAndShow3();
        }
        divPosition3();
    }

    function checkAndShow3() {
        var strInput = objInput3.value.Trim();
        if (strInput != "") {
            divPosition3();
            selectedIndex3 = -1;
            arrList3.length = 0;
            objouter3.innerHTML = "";
            //=======================这里修改数据================================
            var result = cms_ticket_ticket_add.GetAirport(strInput).value;
            //===================================================================
            var data = eval('(' + result + ')');
            for (var j = 0; j < data.length; j++) {

                arrList3[j] = data[j];
            }

            for (intTmp3 = 0; intTmp3 < arrList3.length; intTmp3++) {
                for (i = 0; i < arrList3[intTmp3].length; i++) {
                    if (arrList3[intTmp3].substr(i, strInput.length).toUpperCase() == strInput.toUpperCase()) {
                        addOption3(arrList3[intTmp3], strInput);
                    }
                    if (objouter3.childNodes.length >= 10) {
                        break;
                    }
                }
            }
            if (objouter3.childNodes.length > 0) {
                objouter3.innerHTML += "<div style=\"width:395px;height:22px;text-align:right;color:Blue;text-decoration:underline;cursor:pointer;\">关闭</div>";
            }
            objouter3.style.display = '';
        }
        else {
            objouter3.style.display = 'none';
        }
    }
    //显示搜索的数据并关键字涂色
    function addOption3(value, keyw) {
        var v = value.replace(keyw, "<b><font color=\"red\">" + keyw + "</font></b>");
        objouter3.innerHTML += "<div style=\"width:395px;height:22px\" onmouseover=\"this.className='sman_selectedStyle'\" onmouseout=\"this.className=''\" onmousedown=\"document.getElementById('" + objInputId3 + "').value='" + value + "'\">" + v + "</div>"
    }
    String.prototype.Trim = function() {
        return this.replace(/(^\s*)|(\s*$)/g, "");
    }
    
    smanPromptList3();
    
    
    
    var arrList4 = new Array();//要搜索的数据
    var objouter4, objInput4, objInputId4 = "txtSearch_relayport";//控件ID
    var selectedIndex4 = -1, intTmp4;
    //初始化
    function smanPromptList4() {
        this.style = "overflow:hidden;width:393px;height:auto;background:#FFFFFF;border:1px solid #000000;font-size:14px;cursor:default;"
        if (arrList4.constructor != Array) {
            alert('smanPromptList4初始化失败:第一个参数非数组!');
            return;
        }
        document.write("<div id='__smanDisp4' style='position:absolute;display:none;" + this.style + "' onblur></div>");
        document.write("<style type=\"text/css\">.sman_selectedStyle{background-Color:#3366CC;color:#FFFFFF}</style>");

        arrList4.sort(function(a, b) {
            if (a.length > b.length) return 1;
            else if (a.length == b.length) return a.localeCompare(b);
            else return -1;
        });
        objouter4 = document.getElementById("__smanDisp4") //显示的DIV对象 
        objInput4 = document.getElementById(objInputId4);  //文本框对象
        if (objInput4 == null) {
            alert('selectedIndex4初始化失败:没有找到"' + objInputId4 + '"文本框');
            return;
        }
        objInput4.onblur = function() { objouter4.style.display = 'none'; }
        objInput4.onkeyup = checkKeyCode4;
        objInput4.onfocus = checkAndShow4;
    }

    function getAbsoluteHeight4(ob) {
        return ob.offsetHeight;
    }
    function getAbsoluteWidth4(ob) {
        return ob.offsetWidth;
    }
    function getAbsoluteLeft4(ob) {
        var s_el = 0, el = ob;
        while (el) {
            s_el = s_el + el.offsetLeft;
            el = el.offsetParent;
        };
        return s_el;
    }
    function getAbsoluteTop4(ob) {
        var s_el = 0, el = ob;
        while (el) {
            s_el = s_el + el.offsetTop;
            el = el.offsetParent;
        };
        return s_el;
    }
    function outSelection4(Index) {
        objInput4.value = objouter4.children[Index].innerText.Trim();
        objouter4.style.display = 'none';
    }
    function divPosition4() {
        objouter4.style.top = getAbsoluteHeight4(objInput4) + getAbsoluteTop4(objInput4) + 'px';
        objouter4.style.left = getAbsoluteLeft4(objInput4) + 'px';
        objouter4.style.width = getAbsoluteWidth4(objInput4) + 'px';
    }
    function chageSelection4(isUp) {
        
        if (objouter4.style.display == 'none') {
            objouter4.style.display = '';
        }
        else {
            if (isUp)
                selectedIndex4++;
            else
                selectedIndex4--;
        }
        var maxIndex = objouter4.children.length - 1;
        if (selectedIndex4 < 0) { selectedIndex4 = 0; }
        if (selectedIndex4 > maxIndex) { selectedIndex4 = maxIndex; }
        if (selectedIndex4 == maxIndex) { selectedIndex4 = -1; }

        for (intTmp4 = 0; intTmp4 <= maxIndex; intTmp4++) {
            if (intTmp4 == selectedIndex4) {
                objouter4.children[intTmp4].className = "sman_selectedStyle";
                objInput4.value = objouter4.children[selectedIndex4].innerText.Trim();
            }
            else {
                objouter4.children[intTmp4].className = "";
            }
        }
    }
    function checkKeyCode4() {
        var ie = (document.all) ? true : false
        if (ie) {
            var keyCode = event.keyCode
            if (keyCode == 40 || keyCode == 38) {
                var isUp = false
                if (keyCode == 40)
                    isUp = true;
                chageSelection4(isUp)
                
            }
            else if (keyCode == 13) {
                outSelection4(selectedIndex4);
            }
            else {
                checkAndShow4();
            }
        }
        else {
            checkAndShow4();
        }
        divPosition4();
    }

    function checkAndShow4() {
        var strInput = objInput4.value.Trim();
        if (strInput != "") {
            divPosition4();
            selectedIndex4 = -1;
            arrList4.length = 0;
            objouter4.innerHTML = "";
            //=======================这里修改数据================================
            var result = cms_ticket_ticket_add.GetAirport(strInput).value;
            //===================================================================
            var data = eval('(' + result + ')');
            for (var j = 0; j < data.length; j++) {

                arrList4[j] = data[j];
            }

            for (intTmp4 = 0; intTmp4 < arrList4.length; intTmp4++) {
                for (i = 0; i < arrList4[intTmp4].length; i++) {
                    if (arrList4[intTmp4].substr(i, strInput.length).toUpperCase() == strInput.toUpperCase()) {
                        addOption4(arrList4[intTmp4], strInput);
                    }
                    if (objouter4.childNodes.length >= 10) {
                        break;
                    }
                }
            }
            if (objouter4.childNodes.length > 0) {
                objouter4.innerHTML += "<div style=\"width:395px;height:22px;text-align:right;color:Blue;text-decoration:underline;cursor:pointer;\">关闭</div>";
            }
            objouter4.style.display = '';
        }
        else {
            objouter4.style.display = 'none';
        }
    }
    //显示搜索的数据并关键字涂色
    function addOption4(value, keyw) {
        var v = value.replace(keyw, "<b><font color=\"red\">" + keyw + "</font></b>");
        objouter4.innerHTML += "<div style=\"width:395px;height:22px\" onmouseover=\"this.className='sman_selectedStyle'\" onmouseout=\"this.className=''\" onmousedown=\"document.getElementById('" + objInputId4 + "').value='" + value + "'\">" + v + "</div>"
    }
    String.prototype.Trim = function() {
        return this.replace(/(^\s*)|(\s*$)/g, "");
    }
    
    smanPromptList4();
    </script>

</body>
</html>
