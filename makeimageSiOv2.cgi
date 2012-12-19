#!/usr/bin/perl
print "Content-type: text/html; charset=euc-jp";
print "Content-type: image/png\n\n";

##last update 2008/09/22
##can't use [system] in cgi??

use CGI qw(param);
$object = param('object');
chomp $object;
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
print "<title>All v=2 Spectrum of $object</title></head>\n";
print "<body>\n";
print "<h2>All v=2 Spectrum of $object</h2>\n";
open(IN,"cat ~ovo/Sites/data/$object/SiO/v2/$object\_allsp.lst|");
while($sp = <IN>){
	chomp $sp;
	#substr($sp, 0, 4) = "../..";
	substr($sp, 0, 8) = "http://milkyway.sci.kagoshima-u.ac.jp/~ovo";
	print "<img alt=\"$sp\" src=\"$sp\"><br>\n";
}
print  "</body>\n";
print  "</html>\n";
