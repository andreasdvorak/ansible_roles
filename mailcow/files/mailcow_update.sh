#!/bin/bash
cd /opt/mailcow-dockerized/ && ./update.sh -c >/dev/null
status=$?
if [ $status -eq 3 ]; then
  echo "0 \"mailcow_update\" mailcow_update=0;1;;0;1 No updates available."
elif [ $status -eq 0 ]; then
  echo "1 \"mailcow_update\" mailcow_update=1;1;;0;1 Updated code is available.\nThe changes can be found here: https://github.com/mailcow/mailcow-dockerized/commits/master"
else
  echo "3 \"mailcow_update\" - Unknown output from update script ..."
fi
exit