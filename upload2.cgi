#!/usr/local/bin/perl -w

# モジュール読み込み
use strict;
use CGI;

my ($buffer);

# オブジェクト作成
my $query = new CGI;

# ファイル取得
my $fH = $query->upload('filename');

# MIMEタイプ取得
my $mimetype = $query->uploadInfo($fH)->{'Content-Type'};

# ファイル保存
open (OUT, ">Savefile") || die "Can't open Savefile!";
binmode (OUT);
while(read($fH, $buffer, 1024)){
    print OUT $buffer;
}
close (OUT);
close ($fH) if ($CGI::OS ne 'UNIX'); # Windowsプラットフォーム用
chmod (0666, "Savefile");

# HTML出力
print $query->header(-charset=>'Shift_JIS'),
      $query->start_html(-lang=>'ja', -encoding=>'Shift_JIS', -title=>'upload2.cgi');

print <<"HTML_VIEW";
<h1>ファイルアップロード</h1>
<ul>
  <li>ファイル名：$fH</li>
  <li>MIMEタイプ：$mimetype</li>
</ul>
<p>ファイルのアップロードが完了しました。</p>
HTML_VIEW

print $query->end_html;
exit;
