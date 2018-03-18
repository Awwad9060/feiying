<!--<?php require '../public.php'; ?>-->
<?php require '../header.php'; ?> 
<meta http-equiv="refresh" content="0;url='http://www.fei580.com/searchTicket.aspx?fromcity=5&tocityName=法兰克福&tripType=2&tripDate=<?php echo  date("Y-m-d",strtotime("+1 days"));?>&backDate=<?php echo  date("Y-m-d",strtotime("+1 week"));?><?php echo $parurl; ?>';">
<title>正在查询机票，请稍候...</title>
<?php require '../headsc.php'; ?> 
</head>
<body onLoad="parent.location='http://www.fei580.com/searchTicket.aspx?fromcity=5&tocityName=法兰克福&tripType=2&tripDate=<?php echo  date("Y-m-d",strtotime("+1 days"));?>&backDate=<?php echo  date("Y-m-d",strtotime("+1 week"));?><?php echo $parurl; ?>'">
<?php the_content(); ?> 
<?php require '../footer.php'; ?>