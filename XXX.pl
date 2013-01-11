#!/usr/local/bin/perl

$Dlist = "/home/ryota/Desktop/OVO-AUTO/list";
open(IN2, "$Dlist/SourceList.txt");
	@Source = <IN2>;
	chomp @Source;
	open(IN3,"> $Dlist/SourceList3.txt");
	foreach $Source (@Source) {
	($name1,$name2,$a,$b,$c,$d,$e,$f,$g) = split (/\s+/, $Source);
	print(IN3 " $name1, $name2\n");
	}
	close(IN2);
	close(IN3);
