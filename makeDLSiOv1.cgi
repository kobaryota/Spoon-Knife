#!/usr/bin/perl
print "Content-type: text/html; charset=euc-jp";
print "Content-type: image/png\n\n";

##$object��ŷ�Τ���text��ɽ������HTML�����
##2008/08/28
##can't use [system] in cgi??

#link�����value��$object�˳�Ǽ
use CGI qw(param);
$object = param('object');
chomp $object;
#cgi��𤹤�Ȥʤ���+���ä���Τ�IRAS��+���ղ�
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
open(IN,"../../OVO/data/$object/SiO/v1/$object\_alltxt.lst");
while($sp = <IN>){
	chomp $sp;
	($pass,$nokori)=split(/\_Qv1\_/,$sp);
	($day,$ushiro)=split(/MIZ/,$nokori);
	$sp =~ s/\/web/http:\/\/astro.sci.kagoshima-u.ac.jp/;
	print "$day<br><a href=\"$sp\">$sp</a><br>\n";
	#print "<img alt=\"$sp\" src=\"$sp\"><br>\n";
}
print  "</body>\n";
print  "</html>\n";
