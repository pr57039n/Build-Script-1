#!/bin/bash

#Name - Pat Reynolds 
#Crontab input 0 23 * * 5 pat sudo /home/pat/bin/updatetest/build1.sh
#Date - 08/05/22

#This script is for updating the server as well as upgrading it while offline
#This script is planned to run every Friday

#This portion will update the server, if successful, will log it. If not it will also be logged in the update file
 if
	apt-get update -y > /home/pat/bin/updatetest/update_$(date +%d-%m-%y);
 then 
	echo "update successful $(date)" >> /home/pat/bin/updatetest/update_$(date +%d-%m-%y)
else
	echo "Update could not complete $(date)" >>  /home/pat/bin/updatetest/update_$(date +%d-%m-%y)
fi

#This portion will then upgrade the server afterwards
 if
	apt-get upgrade -y > /home/pat/bin/updatetest/upgrade_$(date +%d-%m-%y);
 then
       echo "upgrade successful $(date)" >> /home/pat/bin/updatetest/upgrade_$(date +%d-%m-%y)
else
        echo "Upgrade could not complete $(date)" >>  /home/pat/bin/updatetest/upgrade_$(date +%d-%m-%y)
fi
