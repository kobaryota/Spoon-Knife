#!/usr/bin/perl
use CGI;
$query = new CGI;

print "Content-type: text/plain\n\n";

$filename = $query->param('postfile');
$type = $query->uploadInfo($filename)->{'Content-Type'};

print "You transfer [$filename].\n\n";

if ($type =~ /^text\//) {
	while (<$filename>) {
#		print $_;
		open(OUT,">> /web/OVO/testupload/$filename");
		print(OUT "$_");
		close(OUT);
	}
} else {
	print "このファイルはテキストではないので表示できません。\n";
}
