#!/usr/local/bin/perl

use strict;
use warnings;

my $list_name = "/home/ryota/Desktop/OVO-AUTO/list/SourceList.txt";
chomp($list_name);
&error_scalar($list_name);
open(IN1,"$list_name");
my @unsortlist = <IN1>;
close(IN1);

@unsortlist = map {$_->[0]}
sort {$a->[3] <=> $b->[3] or $a->[4] <=> $b->[4] or $a->[5] <=> $b->[5] }
map {[$_, split / /]} @unsortlist;
	     
open OUT1,">", "/home/ryota/Desktop/OVO-AUTO/list/sort-SourceList.txt";
print OUT1 @unsortlist;
close(OUT1);

# 引数が存在しなかった場合にプログラムを終了するサブプロシージャー
sub error_scalar{
	my $scalar = $_[0];
	# 引数が存在しなかった場合にプログラムを終了
	$scalar = shift;
	die "$!" unless $scalar;
}
