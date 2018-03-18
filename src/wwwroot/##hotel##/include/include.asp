<%
function strDv(strDate)
	Select Case strDate
		Case "01"
			check = "申请" 
		case "02"
			check = "关闭" 
		case "03"
			check = "多房" 
		case "04"
			check = "满房" 
		case "05"
			check = "紧张" 
	end Select
	strDv = check
end function

Function Format_Time(s_Time, n_Flag) 
	Dim y, m, d, h, mi, s 
	Format_Time = "" 
	If IsDate(s_Time) = False Then Exit Function 
	y = cstr(year(s_Time)) 
	m = cstr(month(s_Time)) 
	If len(m) = 1 Then m = "0" & m 
	d = cstr(day(s_Time)) 
	If len(d) = 1 Then d = "0" & d 
	h = cstr(hour(s_Time)) 
	If len(h) = 1 Then h = "0" & h 
	mi = cstr(minute(s_Time)) 
	If len(mi) = 1 Then mi = "0" & mi 
	s = cstr(second(s_Time)) 
	If len(s) = 1 Then s = "0" & s 
		Select Case n_Flag 
			Case 2 
			Format_Time = y & "-" & m & "-" & d 
		End Select 
End Function 
%>