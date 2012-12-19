#!/usr/bin/perl
$Dtop = "/home/ryota/Desktop/OVO-AUTO/HTML";

($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
$year += 1900;
$mon += 1;
##print "$year年$mon月$mday日\n";

open(IN, "> $Dtop/ovo.html");
print (IN "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">
<html>
<head>
	<META http-equiv=\"Content-Type\" content=\"text/html; charset=EUC_JP\">
	<META http-equiv=\"Content-Style-Type\" content=\"text/css\">
	<title>ovotopページ</title>
	<!--2012.12.20 open-->
</head>
<body bgcolor=\"aliceblue\" vlink=\"darkred\" alink=\"blueviolet\">
<div align=\"center\"> 
<font size=\"8\">ovo</font>
<font color=\"#800000\">
<address>
<br><font size=\"4\">Omodaka laboratory Virtual Observatory</font></font>
</address>
</div>
<hr size=\"3\">
<font size=\"4\">
<br><br><br>Thank you for your visiting.<br>
This is database of Omodaka Laboratory at Kagoshima University.<br>
This database is under construction.<br>
<br>
Ovo means egg in Latin.<br>
I hope you will create so many many study result from OVO.<br>
</font>

<p><font color=red>~ information ~</font><br>
	<table border=\"1\">
		<tr><td>OVO contains on $year/$mon/$mday</td><td>*</td><td>maser</td><td>upload data</td></tr>
		<tr><td>Registration data : 1674 objects</td><td>*</td><td>H2O</td><td>2005/07 - $year/$mon/$mday</td></tr>
		<tr><td>Observation data : 674 objects</td><td>*</td><td>SiO(J=1-0,v=1)</td><td>2005/05 - 2008/08</td></tr>
		<tr><td>Frequency band : 22GHz,43GHz</td><td>*</td><td>SiO(J=1-0,v=2)</td><td>2005/05 - 2008/08</td></tr>
	</table></p>
	<form><font color=red>~ what's New? ~</font><br>
	<form size=\"1\">
		<option>$year/$mon/$mday add data of H2O maser @ $year/$mon/$mday
	</form></form>

<br><br><hr size=\"1\">
<br><br>

</font>
</body>
</html>\n");
close(IN);
