<%
set conn=server.createobject("ADODB.CONNECTION")
connstr = "provider=sqloledb;" & _
"driver={SQL SERVER};" & _
"server=(local);" & _        
"uid=Fei580_dataUser;" & _               
"pwd=fei580WWW_123456;" & _             
"database=Fei580_data;"
conn.Open connstr
%>
