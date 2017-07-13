### ~/.bash_aliases

# my personal collection of aliases 
## turn the trackpad off or on 
alias trackoff='synclient TouchpadOff=1'
alias trackon='synclient TouchpadOff=0'

## sublime is that badass text editor
alias sublime='/usr/local/sublime_text_3/sublime_text'

# 2017-06-22 rca 
# changelog - update log of changes, automatically create daily file and 
# insert timestamp 
alias changelog='echo `date +%Y-%m-%d%t%T; whoami ` >> ~/changelog/`date +%Y-%m-%d `.txt;vi + ~/changelog/`date +%Y-%m-%d`.txt '

## handy other aliases 
## get rid of command not found ##
alias cd..='cd ..'
 
## a quick way to get up and out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## Colorize the grep command output for ease of use (good for log files)##
## it's relevant to note that these use the colorizing stuff in  /etc/profile.d
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Start calculator with math support
alias bc='bc -l'

# Generate sha1 digest
alias sha1='openssl sha1'

# Create parent directories on demand
alias mkdir='mkdir -pv'

# install  colordiff package :)
## look in /etc/colordiffrc
alias diff='colordiff'

# Make mount command output pretty and human readable format
alias mount='mount |column -t'

#8: Command short cuts to save time
# handy short cuts #
alias h='history'
alias j='jobs -l'

#9: Create a new set of commands

alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# Set vim as default
alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'


# Control output of networking tool called ping
# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'


# Show open ports
# Use netstat command to quickly list all TCP/UDP port on the server:
alias ports='netstat -tulanp'

#13: Wakeup sleeping servers

#Wake-on-LAN (WOL) is an Ethernet networking standard that allows a server 
# to be turned on by a network message. You can quickly wakeup nas devices 
# and server using the following aliases:

## replace mac with your actual server mac address #
##alias wakeupnas01='/usr/bin/wakeonlan 00:11:32:11:15:FC'
##alias wakeupnas02='/usr/bin/wakeonlan 00:11:32:11:15:FD'
##alias wakeupnas03='/usr/bin/wakeonlan 00:11:32:11:15:FE'


#14: Control firewall (iptables) output
# Netfilter is a host-based firewall for Linux operating systems. 
# It is included as part of the Linux distribution and it is activated 
# by default. This post list most common iptables solutions required by a 
# new Linux user to secure his or her Linux operating system from intruders.

## shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables'
# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist


# Debug web server / cdn problems with curl
# get web server headers #
alias header='curl -I'
 
# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress'

# Add safety nets

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'
 
# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
 
# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
 
#: Update RHEL / CentOS / Fedora Linux server

# yum command is a package management tool for RHEL / CentOS / Fedora Linux and friends:
### dnf has replaced yum in fedora 26 

## distro specifc RHEL/CentOS ##
alias update='sudo yum update'
alias updatey='sudo yum -y update'
alias yum='sudo yum'



#19: Tune sudo and su
# become root #
alias root='sudo -i'
alias su='sudo -i'

#20: Pass halt/reboot via sudo

# shutdown command bring the Linux / Unix system down:

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

# Control web servers

# also pass it via sudo so whoever is admin can reload it without calling you #
alias nginxreload='sudo /usr/local/nginx/sbin/nginx -s reload'
alias nginxtest='sudo /usr/local/nginx/sbin/nginx -t'
alias lightyload='sudo /etc/init.d/lighttpd reload'
alias lightytest='sudo /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf -t'
alias httpdreload='sudo /usr/sbin/apachectl -k graceful'
alias httpdtest='sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'


# Alias into our backup stuff


## play video files in a current directory ##
# cd ~/Download/movie-name
# playavi or vlc
alias playavi='mplayer *.avi'
alias vlc='vlc *.avi'
 
# play all music files from the current directory #
alias playwave='for i in *.wav; do mplayer "$i"; done'
alias playogg='for i in *.ogg; do mplayer "$i"; done'
alias playmp3='for i in *.mp3; do mplayer "$i"; done'
 
# play files from nas devices #
alias nplaywave='for i in /nas/multimedia/wave/*.wav; do mplayer "$i"; done'
alias nplayogg='for i in /nas/multimedia/ogg/*.ogg; do mplayer "$i"; done'
alias nplaymp3='for i in /nas/multimedia/mp3/*.mp3; do mplayer "$i"; done'
 
