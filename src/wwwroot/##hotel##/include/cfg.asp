<%
Function BytesToBstr(body,Cset)
dim objstream
set objstream = Server.CreateObject("adodb.stream")
objstream.Type = 1
objstream.Mode =3
objstream.Open
objstream.Write body
objstream.Position = 0
objstream.Type = 2
objstream.Charset = Cset
BytesToBstr = objstream.ReadText 
objstream.Close
set objstream = nothing
End Function 
cUser="fei580com"       '�˴����������ʻ�
cPwd="23864c32116988eb496aadc218744163"       '�˴����������ʻ�����
set http = Server.CreateObject("Microsoft.XMLHTTP")
PostUrl = "http://www.eiyang.com/Services/hotelServer.asp?cUser="&cUser&"&cPwd="&cPwd&""
Http.Open "GET", PostUrl,false
Http.Send
getHTTPPage=bytesToBSTR(Http.responseBody,"GB2312")
set http=nothing

Pimdb = split(getHTTPPage,"|")
Pimdb = split(getHTTPPage,"|")

function getCity(cityCode)
	set rs = server.CreateObject("adodb.recordset")
	sql = "select shang_ma,replace from city_name where shang_ma ='" & cityCode & "'"
	rs.open sql,conn,1,1
	getCity = ""
	if not rs.eof then
		getCity = trim(rs("replace"))
	end if
	rs.close
	set rs = nothing
end function


'���ڸ�ʽ��
Function Breakfast(DataZC) 
	select case DataZC 
		case 0 
		Breakfast = "����"
		case 1
		Breakfast = "����"
		case 2
		Breakfast = "˫��"
	end select
End Function 


'���˷Ƿ�����
Function KillKey(Kill)
    Set ra = New RegExp
    ra.IgnoreCase = True
    ra.Global = True
    ra.Pattern = "[~!@#\$%\^&*()_+\}\{L\"&Chr(34)&"\?><-=\]\["&Chr(39)&";\.\/,\\]"
    KillKey= ra.replace(Kill,"")
End Function
%>