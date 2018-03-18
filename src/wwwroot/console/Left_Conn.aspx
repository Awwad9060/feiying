<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Left_Conn.aspx.cs" Inherits="console_Left_Conn"
    MasterPageFile="~/console/User_LeftMenu.Master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div id="Guide_back">
        <ul>
            <li id="Guide_top">
                <div id="Guide_toptext">
                    Fei580.com
                </div>
            </li>
            <li id="Guide_main">
                <div id="Guide_box">
                    <asp:Panel ID="pan_1" runat="server" >
                    <div class="guidecollapse" onclick="Switch(this)">
                        网站系统管理</div>
                    <div class="guide" style="display:none">
                        <ul>
                            <li><a href="admin/admin_list.aspx" target="main_right">&nbsp;管理员设置</a></li>
                            <li><a href="ad/ad_list.aspx" target="main_right">&nbsp;广告图设置</a></li>
                            <li><a href="searching/CityMapList.aspx" target="main_right">&nbsp;城市地图位置</a></li>
                            <li><a href="lmessage/lmessage_list.aspx" target="main_right">&nbsp;网站投诉建议</a></li> 
                        </ul>
                    </div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pan_2" runat="server" >
                    <div class="guidecollapse" onclick="Switch(this)">
                        基础设置管理</div>
                    <div class="guide" style="display:none">
                        <ul>
                            <li><a href="state/state_list.aspx" target="main_right">&nbsp;大洲分类列表</a></li>
                            <li><a href="state/fromCity_list.aspx" target="main_right">&nbsp;出发城市列表</a></li>
                            <li><a href="state/toCity_list.aspx" target="main_right">&nbsp;到达城市列表</a></li>
                            <li><a href="state/HotelCity_list.aspx" target="main_right">&nbsp;酒店城市列表</a></li>
                        </ul>
                    </div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pan_3" runat="server" >
                    <div class="guidecollapse" onclick="Switch(this)">
                        客户在线服务</div>
                    <div class="guide" style="display:none">
                        <ul>
                            <li><a href="guest/fastBook.aspx" target="main_right">&nbsp;快速预订</a></li>
                            <li><a href="guest/leaveTel.aspx" target="main_right">&nbsp;预留电话</a></li>
                        </ul>
                    </div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pan_4" runat="server" >
                    <div class="guidecollapse" onclick="Switch(this)">
                        航空公司管理</div>
                    <div class="guide" style="display:none">
                        <ul>
                            <li><a href="airline/airline_list.aspx" target="main_right">&nbsp;航空公司列表</a></li>
                            <li><a href="airline/airline_add.aspx" target="main_right">&nbsp;添加航空公司</a></li>
                            <li><a href="airline/airline_comment_list.aspx" target="main_right">&nbsp;航空公司评论</a></li>
                        </ul>
                    </div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pan_5" runat="server" >
                     <div class="guidecollapse" onclick="Switch(this)">
                        机场信息管理</div>
                    <div class="guide" style="display:none">
                        <ul>
                            <li><a href="airport/airport_list.aspx" target="main_right">&nbsp;机场信息列表</a></li>
                            <li><a href="airport/airport_add.aspx" target="main_right">&nbsp;添加机场信息</a></li>
                            <li><a href="airport/airport_comment_list.aspx" target="main_right">&nbsp;机场信息评论</a></li>
                        </ul>
                    </div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pan_6" runat="server" >
                     <div class="guidecollapse" onclick="Switch(this)">
                        机型信息管理</div>
                    <div class="guide" style="display:none">
                        <ul>
                            <li><a href="airplan/airplan_list.aspx" target="main_right">&nbsp;机型信息列表</a></li>
                            <li><a href="airplan/airplan_add.aspx" target="main_right">&nbsp;添加机型信息</a></li>
                            <li><a href="airplan/airplan_comment_list.aspx" target="main_right">&nbsp;机型信息评论</a></li>
                        </ul>
                    </div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pan_7" runat="server" >
                      <div class="guidecollapse" onclick="Switch(this)">
                        机票信息管理</div>
                    <div class="guide" style="display:none">
                        <ul>
                            <li><a href="ticket/ticket_list.aspx" target="main_right">&nbsp;国际机票列表</a></li>
                            <li><a href="ticket/ticket_add.aspx" target="main_right">&nbsp;添加国际机票</a></li>
                            <li><a href="ticket/ticket_add2.aspx" target="main_right">&nbsp;添加国际机票(新版)</a></li>
                            <li><a href="aifei/aifei_comment_list.aspx" target="_blank">&nbsp;爱飞网数据查询</a></li>
                        </ul>
                    </div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pan_8" runat="server" >
                      <div class="guidecollapse" onclick="Switch(this)">
                        机票推荐管理</div>
                    <div class="guide" style="display:none">
                        <ul>
                            <li><a href="ticket/ticketRec_list.aspx?rType=今期特价推荐" target="main_right">&nbsp;今期特价推荐</a></li>
                            
                            <li><a href="ticket/ticketRec_list.aspx?rType=随便看看" target="main_right">&nbsp;随便看看</a></li>
                            <li><a href="ticket/ticketRec_list.aspx?rType=行程未定 " target="main_right">&nbsp;行程未定 </a></li>
                            <li><a href="ticket/ticketRec_list.aspx?rType=价格比较" target="main_right">&nbsp;价格比较</a></li>
                            <li><a href="ticket/ticketRec_list.aspx?rType=等待签证" target="main_right">&nbsp;等待签证</a></li>
                            <li><a href="ticket/ticketRec_list.aspx?rType=向你推荐" target="main_right">&nbsp;向你推荐</a></li>
                            <li><a href="ticket/ticketRec_list.aspx?rType=本周图片推荐" target="main_right">&nbsp;本周图片推荐</a></li>
                            <li><a href="ticket/ticketRec_list.aspx?rType=精选图片推" target="main_right">&nbsp;精选图片推荐</a></li>
                            <li><a href="ticket/ticketRec_list.aspx?rType=特价图片推荐1" target="main_right">&nbsp;特价图片推荐1</a></li>
                            <li><a href="ticket/ticketRec_list.aspx?rType=特价图片推荐2" target="main_right">&nbsp;特价图片推荐2</a></li>
                            <li><a href="ticket/ticketRec_list.aspx?rType=特价图片推荐3" target="main_right">&nbsp;特价图片推荐3</a></li> 
                            <li><a href="ticket/ticketRec_list.aspx?rType=IDS限量特价" target="main_right">&nbsp;IDS限量特价</a></li>
                            
                        
                        </ul>
                    </div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pan_9" runat="server" >
                     <div class="guidecollapse" onclick="Switch(this)">
                        预定记录管理</div>
                    <div class="guide" style="display:none">
                        <ul>
                            <li><a href="book/ticketBook_list.aspx" target="main_right">&nbsp;客户预定列表</a></li>
                            <li><a href="book/ticketBook1_list1.aspx" target="main_right">&nbsp;机票预定列表</a></li>
                            <li><a href="book/ticketBook2_list2.aspx" target="main_right">&nbsp;手机网站预定列表</a></li>
                        </ul>
                    </div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pan_10" runat="server" >
                     <div class="guidecollapse" onclick="Switch(this)">
                        酒店推荐管理</div>
                    <div class="guide" style="display:none">
                        <ul>
                            <li><a href="hotel/FY_Hotel_add.aspx" target="main_right">&nbsp;添加基础酒店</a></li>
                            <li><a href="hotel/FY_Hotel_list.aspx" target="main_right">&nbsp;基础酒店列表</a></li>
                            <li><a href="hotel/FY_Hotel_comment_list.aspx" target="main_right">&nbsp;基础酒店评论</a></li>
                            <li><a href="book/hotelBook_list.aspx" target="main_right">&nbsp;预定酒店列表</a></li>
                            <li><a href="hotel/hotelRec_list.aspx" target="main_right">&nbsp;酒店推荐列表</a></li>
                            <li><a href="hotel/hotel_add.aspx" target="main_right">&nbsp;添加推荐酒店</a></li>
                              
                        </ul>
                    </div>
                    </asp:Panel>
                    
                    
                    <asp:Panel ID="pan_20" runat="server" >
                    <div class="guidecollapse" onclick="Switch(this)">
                        税费信息管理</div>
                    <div class="guide" style="display:none">
                        <ul>
                            <li><a href="taxManager/tax_list.aspx" target="main_right">&nbsp;税费信息列表</a></li>
                            <li><a href="taxManager/tax_add.aspx" target="main_right">&nbsp;添加税费信息</a></li>
                        </ul>
                    </div>
                    </asp:Panel>
                    
                    
                    <asp:Panel ID="pan_11" runat="server" >
                    <div class="guidecollapse" onclick="Switch(this)">
                        兑换奖品管理</div>
                    <div class="guide" style="display:none">
                        <ul>
                            <li><a href="prizes/prizes_list.aspx" target="main_right">&nbsp;兑换奖品列表</a></li>
                            <li><a href="prizes/prizes_add.aspx" target="main_right">&nbsp;添加兑换奖品</a></li>
                            <li><a href="prizes/lottery_list.aspx" target="main_right">&nbsp;摇奖记录</a></li>
                            <li><a href="prizes/prizes_order.aspx" target="main_right">&nbsp;奖品兑换</a></li>
                        </ul>
                    </div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pan_12" runat="server" >
                    <div class="guidecollapse" onclick="Switch(this)">
                        新闻资讯管理</div>
                    <div class="guide" style="display:none">
                        <ul>       
                            <li><a href="news/news_list.aspx" target="main_right">&nbsp;新闻资讯列表</a></li>
                            <li><a href="news/news_add.aspx" target="main_right">&nbsp;添加新闻资讯</a></li>
                            <li><a href="cms/news_html.aspx" target="main_right">&nbsp;HTML资讯生成</a></li>   
                            <li><a href="news/news_comment_list.aspx" target="main_right">&nbsp;新闻资讯评论</a></li>                      
                        </ul>
                    </div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pan_13" runat="server" >
                    <div class="guidecollapse" onclick="Switch(this)">
                        飞瀛圈管理</div>
                    <div class="guide" style="display:none">
                        <ul>       
                            <li><a href="person/personlist.aspx" target="main_right">&nbsp;会员信息列表</a></li>
                            <li><a href="person/jourlist.aspx" target="main_right">&nbsp;会员文章</a></li>
                            <li><a href="person/jour_comment_list.aspx" target="main_right">&nbsp;会员文章评论</a></li>                   
                        </ul>
                    </div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pan_14" runat="server" >
                     <div class="guidecollapse" onclick="Switch(this)">
                        IDS服务</div>
                    <div class="guide" style="display:none">
                        <ul>       
                            <li><a href="IDS/ids_list.aspx" target="main_right">&nbsp;IDS服务列表</a></li>
                            <li><a href="IDS/ids_add.aspx" target="main_right">&nbsp;添加IDS服务</a></li>                  
                        </ul>
                    </div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pan_15" runat="server" >
                    <div class="guidecollapse" onclick="Switch(this)">
                        特色服务管理</div>
                    <div class="guide" style="display:none">
                        <ul>       
                            <li><a href="server/server_list.aspx" target="main_right">&nbsp;特色服务列表</a></li>              
                        </ul>
                    </div>
                    </asp:Panel>
                    <asp:Panel ID="pan_16" runat="server" >
                    <div class="guidecollapse" onclick="Switch(this)">
                        电子票上传</div>
                    <div class="guide" style="display:none">
                        <ul>       
                           <%-- <li><a href="ticketing/ticketing_add.aspx" target="main_right">&nbsp;电子票上传</a></li>--%>
                            <li><a href="ticketing/ticketing_list.aspx" target="main_right">&nbsp;电子票列表</a></li>               
                        </ul>
                    </div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pan_17" runat="server" >
                    <div class="guidecollapse" onclick="Switch(this)">
                        客户在线服务</div>
                    <div class="guide" style="display:none">
                        <ul>       
                            <li><a href="guest/fastBook1.aspx" target="main_right">&nbsp;快速预订</a></li>
                            <li><a href="guest/leaveTel1.aspx" target="main_right">&nbsp;预留电话</a></li>               
                        </ul>
                    </div>
                    </asp:Panel>
                    <asp:Panel ID="pan_18" runat="server" >
                     <div class="guidecollapse" onclick="Switch(this)">
                        预定记录管理</div>
                    <div class="guide" style="display:none">
                        <ul>
                            <li><a href="book/ticketBook_list1.aspx" target="main_right">&nbsp;客户预定列表</a></li>
                            <li><a href="book/ticketBook1_list.aspx" target="main_right">&nbsp;机票预定列表</a></li>
                            <li><a href="book/ticketBook_list2.aspx" target="main_right">&nbsp;手机网站预定列表</a></li>
                        </ul>
                    </div>
                    </asp:Panel>

                    <asp:Panel ID="pan_19" runat="server" >
                    <div class="guidecollapse" onclick="Switch(this)">
                        数据更新</div>
                    <div class="guide" style="display:none">
                        <ul>
                            <li><a href="DataManage/UpdateCity.aspx" target="main_right">&nbsp;城市控件数据更新</a></li>
                            <li><a href="DataManage/UpdateAirPort.aspx" target="main_right">&nbsp;机场信息数据更新</a></li>
                            <li><a href="DataManage/UpdateFromCity.aspx" target="main_right">&nbsp;出发地数据更新</a></li>
                            <li><a href="DataManage/UpdateToCity.aspx" target="main_right">&nbsp;目的地数据更新</a></li>
                            <li><a href="DataManage/UpdateAirLine.aspx" target="main_right">&nbsp;航空公司数据更新</a></li>
                            <li><a href="DataManage/UpdateToSiteMap.aspx" target="main_right">&nbsp;SiteMap网站地图</a></li>
                        </ul>
                    </div>
                    </asp:Panel>
                    <!--<div class="guidecollapse" onclick="Switch(this)">
                        HTML首页生成</div>
                    <div class="guide" style="display:none">
                        <ul>
                            <li><a href="cms/index_html.aspx" target="main_right">&nbsp;Html首页生成</a></li>
                        </ul>
                    </div>
                    <div class="guidecollapse" onclick="Switch(this)">
                        HTML模版管理</div>
                    <div class="guide" style="display:none">
                        <ul>
                            <li><a href="cms/templet_list.aspx" target="main_right">&nbsp;Html模版列表</a></li>
                        </ul>
                    </div>-->
                </div>
            </li>
            <li id="Guide_bottom"></li>
        </ul>
    </div>
</asp:Content>
