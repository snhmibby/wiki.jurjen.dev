a:29:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:38:"Configuration files for vps.jurjen.dev";i:1;i:1;i:2;i:1;}i:2;i:1;}i:2;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:1;}i:2;i:1;}i:3;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1;}i:4;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:52:"Some of the basic configuration files for this host.";}i:2;i:54;}i:5;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:106;}i:6;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:109;}i:7;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:7:"rc.conf";i:1;i:2;i:2;i:109;}i:2;i:109;}i:8;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:109;}i:9;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:374:"
hostname="vps.jurjen.dev"

#ip
defaultrouter="31.14.96.1"
ifconfig_vtnet0="inet 31.14.96.52 netmask 0xffffff00"

#ipv6
ipv6_defaultrouter="2a01:7c8:bb01::1"
ifconfig_vtnet0_ipv6="inet6 2a01:7c8:bb01:70a:5054:ff:fea4:889f/48"

pf_enable="YES"
pflog_enable="YES"
pf_rules="/etc/pf.firewall"

#
# servers
#
#TODO
sendmail_enable="NONE"
sshd_enable="YES"
lighttpd_enable="YES"
";i:1;s:2:"sh";i:2;s:7:"rc.conf";}i:2;i:135;}i:10;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:530;}i:11;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"firewall";i:1;i:2;i:2;i:530;}i:2;i:530;}i:12;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:530;}i:13;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:530;}i:14;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:191:"I wasn't sure which icmp6 is needed or not, so just allow all.
I think besides the list here, at least the icmps for neighbor discovery and auto-configuration should be enabled in most cases.";}i:2;i:553;}i:15;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:750;}i:16;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:329:"
serves="{ ssh www https }"
icmp="{ echorep echoreq unreach }"
#icmp6="{ 1 2 3 128 129 }" #unreach, too big, time exceeded, echo request/reply

scrub in all
set skip on lo0

#pass quick all
block log all

pass inet proto icmp icmp-type $icmp
pass inet6 proto ipv6-icmp

pass in proto tcp to port $serves
pass out all keep state

";i:1;s:2:"pf";i:2;s:11:"pf.firewall";}i:2;i:750;}i:17;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:1105;}i:18;a:3:{i:0;s:6:"header";i:1;a:3:{i:0;s:8:"Lighttpd";i:1;i:2;i:2;i:1105;}i:2;i:1105;}i:19;a:3:{i:0;s:12:"section_open";i:1;a:1:{i:0;i:2;}i:2;i:1105;}i:20;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:1105;}i:21;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:7:"Serves ";}i:2;i:1127;}i:22;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:22:"https://www.jurjen.dev";i:1;N;}i:2;i:1134;}i:23;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:5:" and ";}i:2;i:1160;}i:24;a:3:{i:0;s:12:"externallink";i:1;a:2:{i:0;s:23:"https://wiki.jurjen.dev";i:1;N;}i:2;i:1165;}i:25;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:1192;}i:26;a:3:{i:0;s:4:"file";i:1;a:3:{i:0;s:1670:"
#std settings
var.log_root    = "/var/log/lighttpd"
var.server_root = "/usr/local/www/"
var.state_dir   = "/var/run"
var.home_dir    = "/var/run/lighttpd"
var.conf_dir    = "/usr/local/etc/lighttpd"

server.username  = "www"
server.groupname = "www"

#include files
include "conf.d/mime.conf"
include "conf.d/access_log.conf"

server.modules += (
	"mod_fastcgi",
	"mod_rewrite",
	"mod_auth",
	"mod_access",
	"mod_openssl",
)

static-file.exclude-extensions = ( ".fcgi", ".php", "~", ".inc")
index-file.names += (
  "index.xhtml", "index.html", "index.htm", "default.htm", "index.php"
)

#default server
server.document-root = "/usr/local/www" + "/jurjen.dev"
server.pid-file = state_dir + "/lighttpd.pid"
server.errorlog = log_root + "/error.log"
server.name = "www.jurjen.dev"
server.bind = "0.0.0.0"
server.use-ipv6 = "enable"

$HTTP["url"] =~ "/\..+/" {
	url.access-deny = ("")
}


#ssl
ssl.pemfile = "/usr/local/etc/letsencrypt/live/jurjen.dev/fullchain.pem"
ssl.privkey = "/usr/local/etc/letsencrypt/live/jurjen.dev/privkey.pem"
$SERVER["socket"] == "0.0.0.0:443" { ssl.engine = "enable" }
$SERVER["socket"] ==   "[::]:443"  { ssl.engine = "enable" }

#personal notes wiki
$HTTP["host"] =~ "wiki.jurjen.dev" {
	server.document-root = "/usr/local/www/dokuwiki"
	accesslog.filename = log_root + "/wiki.access.log"
	server.errorlog = log_root + "/wiki.error.log"

	fastcgi.server = ( ".php" => ((
		"bin-path" => "/usr/local/bin/php-cgi",
		"socket" => "/tmp/dokuwiki.php.socket"
		))
	)

	#block sensitive directories
	$HTTP["url"] =~ "^/(bin|data|inc|conf|vendor)/.+" {
		url.access-deny = ( "" )
	}

	$HTTP["url"] =~ "/(\.|_)ht" {
		url.access-deny = ( "" )
	}
}

";i:1;s:3:"lua";i:2;s:13:"lighttpd.conf";}i:2;i:1199;}i:27;a:3:{i:0;s:13:"section_close";i:1;a:0:{}i:2;i:2896;}i:28;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:2896;}}