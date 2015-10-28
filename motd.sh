#!/bin/bash

# * Variables
user=$(whoami)
path=$(pwd)
home=$HOME

# * Calculate last login
lastlog1=$(last -i -d -n 1 -w | head -1)
lastlog2=$(last -i -d -n 2 -w | head -2 | tail -1)
lastlog3=$(last -i -d -n 3 -w | head -3 | tail -1)
lastlog4=$(last -i -d -n 4 -w | head -4 |tail -1)
logincount=$( users | wc -w)

# * Calculate current system uptime
uptime=$(uptime -p)

# * Calculate memory
memory=$(free -m | awk 'NR==2{printf "%d/%sMB (%.2f%)", $3,$2,$3*100/$2 }')

# * Calculate usage
usage=$(df -h | grep " /$" | cut -f4 | awk '{printf "%3.1f/%sB (%s)", $3, $2, $5}')

# * Calculate SSH logins:
logins=$(users)

# * Calculate processes
psa=$(expr $(ps -A h | wc -l) - 2)
psu=$(expr $(ps U $user h | wc -l) - 2)

# * Calculate current system load
sysload1=$(cat /proc/loadavg | cut -d' ' -f1)
sysload2=$(cat /proc/loadavg | cut -d' ' -f2)
sysload3=$(cat /proc/loadavg | cut -d' ' -f3)

# * Calculate temperature from lm-sensors
temp=$(acpi -t | cut -d',' -f2)

# * ASCII head
echo '      ___  ___ _____                     _  '
echo '      |  \/  |/  ___|                   | | '
echo '      | .  . |\ `--.  ____ _   _  _ __  | | __  __ _ '
echo '      | |\/| | `--. \|_  /| | | || `_ \ | |/ / / _` |'
echo '      | |  | |/\__/ / / / | |_| || | | ||   < | (_| |'
echo '      \_|  |_/\____/ /___| \__, ||_| |_||_|\_\ \__,_|'
echo '                            __/ | '
echo '                           |___/  '
echo $'\n'

# * Print Output
echo "  Last Logins...: $lastlog1"
echo "                  $lastlog2"
echo "                  $lastlog3"
echo "                  $lastlog4"
echo "                  -----------------------"
echo "                  now $logins"
echo "  Uptime........: $uptime"
echo "  Load..........: $sysload1 $sysload2 $sysload3"
echo "  Memory MB.....: $memory"
echo "  Disk Usage....: $usage"
echo "  Temperature...:$temp"
echo "  SSH Logins....: There are currently $logincount users logged in"
echo "  Processes.....: $psa total running of which $psu is yours"

echo $'\n'
echo "  ::::::::::::::::::::::::::::::::::-RULES-::::::::::::::::::::::::::::::::::"
echo "    This is a private system that you are not to give out access to anyone"
echo "    without permission from the admin. No illegal files or activity. Stay,"
echo "    in your home directory, keep the system clean, and make regular backups."
echo "     -==  DISABLE YOUR PROGRAMS FROM KEEPING SENSITIVE LOGS OR HISTORY ==-"
echo $'\n'

echo "   _______________________________________"
echo "  / You don't know who I am and frankly   \\"
echo "  | shouldn't care, but unknown to you we |"
echo "  | have something in common. We are both |"
echo "  \ rather prone to mistakes.             /"
echo "   --------------------------------------- "
echo "          \   ,__,"
echo "           \  (oo)____"
echo "              (__)    )\\"
echo "                 ||--|| *"