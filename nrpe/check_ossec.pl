#!/usr/bin/perl

##############
# kintoandar 
##############

use strict;
use warnings;

#--------------------------- Variables ------------------------------
# Where is the ossec alert.log?
# (nagios must belong to ossec /etc/group so it can open the log)
my $alert_log="/opt/ossec/logs/alerts/alerts.log";

# What level is critical for you?
my $critical="7";

# What is the OSSEC-Server name?
my $ossec="banshee";

#---------------------------- Parser --------------------------------
my @text=`grep "(level" -B 1 $alert_log`;
my $size=@text;
my @level="";
my $msg="";
my @host="";
my $count=0;
my $num=0;
for ($count=0;$count<$size;$count++){ 
    if ($text[$count] =~ m/level/){
        @level="";
        @level=split(/\(level /, $text[$count]);
        @level=split(/\) ->/, $level[1]);
        if ($level[0] >= $critical){
             chomp ($level[1]);
             if ($text[$count-1] !~ m/$ossec/){
                @host=$text[$count-1];
                @host=split(/ \(/, $host[0]);
                @host=split(/\) /, $host[1]);
                $host[0]=uc ($host[0]);
            }else{
                $host[0]=uc ($ossec);
            }
            $num++;
            $msg=$msg."[$host[0] level=$level[0]$level[1]]";
        }
    }
}

#-------------------------- Send to Nagios ---------------------------
if ($msg eq ""){
    print "No security threats found";
    exit 0;
}else{
    print "$num alerts found: $msg";
    exit 2;
}
print "Something is wrong, script went out of bounds?";
exit 1;
