a:9:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:26:"Force fetchmail to use tls";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:78:"Here is how to get your mail securely with fetchmail and pipe it into procmail";}i:2;i:43;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:127;}i:6;a:3:{i:0;s:4:"code";i:1;a:3:{i:0;s:164:"
poll mail.example.com proto pop3:
   user "user@example.com"
   password "supersecret"
   ssl sslcertck sslproto "tls1.2+"
   mda "/usr/bin/procmail -f %F -d %T";
";i:1;N;i:2;N;}i:2;i:127;}i:7;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:301;}i:8;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:301;}}