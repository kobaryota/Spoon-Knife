###�Ѵ�̾�������2�İʾ���פ����Τ����ä������б����Դ���
###sh�ե����������Ǥ��Ф��ơ��ܻ��ǧ��ɬ��
###����̵���ξ��ϡ�nohit�˰�ư�����Τǳ�ǧ�����Ѵ�̾�����򽼼¤�����
#!/usr/bin/perl

$Dnon = "/home/ryota/Desktop/OVO-AUTO/future/nonhit";
$Dkousin = "/home/ryota/Desktop/OVO-AUTO/kousindata";
$Dprg = "/home/ryota/Desktop/OVO-AUTO/program";
$Doub = "/home/ryota/Desktop/OVO-AUTO//future/double";

system("ls $Dkousin/*.txt > $Dprg/sample.txt");
$band = "\_K\_";
$no = 0;
open(IN,"$Dprg/sample.txt");					#���Ϸ��txt�ΰ������ɤ߹��ࡣ
while ($line = <IN>)  {
	chomp $line;
	($kou,$data) = split (/\/kousindata\//, $line);
	($name,$ushiro) = split (/\_K\_/, $data);	#_K_�������ʬ���롣
	$name =~ s/\+/\\\+/c;				#+����꤯ǧ������ʤ�����\���դ��롣
	$ushiro =~ s/\*//;				#�ե�����̾�κǸ��*���դ��Ƥ�����Ͼä���
	open(OUT,">> /home/ryota/Desktop/OVO-AUTO/program/furiwake.sh");
	open(IN2,"/home/ryota/Desktop/OVO-AUTO/program/allrename.txt");#�Ѵ�̾�������ɤ߹��ࡣ
	while ($pattern = <IN2>){
		chomp $pattern;
		if($pattern =~ / $name,/i){		#���ڡ�����,�˰Ϥޤ줿ŷ��̾���羮ʸ�����̤������������
			++$no;				#���פ����Τ������no��1��­��
			if($no == 1){			#no��1���Ĥޤ���פ�����Τ�1�Ĥʤ�
				($real,$two) = split (/,\s/,$pattern);
				$name =~ s/\\//g;	#+��ǧ�������뤿���\��ä�
				$real =~ s/ //;		
				print (OUT "cp $Dkousin/$name$band$ushiro $Dkousin/$real$band$ushiro\n");		#�ե�����̾�Ѵ�
				print (OUT "mv $Dkousin/$real$band$ushiro \/home\/ryota\/Desktop\/OVO-AUTO\/inputbox\/\n");	#inputbox��copy
			}
			if($no >= 2){
				print (OUT "cp $Dkousin/$name$band$ushiro $Doub/$name$band$ushiro\n");
			}	
		}
	}
	close(IN2);
	if($no == 0){				#���פ����Τ�̵�����
		$name =~ s/\\//g;
		print (OUT "mv $Dkousin/$name$band$ushiro $Dnon\n");	#nohit�Ȥ���dir��ž��
	}
	$no = 0;
}
close(OUT);
close(IN);
system("sh /home/ryota/Desktop/OVO-AUTO/program/furiwake.sh");
#system("rm $Dprg/sample.txt");
system("rm /home/ryota/Desktop/OVO-AUTO/program/furiwake.sh");
system("rm $Dkousin/*.txt");
