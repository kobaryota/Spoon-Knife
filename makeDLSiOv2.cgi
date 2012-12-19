#!/usr/bin/perl
print "Content-type: text/html; charset=euc-jp";
print "Content-type: image/png\n\n";

##$objectの天体の全textを表示するHTMLを作成
##2008/08/28
##can't use [system] in cgi??

#linkからのvalueを$objectに格納
use CGI qw(param);
$object = param('object');
chomp $object;
#cgiを介するとなぜか+が消えるのでIRASに+を付加
if($object =~ /IRAS/){
	#print "$object\n";
	$space = substr($object, 9, 1);
	#print "$space\n";
        if($space =~ /\s/){
		substr($object, 9, 1) = "\+";
	        $object =~ s/\s//g;
        }else{
		$object =~ s/\s//g;
	}
}
print "<html>\n";
print "<head>\n";
print "<title>All Text Data of $object</title></head>\n";
print "<body>\n";
print "<h2>All Text Data of $object</h2>\n";
#system("ls ../../OVO/data/$object/H2O/$object\_200*.png > ../../OVO/data/$object/H2O/allsp.lst");
open(IN,"../../OVO/data/$object/SiO/v2/$object\_alltxt.lst");
while($sp = <IN>){
	chomp $sp;
	($pass,$nokori)=split(/\_Qv2\_/,$sp);
	($day,$ushiro)=split(/MIZ/,$nokori);
	$sp =~ s/\/web/http:\/\/astro.sci.kagoshima-u.ac.jp/;
	print "$day<br><a href=\"$sp\">$sp</a><br>\n";
	#print "<img alt=\"$sp\" src=\"$sp\"><br>\n";
}
print  "</body>\n";
print  "</html>\n";
