Table of Contents
=================

  * [Table of Contents](#table-of-contents)
  * [Available scripts](#available-scripts)
    * [Automation](#automation)
      * [backup\_home\.sh](#backup_homesh)
      * [iptables\.sh](#iptablessh)
      * [vmware\-vmrc\.sh](#vmware-vmrcsh)
      * [vpn\_ssh\.sh](#vpn_sshsh)
    * [Init Scripts](#init-scripts)
      * [ghost](#ghost)
    * [Nrpe (Nagios)](#nrpe-nagios)
      * [check\_dmraid\.pl](#check_dmraidpl)
      * [check\_modsec\.sh](#check_modsecsh)
      * [check\_ossec\.pl](#check_ossecpl)
    * [Plugins](#plugins)
      * [fnotify\.pl](#fnotifypl)
  * [How did this repo came to be](#how-did-this-repo-came-to-be)
  * [Credits](#credits)

# Available scripts
These are the current scripts available.

## Automation
Scripts to make you life a little better.

### backup_home.sh
Backup cherry picked files to a encrypted `tar.gz` file using `gpg`.

### iptables.sh
Easy to use [IPTables](https://blog.kintoandar.com/2012/01/attack-detection-and-notification-with.html) template.

📝Check out the [blogpost](https://blog.kintoandar.com/2012/01/attack-detection-and-notification-with.html) about it.

### vmware-vmrc.sh
Fix for the [VMWare console](https://blog.kintoandar.com/2011/06/gnome-3-vmware-console-with-vmware-vmrc.html) client bug.

📝Check out the [blogpost](https://blog.kintoandar.com/2011/06/gnome-3-vmware-console-with-vmware-vmrc.html) about it.

### vpn_ssh.sh
Establish a VPN using `ssh` and `pppd`.

## Init Scripts
Init startup scripts.

### ghost
Manage multiple `Ghost` blog instances easily.

## Nrpe (Nagios)
Monitoring scripts for `Nagios`/`Sensu`/etc.

### check_dmraid.pl
Simple `dmraid` monitoring script.

### check_modsec.sh
Integrates [modsecurity](https://blog.kintoandar.com/2013/01/modsecurity-nagios-nrpe-check.html) with Nagios providing configurable hit count alerts.

📝Check out the [blogpost](https://blog.kintoandar.com/2013/01/modsecurity-nagios-nrpe-check.html) about it.

### check_ossec.pl
Integrates [OSSEC](https://blog.kintoandar.com/2011/01/nagios-nrpe-ossec-check.html) with Nagios providing configurable hit count alerts.

📝Check out the [blogpost](https://blog.kintoandar.com/2011/01/nagios-nrpe-ossec-check.html) about it.

## Plugins

### fnotify.pl
[IRSSI](https://blog.kintoandar.com/2011/06/irssi-irc-mention-notify-by-email-using.html) email notifications from IRC mentions.

📝Check out the [blogpost](https://blog.kintoandar.com/2011/06/irssi-irc-mention-notify-by-email-using.html) about it.

# How did this repo came to be
Back in 2011 I wrote a [blogpost](https://blog.kintoandar.com/2011/11/version-20.html) and this repo was born.

> All the scripts on this blog are going to be submitted to github, all the posts with source code will have links to the corresponding files on github.
I hereby promise to update my code as often as time allows me.
>
>May the source be with you and remember:
>
>"The problem with git jokes is everyone has their own version."

# Credits
Made with ♥️ by [kintoandar](https://blog.kintoandar.com)
