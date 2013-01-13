#!/usr/bin/perl -w

######################
# blog.kintoandar.com
######################

use strict;

my $raid_status="";
my @raid_status=`/sbin/dmraid -s | grep status `;

chomp ($raid_status[0]);
chomp ($raid_status[1]);

if ($raid_status[0] eq "status : ok" && $raid_status[1] eq "status : ok"){
        print "OK : RAID consistent \n";
        exit 0;
}else{
        print "CRITICAL : RAID problem detected \n";
        exit 2;

}

print "Unkown error: It shouldn't get here.";
exit 3;
