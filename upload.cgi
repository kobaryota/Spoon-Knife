#!/usr/bin/perl -

use CGI;
use File::Copy;
use File::Basename;

my $q = new CGI;

my $fname = basename($q->param('filename'));
my $path = "/home/ryota/Desktop/OVO-AUTO/CGI";
#my $path = ".";
my $newfile = "$path/$fname";

my $fh = $q->upload('filename');
copy ($fh, "$newfile");
close($fh);

print "Content-type:text/html\n\n";
print "<html><body>\n";
print "upload $fname.\n";
print "</body></html>\n";
print "Location: /home/ryota/Desktop/OVO-AUTO/HTML/top.html\n\n";

exit;
