a:16:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:26:"Use git to store your site";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:95:"You can use git to easily pull your website onto the server and work on it on another computer.";}i:2;i:43;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:138;}i:6;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:138;}i:7;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:99:"It shouldn't matter, but for ease of mind,be sure to block the .git directory in lighttpd, like so:";}i:2;i:140;}i:8;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:245;}i:9;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:58:"
$HTTP["url"] =~ "/\.git/" {
    url.access-deny = ("")
}
";i:1;N;i:2;N;}i:2;i:245;}i:10;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:245;}i:11;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:53:"Or, just block access to any hidden directory like so";}i:2;i:313;}i:12;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:372;}i:13;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:57:"
$HTTP["url"] =~ "/\..+/" {
    url.access-deny = ("")
}
";i:1;N;i:2;N;}i:2;i:372;}i:14;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:437;}i:15;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:437;}}