#!/usr/local/bin/perl

$Ddat = "/home/ryota/Desktop/OVO-AUTO/HTML/data";		## Please input a directory of data ##
$Dlist = "/home/ryota/Desktop/OVO-AUTO/list";		## Please input a directory of list ##
$Dcgi = "http://192.168.24.53/cgi-bin";	## Please input a directory of cgi ##

print "<html>\n";
print "<head>\n";
print "<title>H2O maser Observation @ IRK</title>\n</head>\n";
print "<body>\n";
print "<h2>VERA SingleDish Observation Current Result<br>H2O maser @ IRIKI station</h2>\n";

open(IN,"$Dlist/sort-SourceList.txt");
@basic = <IN>;
chomp @basic;
close(IN);

print "<table border=\"7\" cellspacing=\"1\" cellpadding=\"5\" align=\"center\">\n";
print "<div align=right><font color=red>*</font>Detect:Yes!>=5&#963; No<5&#963;</div>\n";
print "<tr><td bgcolor=\"pink\" align=\"center\">name1</td><td bgcolor=\"pink\" align=\"center\">name2</td><td bgcolor=\"pink\" align=\"center\" width=\"50\">R.A.<br>H</td><td bgcolor=\"pink\" align=\"center\"><br>M</td><td bgcolor=\"pink\" align=\"center\">(J2000)<br>S</td><td bgcolor=\"pink\" align=\"center\">Dec.<br>D</td><td bgcolor=\"pink\" align=\"center\"><br>M</td><td bgcolor=\"pink\" align=\"center\">(J2000)<br>S</td><td bgcolor=\"pink\" align=\"center\">Current<br>Obs. Date</td><td bgcolor=\"pink\" align=\"center\"><br>Flux(Jy)</td><td bgcolor=\"pink\" align=\"center\"><br>Detect(&#963;)<font color=red>*</font></td></tr>\n";
foreach $basic (@basic){
	($b1,$b2,$b3,$b4,$b5,$b6,$b7,$b8,$b9) = split (/\s+/, $basic);
	$b25 = $b1;
	if($b25 =~ /IRAS/){
		substr($b25, 4, 0) = " ";
	}

		print "<tr><td><a href=\"$Dcgi/makepage2.cgi?object=$b25\">$b1</a></td><td>$b2</td><td>$b3</td><td>$b4</td><td>$b5</td><td>$b6</td><td>$b7</td><td>$b8</td>";


system("tail -1 $Ddat/$b1/H2O/$b1-sort.plt > $b1-newobs.txt");
		open(IN2,"$b1-newobs.txt");
		@obs = <IN2>;
		chomp @obs;
		close(IN2);
		foreach $obs (@obs){
			($o1,$o2,$o3) = split (/\s+/, $obs);
			$sigma = $o2/$o3/2;
			$o2 =sprintf("%.2f", $o2*20);
			print "<td>$o1</td><td>$o2</td>";
			if($sigma >= 5){
				$sigma=sprintf("%.1f",$sigma);
				print "<td><font color=orange>Yes!</font>($sigma)</td>";
			}else{
				$sigma=sprintf("%.1f",$sigma);
				print "<td>No($sigma)</td>";
			}
		}
		print "</tr>\n";
}
print "</table>\n";
system("rm -f *newobs.txt\n");

print  "</body>\n";
print  "</html>\n";
