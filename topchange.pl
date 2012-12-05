#!/usr/bin/perl
$Dtop = "/home/ryota/Desktop/OVO-AUTO/HTML";

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
$year += 1900;
$mon += 1;
##print "$year年$mon月$mday日\n";

open(IN, "> $Dtop/toprei.html");
print (IN "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">
<html>
<head>
	<META http-equiv=\"Content-Type\" content=\"text/html; charset=EUC_JP\">
	<META http-equiv=\"Content-Style-Type\" content=\"text/css\">
	<title>Data Base @ Shiozaki's Storage</title>
	<!--2008.05.20 open-->
</head>
<body>
	<p align=center><i><font size=8>OVO</font> Ver.6.3</i><br>
	<font size=5>Omodaka laboratory Virtual Observatory</font></p>
	<p>Thank you for your visiting.<br>
	This is database of Omodaka Laboratory at Kagoshima University.<br>
	This database is under construction.</p>
	<p>Ovo means egg in Latin.<br>
	I hope you will create so many many study result from OVO.</p>
	<p><font color=red>~ information ~</font><br>
	<table border=1>
		<tr><td>OVO contains on $year/$mon/$mday</td><td>*</td><td>maser</td><td>upload data</td></tr>
		<tr><td>Registration data : 1674 objects</td><td>*</td><td>H2O</td><td>2005/07 - $year/$mon/$mday</td></tr>
		<tr><td>Observation data : 674 objects</td><td>*</td><td>SiO(J=1-0,v=1)</td><td>2005/05 - 2008/08</td></tr>
		<tr><td>Frequency band : 22GHz,43GHz</td><td>*</td><td>SiO(J=1-0,v=2)</td><td>2005/05 - 2008/08</td></tr>
	</table></p>
	<form><font color=red>~ what's New? ~</font><br>
	<select size=8>
		<option>$year/$mon/$mday add data of H2O maser @ $year/$mon/$mday
	</select></form>
	<!-- <p>If you use this database, please attend to following items.<br>
	<br>
	Case of retrieving Identifier :<br>
	<ul>
		<li>Use a space bitween 'IRAS,IRC' and following numbers.</li>
		[IRAS00050-2546] &#8594; [IRAS 00050-2546]<br>
		<li>Don't use hyphen'-' as a space for GCVS name.</li>
		[TY-Cas] &#8594; [TY Cas]<br>
	</ul>
	Case of retrieving coordinate :<br>
	<ul><li>Wait a moment.</li></ul>
	</p> -->
<!---	<p>Contact us :<br>
	mail to shiozaki(at)milkyway.sci.kagoshima-u.ac.jp</p>
---!>
	<hr>
	<p align=right>Copyright (C) 2008 Omodaka Laboratory. All rights reserved.</p>
</body>
</html>\n");
close(IN);
