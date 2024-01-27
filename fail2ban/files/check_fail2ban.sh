#/bin/bash

ps -ef | grep /usr/bin/fail2ban-server | grep -v grep > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "2 Process_Fail2Ban - not running"
fi 

currently_failed=`/usr/bin/fail2ban-client status sshd | grep "Currently failed" | cut -f2`
total_failed=`/usr/bin/fail2ban-client status sshd | grep "Total failed" | cut -f2`
currently_banned=`/usr/bin/fail2ban-client status sshd | grep "Currently banned" | cut -f2`
total_banned=`/usr/bin/fail2ban-client status sshd | grep "Total banned" | cut -f2`

echo "0 Process_Fail2Ban currently_failed=$currently_failed|total_failed=$total_failed|currently_banned=$currently_banned|total_banned=$total_banned running Currently failed: $currently_failed, Total failed: $total_failed, Currently banned: $currently_banned, Total banned: $total_banned"