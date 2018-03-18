<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FY_Hotel_add.aspx.cs" Inherits="console_hotel_FY_Hotel_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>发布酒店信息</title>
    <link rel="stylesheet" href="../css/control.css" type="text/css" />
    <script language="javascript" type="text/javascript" src="../../js/DateControls.js"></script>
    <script type="text/javascript" language="javascript">
    
    function checkInfo()
    { 
      if(document.getElementById("txt_HotelName").value=="")
       {
          alert("酒店名称不能为空！");
          return false;
       }  
       
      if(document.getElementById("txt_Price").value=="")
       {
          alert("酒店每天房价不为空！");
          return false;
       }
          
      if(document.getElementById("sel_cityName").value=="")
       {
          alert("请选择酒店所属城市！");
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
    <form id="form1" runat="server">
      <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" id="TABLE1">
            <tr>
                <td align="center" bgcolor="#799AE1" class="B" style="width: 413px" >
                    </td>
                <td height="25" align="left" bgcolor="#799AE1" class="B" style="width: 839px">
                    <asp:Label ID ="lblTitle" runat ="server"></asp:Label></td>
                <td align="center" bgcolor="#799AE1" class="B" style="width: 253px">
                    </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    酒店名称：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_HotelName" runat="server" type="text" style=" width:460px" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    酒店地址：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_address" runat="server" type="text" style=" width:460px" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    开始时间：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_fromDate"  onfocus="return setday(this)"  runat="server" type="text" size="25" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>  
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    结束时间：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_toDate"  onfocus="return setday(this)" runat="server" type="text" size="25" />
               <asp:Label ID="labdate" runat="server" ></asp:Label>
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    每天价格：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_Price" runat="server" type="text" size="25" />※有效时间内的每天房价
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    最大房间数：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                    <select id="sel_RoomNum" style="width:60px" runat="server" >
                        <option value="" >ALL</option>
                        <option value="1" >1</option>
                        <option value="2" >2</option>
                        <option value="3" >3</option>
                        <option value="4" >4</option>
                        <option value="5" >5</option>
                        <option value="6" >6</option>
                        <option value="7" >7</option>
                        <option value="8" >8</option>
                        <option value="9" >9</option>
                        <option value="10" >10</option>
                        <option value="11" >11</option>
                        <option value="12" >12</option>
                        <option value="13" >13</option>
                        <option value="14" >14</option>
                        <option value="15" >15</option>
                        <option value="16" >16</option>
                        <option value="17" >17</option>
                        <option value="18" >18</option>
                        <option value="19" >19</option>
                        <option value="20" >20</option>
                        <option value="21" >21</option>
                        <option value="22" >22</option>
                        <option value="23" >23</option>
                        <option value="24" >24</option>
                        <option value="25" >25</option>
                        <option value="26" >26</option>
                        <option value="27" >27</option>
                        <option value="28" >28</option>
                    </select>
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr style="display:none">
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    国内/国际：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                    <asp:RadioButton ID="isRegion0" runat="server"  Checked="True"  GroupName="isRegion" Text="国内酒店"/>
                    &nbsp;&nbsp; &nbsp;&nbsp;               
                    <asp:RadioButton ID="isRegion1" runat="server" GroupName="isRegion" Text="国际酒店"/> 
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>          
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    所属城市：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                    <select id="sel_cityName" style="width:120px" runat="server" >
                    </select>
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    所属星级：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
				    <select id="sel_rate" style="width:120px" runat="server" >
                        <option value=""> :::: 所属等級 :::: </option>
                        <option value="1"  >☆</option>
                        <option value="2"  >☆☆</option>
                        <option value="2+" >☆☆+</option>
                        <option value="3"  >☆☆☆</option>
                        <option value="3+" >☆☆☆+</option>
                        <option value="4"  >☆☆☆☆</option>
                        <option value="4+" >☆☆☆☆+</option>
                        <option value="5"  >☆☆☆☆☆</option>
					</select>
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px; height: 30px;">
                   推荐图片：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 839px; height: 30px">
                <asp:Label ID="isUploadPic" runat="server" Text=""></asp:Label>
	  	               <input id="isReload" type="hidden" runat="server" value="0" />
	  	               <input id="oldPic" type="hidden" runat="server" value="" />
                    </td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 30px;">
                  </td>
            </tr>
            <tr id="picUpload" >
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
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
                <td align="center" bgcolor="#F6F6F6" style="width: 413px; height: 30px;">
                    图集图片1：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 839px; height: 30px">
                <asp:Label ID="isUploadPic2" runat="server" Text=""></asp:Label>
	  	               <input id="isReload2" type="hidden" runat="server" value="0" />
	  	               <input id="oldPic2" type="hidden" runat="server" value="" />
                    </td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 30px;">
                  </td>
            </tr>
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    图集图片1：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                 <asp:FileUpload ID="FileUpload_picPath2" runat="server" Width="285px" />
            <label>
          &nbsp;</label><asp:CustomValidator ID="CustomValidator_pic2" runat="server" 
                ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_picPath2" 
                Display="Dynamic" ErrorMessage="&lt;br/&gt;*只支持 jpg , gif , bmp , png 等图片格式"></asp:CustomValidator>   </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>

            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px; height: 30px;">
                    图集图片2：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 839px; height: 30px">
                <asp:Label ID="isUploadPic3" runat="server" Text=""></asp:Label>
	  	               <input id="oldPic3" type="hidden" runat="server" value="" />
                    </td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 30px;">
                  </td>
            </tr>
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    图集图片2：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                 <asp:FileUpload ID="FileUpload_picPath3" runat="server" Width="285px" />
            <label>
          &nbsp;</label><asp:CustomValidator ID="CustomValidator2" runat="server" 
                ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_picPath3" 
                Display="Dynamic" ErrorMessage="&lt;br/&gt;*只支持 jpg , gif , bmp , png 等图片格式"></asp:CustomValidator>   </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
                        <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px; height: 30px;">
                    图集图片3：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 839px; height: 30px">
                <asp:Label ID="isUploadPic4" runat="server" Text=""></asp:Label>
	  	               <input id="oldPic4" type="hidden" runat="server" value="" />
                    </td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 30px;">
                  </td>
            </tr>
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    图集图片3：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                 <asp:FileUpload ID="FileUpload_picPath4" runat="server" Width="285px" />
            <label>
          &nbsp;</label><asp:CustomValidator ID="CustomValidator4" runat="server" 
                ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_picPath4" 
                Display="Dynamic" ErrorMessage="&lt;br/&gt;*只支持 jpg , gif , bmp , png 等图片格式"></asp:CustomValidator>   </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
                        <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px; height: 30px;">
                    图集图片4：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 839px; height: 30px">
                <asp:Label ID="isUploadPic5" runat="server" Text=""></asp:Label>
	  	               <input id="oldPic5" type="hidden" runat="server" value="" />
                    </td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 30px;">
                  </td>
            </tr>
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    图集图片4：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                 <asp:FileUpload ID="FileUpload_picPath5" runat="server" Width="285px" />
            <label>
          &nbsp;</label><asp:CustomValidator ID="CustomValidator5" runat="server" 
                ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_picPath5" 
                Display="Dynamic" ErrorMessage="&lt;br/&gt;*只支持 jpg , gif , bmp , png 等图片格式"></asp:CustomValidator>   </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
                        <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px; height: 30px;">
                    图集图片5：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 839px; height: 30px">
                <asp:Label ID="isUploadPic6" runat="server" Text=""></asp:Label>
	  	               <input id="oldPic6" type="hidden" runat="server" value="" />
                    </td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 30px;">
                  </td>
            </tr>
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    图集图片5：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                 <asp:FileUpload ID="FileUpload_picPath6" runat="server" Width="285px" />
            <label>
          &nbsp;</label><asp:CustomValidator ID="CustomValidator6" runat="server" 
                ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_picPath6" 
                Display="Dynamic" ErrorMessage="&lt;br/&gt;*只支持 jpg , gif , bmp , png 等图片格式"></asp:CustomValidator>   </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
                        <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px; height: 30px;">
                    图集图片6：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 839px; height: 30px">
                <asp:Label ID="isUploadPic7" runat="server" Text=""></asp:Label>
	  	               <input id="oldPic7" type="hidden" runat="server" value="" />
                    </td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 30px;">
                  </td>
            </tr>
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    图集图片6：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                 <asp:FileUpload ID="FileUpload_picPath7" runat="server" Width="285px" />
            <label>
          &nbsp;</label><asp:CustomValidator ID="CustomValidator7" runat="server" 
                ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_picPath7" 
                Display="Dynamic" ErrorMessage="&lt;br/&gt;*只支持 jpg , gif , bmp , png 等图片格式"></asp:CustomValidator>   </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
                        <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px; height: 30px;">
                    图集图片7：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 839px; height: 30px">
                <asp:Label ID="isUploadPic8" runat="server" Text=""></asp:Label>
	  	               <input id="oldPic8" type="hidden" runat="server" value="" />
                    </td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 30px;">
                  </td>
            </tr>
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    图集图片7：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                 <asp:FileUpload ID="FileUpload_picPath8" runat="server" Width="285px" />
            <label>
          &nbsp;</label><asp:CustomValidator ID="CustomValidator8" runat="server" 
                ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_picPath8" 
                Display="Dynamic" ErrorMessage="&lt;br/&gt;*只支持 jpg , gif , bmp , png 等图片格式"></asp:CustomValidator>   </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
                        <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px; height: 30px;">
                    图集图片8：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 839px; height: 30px">
                <asp:Label ID="isUploadPic9" runat="server" Text=""></asp:Label>
	  	               <input id="oldPic9" type="hidden" runat="server" value="" />
                    </td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 30px;">
                  </td>
            </tr>
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    图集图片8：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                 <asp:FileUpload ID="FileUpload_picPath9" runat="server" Width="285px" />
            <label>
          &nbsp;</label><asp:CustomValidator ID="CustomValidator9" runat="server" 
                ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_picPath9" 
                Display="Dynamic" ErrorMessage="&lt;br/&gt;*只支持 jpg , gif , bmp , png 等图片格式"></asp:CustomValidator>   </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
                        <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px; height: 30px;">
                    图集图片9：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 839px; height: 30px">
                <asp:Label ID="isUploadPic10" runat="server" Text=""></asp:Label>
	  	               <input id="oldPic10" type="hidden" runat="server" value="" />
                    </td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 30px;">
                  </td>
            </tr>
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    图集图片9：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                 <asp:FileUpload ID="FileUpload_picPath10" runat="server" Width="285px" />
            <label>
          &nbsp;</label><asp:CustomValidator ID="CustomValidator10" runat="server" 
                ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_picPath10" 
                Display="Dynamic" ErrorMessage="&lt;br/&gt;*只支持 jpg , gif , bmp , png 等图片格式"></asp:CustomValidator>   </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
                        <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px; height: 30px;">
                    图集图片10：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 839px; height: 30px">
                <asp:Label ID="isUploadPic11" runat="server" Text=""></asp:Label>
	  	               <input id="oldPic11" type="hidden" runat="server" value="" />
                    </td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 30px;">
                  </td>
            </tr>
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    图集图片10：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                 <asp:FileUpload ID="FileUpload_picPath11" runat="server" Width="285px" />
            <label>
          &nbsp;</label><asp:CustomValidator ID="CustomValidator11" runat="server" 
                ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_picPath11" 
                Display="Dynamic" ErrorMessage="&lt;br/&gt;*只支持 jpg , gif , bmp , png 等图片格式"></asp:CustomValidator>   </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    酒店简介：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <textarea id="txt_intro" style="width:460px; height:80px" runat="server" cols="20" rows="2"></textarea>
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
             <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    综合设施：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <input  id="txt_zhonghesheshi" runat="server" type="text" style=" width:460px" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    服务项目：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_fuwuxiangmu" runat="server" type="text" style=" width:460px" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    互联网：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_internet" runat="server" type="text" style=" width:460px" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    停车设施：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_tingchesheshi" runat="server" type="text" style=" width:460px" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>                
           
           
           <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    酒店政策：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <textarea id="txt_jiudianzhengce" style="width:460px; height:80px"  runat="server" cols="20" rows="2"></textarea>
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
             <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    入住手续：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <input  id="txt_ruzhushouxu" runat="server" type="text" style=" width:460px" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    退房手续：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_tuifangshouxu" runat="server" type="text" style=" width:460px" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    取消预订：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_quxiaoyuding" runat="server" type="text" style=" width:460px" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    儿童加床：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <textarea id="txt_ertongjiachuang" style="width:460px; height:80px"  runat="server" cols="20" rows="2"></textarea>
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>  
           
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    押金：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_yajin" runat="server" type="text" style=" width:460px" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    宠物事宜：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_chongwu" runat="server" type="text" style=" width:460px" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    接受信用卡：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_xinyongka" runat="server" type="text" style=" width:460px" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px">
                    置顶：</td>
                <td align="left" bgcolor="#F6F6F6" style="height: 27px">
                    <asp:RadioButton ID="radisTop1" runat="server" GroupName="isTopp" Text="是"/>
                    &nbsp;&nbsp; &nbsp;&nbsp;               
                    <asp:RadioButton ID="radisTop0" runat="server" GroupName="isTopp" Text="否" Checked="True" /> </td>
                <td bgcolor="#F6F6F6" style="height: 27px; width: 253px;">
                  </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6">
                    推荐：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                    <asp:RadioButton ID="radisRecom1" runat="server" GroupName="isRecomm" Text="是"  />
                    &nbsp;&nbsp; &nbsp;&nbsp;               
                    <asp:RadioButton ID="radisRecom0" runat="server" GroupName="isRecomm" Text="否" Checked="True"/> </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
           
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px" colspan="3">
                    <asp:Button ID="btnSave" runat="server" Text="保 存"  Height="23" OnClientClick="return checkInfo()" OnClick="btnSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="Submit3" type="button" style="height: 23px;"onclick="location.href='FY_Hotel_list.aspx'" value="返 回" />
                    </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                 </td>
            </tr>
        </table>
    </form>
</body>
</html>
