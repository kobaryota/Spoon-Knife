#############################################################
## H2O�᡼�����Υǡ��������ץ�������
## OVO/inputbox�ˤ���txt��newstar�ν���txt(header��)�ˤ�
## ��ŷ�Τ�dir�˰�ư������gnuplot�ǥ饤�ȥ����֤ȥ��ڥ��ȥ���
## �������롣�ޤ��ꥹ�ȸ����ι������Ԥ���
## cron��������Ū�����餻�뤳�Ȥ����ꡣ
## 1st version 2007/5/10 last update 2008/10/22 by K.Ueda
#############################################################
##dir��¤��ʣ���ʤΤǥե��ѥ����Ȥ�����û���Ѥ��褦������
###$Dinp = "/web/OVO/inputbox";
###$Dpgm = "/web/OVO/program";
###$Ddat = "/web/OVO/data";######### change these lines ! ##########


$Dperl = "/usr/bin/perl";			## Please input a directory of perl ##
$Dhtml = "/home/ryota/Desktop/OVO-AUTO/HTML";		## Please input a directory of html ##
$Dinp = "/home/ryota/Desktop/OVO-AUTO/inputbox";	## Please input a directory of inputbox ##
$Dpgm = "/home/ryota/Desktop/OVO-AUTO/program";	## Please input a directory of program ##
$Ddat = "/home/ryota/Desktop/OVO-AUTO/data";		## Please input a directory of data ##

##inputbox����txt���ɤ߹���
system("ls $Dinp/*IRK.txt > $Dpgm/newdata.lst");
open(IN,"$Dpgm/newdata.lst");
@file = <IN>;
chomp @file;
close(IN);

##inputbox����txt����ŷ�Τ�dir�˰�ư
foreach $files (@file){
###	$file = substr($file, 18);#########��change this line ! #########
###	$file = substr($file, 30);
	($maepass,$file) = split (/\/inputbox\//, $files);
	($name,$ushiro) = split (/\_K\_/, $file);
	system("mkdir -p $Ddat/$name/H2O/");
	system("mv $Dinp/$file $Ddat/$name/H2O/");
	
##�饤�ȥ����ֺ���
##��txt�κ��綯�٤��������դ���max.pl��ȴ���Ф���
##sort�ǻ��ֽ����¤١�plot�Ѥ�*sort.plt�����롣
##�ޤ��ƥץ��åȤ�SNR�ͤ�ź���뤿����*label.plt��������
##��SNR�Ϥ�����r.m.s.�򥨥顼�С��ˡ�
	system("ls $Ddat/$name/H2O/*IRK.txt > $name-junbi.txt");
	open(IN1,"$name-junbi.txt");
	@data = <IN1>;
	chomp @data;
	close(IN1);
	foreach $data (@data){
		open(OUT,">> $name-get.sh");
		print(OUT "$Dperl $Dpgm/max.pl $data\n");
		close(OUT);
	}
	system("sh $name-get.sh > $name-plot.txt");
	system("sort $name-plot.txt > $Ddat/$name/H2O/$name-sort.plt");
	system("rm -f $name-*");
	#system("$Dperl $Dpgm/makelabel.pl $Ddat/$name/H2O/$name-sort.plt");
	#system("mv label.plt $Ddat/$name/H2O/$name-label.plt");
##gnuplot.pl��plot�����뤿����sh���������¹ԡ�
	open(OUT0,">> plot.sh");
	print(OUT0 "$Dperl $Dpgm/LCgnuplotH2O.pl $Ddat/$name/H2O/$name-sort.plt\n");
	close(OUT0);
	system("sh plot.sh");
#	system("rm -f plot.sh");
	
##�ǿ��������ڥ��ȥ��ޤ��������롣
##�Ť��ǡ������ɲä��Ƥ��б��Ǥ����褦���ѹ�
	#system("ls $Ddat/$name/H2O/$name*IRK.txt | tail -1 > $name-new.txt");
	#open(IN2,"$name-new.txt");
	#$newtxt = <IN2>;
	#chomp $newtxt;
	#($getday) = split (/IRK/, $newtxt);
	#($pwd,$day) = split (/\_K\_/, $getday);
	#close(IN2);
	#system("$Dperl $Dpgm/txt2sp.pl $newtxt > $Ddat/$name/H2O/$name-newsp.plt");
	$filesp = $file;
	$filesp =~ s/txt/plt/;
	system("$Dperl $Dpgm/txt2sp.pl $Ddat/$name/H2O/$file > $Ddat/$name/H2O/$filesp");
	open(OUT2,">> plot2.sh");
	print(OUT2 "$Dperl $Dpgm/SPgnuplotH2O.pl $Ddat/$name/H2O/$filesp\n");
	close(OUT2);
	system("sh plot2.sh");
	system("ls $Ddat/$name/H2O/$name\_20*.png | tail -1 > $name-new.txt");
	open(IN2,"$name-new.txt");
	$newpng = <IN2>;
	chomp $newpng;
	close(IN2);
	system("cp $newpng $Ddat/$name/H2O/$name-sp.png");
	system("ls -r $Ddat/$name/H2O/$name\_20*.png > $Ddat/$name/H2O/$name\_allsp.lst");
	system("ls -r $Ddat/$name/H2O/$name\_K*IRK.txt > $Ddat/$name/H2O/$name\_alltxt.lst");
	system("rm -f plot2.sh");
	system("rm -f $name-new.txt");
}
###system("$Dperl $Dpgm/makelistH2O.pl > /web/OVO/H2Omaser.html");####change this line !###
system("$Dperl $Dpgm/makelistH2O.pl > $Dhtml/H2Omaser.html");
