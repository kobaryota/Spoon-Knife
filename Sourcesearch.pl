#!/usr/local/bin/perl

$Dnon = "/home/ryota/Desktop/OVO-AUTO/future/nonhit";
$Dinp = "/home/ryota/Desktop/OVO-AUTO/inputbox";
$Dprg = "/home/ryota/Desktop/OVO-AUTO/program";
$Doub = "/home/ryota/Desktop/OVO-AUTO/future/double";
$Dlist = "/home/ryota/Desktop/OVO-AUTO/list";
$DnonS = "/home/ryota/Desktop/OVO-AUTO/future/nonSource";

system("ls $Dinp/*.txt > $Dprg/sample2.txt");
$band = "\_K\_";
$no = 0;
open(IN,"$Dprg/sample2.txt");					#解析結果txtの一覧を読み込む。
while ($line = <IN>)  {
	chomp $line;
	($kou,$data) = split (/\/inputbox\//, $line);
	($name,$ushiro) = split (/\_K\_/, $data);	#_K_の前後で分ける。
	$name =~ s/\+/\\\+/c;				#+が上手く認識されないため\を付ける。
	$ushiro =~ s/\*//;				#ファイル名の最後に*が付いている場合は消す。
	open(OUT,">> $Dprg/Sourcefuriwake.sh");
	open(IN3,"$Dlist/SourceList3.txt");
	while ($pattern = <IN3>){
		chomp $pattern;
		if($pattern =~ / $name,/i){		#スペースと,に囲まれた天体名を大小文字区別せず一覧と比較
			++$no;				#一致するものがあればnoに1を足す
		}
	}
	close(IN3);
	if($no == 0){				#一致するものが無い場合
		$name =~ s/\\//g;
                print(OUT "cp $Dinp/$name$band$ushiro $DnonS/$name$band$ushiro\n");
	}
	$no = 0;
}
close(OUT);
close(IN);
system("sh $Dprg/Sourcefuriwake.sh");
system("rm $Dprg/Sourcefuriwake.sh");
#system("rm $Dprg/sample2.txt");
