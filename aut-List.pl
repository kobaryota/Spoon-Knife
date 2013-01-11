#!/usr/local/bin/perl

system("cat /home/ryota/Desktop/OVO-AUTO/list/SourceList-draft.txt >> /home/ryota/Desktop/OVO-AUTO/list/SourceList5.txt");
system("sort /home/ryota/Desktop/OVO-AUTO/list/SourceList5.txt | uniq > /home/ryota/Desktop/OVO-AUTO/list/SourceList.txt");
system("cat /home/ryota/Desktop/OVO-AUTO/program/allrename-draft.txt >> /home/ryota/Desktop/OVO-AUTO/program/allrename2.txt");
system("sort /home/ryota/Desktop/OVO-AUTO/program/allrename2.txt | uniq > /home/ryota/Desktop/OVO-AUTO/list/allrename.txt");
system("cat /home/ryota/Desktop/OVO-AUTO/list/NameList-draft.txt >> /home/ryota/Desktop/OVO-AUTO/list/NameList2.txt");
system("sort /home/ryota/Desktop/OVO-AUTO/list/NameList2.txt | uniq > /home/ryota/Desktop/OVO-AUTO/list/NmaList.txt");