# shuffle mp3/ogg etc by default #
alias music='mplayer --shuffle *'

#24: Set default interfaces for sys admin related commands
# vnstat is console-based network traffic monitor. 
# dnstop is console tool to analyze DNS traffic. 
# tcptrack and iftop commands displays information about TCP/UDP connections it sees on a network interface and display bandwidth usage on an interface by host respectively.

## All of our servers eth1 is connected to the Internets via vlan / router etc  ##
alias dnstop='dnstop -l 5  eth1'
alias vnstat='vnstat -i eth1'
alias iftop='iftop -i eth1'
alias tcpdump='tcpdump -i eth1'
alias ethtool='ethtool eth1'
 
# work on wlan0 by default #
# Only useful for laptop as all servers are without wireless interface
alias iwconfig='iwconfig wlan0'

#25: Get system memory, cpu usage, and gpu memory info quickly
## pass options to free ##
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## Get server cpu info ##
alias cpuinfo='lscpu'
 
## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##
 
## get GPU ram on desktop / laptop##
##alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'


#26: Control Home Router

# The curl command can be used to reboot Linksys routers.

# Reboot my home Linksys WAG160N / WAG54 / WAG320 / WAG120N Router / Gateway from *nix.
alias rebootlinksys="curl -u 'admin:my-super-password' 'http://192.168.1.2/setup.cgi?todo=reboot'"
 
# Reboot tomato based Asus NT16 wireless bridge
alias reboottomato="ssh admin@192.168.1.1 /sbin/reboot"

#27 Resume wget by default
# The GNU Wget is a free utility for non-interactive download of files from 
# the Web. It supports HTTP, HTTPS, and FTP protocols, and it can resume 
# downloads too:
## this one saved by butt so many times ##
alias wget='wget -c'

# Use different browser for testing website
## this one saved by butt so many times ##
alias ff4='/opt/firefox4/firefox'
alias ff13='/opt/firefox13/firefox'
alias chrome='/opt/google/chrome/chrome'
alias opera='/opt/opera/opera'
 
#default ff
alias ff=ff13
 
#my default browser
alias browser=chrome

# A note about ssh alias
# Do not create ssh alias, instead use ~/.ssh/config OpenSSH SSH client 
# configuration files. It offers more option. An example:

# Host server10
#   Hostname 1.2.3.4
#   IdentityFile ~/backups/.ssh/id_dsa
#   user foobar
#   Port 30000
#   ForwardX11Trusted yes
#   TCPKeepAlive yes
# You can now connect to peer1 using the following syntax:
# $ ssh server10

# It’s your turn to share…

## set some other defaults ##
alias df='df -H'
alias du='du -ch'
 
# top is atop, just like vi is vim
##alias top='atop'
 
## nfsrestart  - must be root  ##
## refresh nfs mount / cache etc for Apache ##
###alias nfsrestart='sync && sleep 2 && /etc/init.d/httpd stop && umount netapp2:/exports/http && sleep 2 && mount -o rw,sync,rsize=32768,wsize=32768,intr,hard,proto=tcp,fsc natapp2:/exports /http/var/www/html &&  /etc/init.d/httpd start'
 
## Memcached server status  ##
alias mcdstats='/usr/bin/memcached-tool 10.10.27.11:11211 stats'
alias mcdshow='/usr/bin/memcached-tool 10.10.27.11:11211 display'
 
## quickly flush out memcached server ##
alias flushmcd='echo "flush_all" | nc 10.10.27.11 11211'
 
## Remove assets quickly from Akamai / Amazon cdn ##
####alias cdndel='/home/scripts/admin/cdn/purge_cdn_cache --profile akamai'
##alias amzcdndel='/home/scripts/admin/cdn/purge_cdn_cache --profile amazon'
 
## supply list of urls via file or stdin
##alias cdnmdel='/home/scripts/admin/cdn/purge_cdn_cache --profile akamai --stdin'
##alias amzcdnmdel='/home/scripts/admin/cdn/purge_cdn_cache --profile amazon --stdin'




