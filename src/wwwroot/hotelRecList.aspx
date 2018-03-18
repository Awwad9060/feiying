<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hotelRecList.aspx.cs" Inherits="hotelRecList" %>

 <ul class="twolinebox_boxtwo">
  
   <%
       if (hotelList.Count != 0)
      {

       for (int i = 0; i < hotelList.Count; i++)
                {
                    System.Data.DataRow hotelList_row = hotelList[i];
                 %>
    <li class="twolinebox_boxtwoli">
      <a href="<%=hotelList_row["linkUrl"].ToString()%>" title=""><img src="<%=hotelList_row["picPath"].ToString()%>" alt="" /></a>
      <ul>
        <li class="one"><a href="<%=hotelList_row["linkUrl"].ToString()%>" title=""><%=hotelList_row["hName"].ToString()%></a></li>
        <li class="two"><%=hotelList_row["starFlag"].ToString()%>酒店<strong>￥<%=hotelList_row["price"].ToString()%></strong></li>
        <li class="two">位置：<%=hotelList_row["location"].ToString()%></li>
      </ul>
    </li>
    <%
    }
    }
     %>
    
</ul>
