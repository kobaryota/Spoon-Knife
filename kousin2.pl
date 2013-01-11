$Dnew = "/home/ryota/Desktop/OVO-AUTO/singledata";		#新しいsingleのデータ
$OVOAUTO = "/home/ryota/Desktop/OVO-AUTO";		#OVO-AUTO
$Dlst = "/home/ryota/Desktop/OVO-AUTO/list/";

system("ls /home/ryota/Desktop/OVO-AUTO/singledata/ > $Dlst/newsinList.txt");
system("cat $Dlst/newsinList.txt >> $Dlst/oldsinList.txt");
system("sort $Dlst/oldsinList.txt | uniq -u > $Dlst/single.txt");	#前回のデータと新しいデータの差を表示

open(IN, "$Dlst/single.txt");
@file = <IN>;
chomp @file;
close(IN);

foreach $name (@file){
	system("cp $Dnew/$name $OVOAUTO/kousin/\n");	#新しいデータを別のdirに移動
}

system("ls $OVOAUTO/singledata > $Dlst/oldsinList.txt");	#新しいデータに置き換える
