$Ddat = "/home/ryota/Desktop/OVO-AUTO/HTML/data";			

open(IN0,"@ARGV[0]");
$file = @ARGV[0];
($mae,$file2)=split(/H2O/,$file);
($name,$ushiro)=split(/-sort/,$file2);
close(IN0);


$gnuplot = '/usr/local/bin/gnuplot -persist';
&make_gnuplot;
open(GNUPLOT,"|".$gnuplot);

foreach $k (0..$#plot){print GNUPLOT $plot[$k];}

sub make_gnuplot{
	$k=0;
	$plot[$k++] = sprintf("set xdata time\n");
	$plot[$k++] = sprintf("set timefmt \"%Y\/%m\/%d\"\n");
	$plot[$k++] = sprintf("set xlabel \"time[YY/MM]\"\n");
	$plot[$k++] = sprintf("set format x \"%y\/%m\"\n");
	$plot[$k++] = sprintf("set ylabel \"Intensity[K]\"\n");
	$plot[$k++] = sprintf("set title \"H2O maser's Light Curve\"\n");
	$plot[$k++] = sprintf("set key outside\n");
	$plot[$k++] = sprintf("set terminal png\n");
	$plot[$k++] = sprintf("set output '$Ddat/$name/H2O/$name-lc.png'\n");
	$plot[$k++] = sprintf("plot \"$file\" u 1:2 ti \"\" w lp, \"$file\" u 1:2:3 ti \"\" w er\n");
	$plot[$k++] = sprintf("set output\n");
}
