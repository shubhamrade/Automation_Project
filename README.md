
# Automation_Project

automaion.sh->

			-script check if apache2 is installed or not ..if  it is not installed then auatomation script installed apache2
			-script check if apache2 2 is running or not ..if it is not running then this script started the apache2
			-script check if apache2 is enabled or not ..if it is disabled then this scipt enable the apache2 service 

			-after that ,this script create tar file of all log file which is oresent in /var/log/apache2/
			and upload generated tar file on s3 server




----step to run automation.sh -->

	#install aws cli before execute the script ->
		sudo apt update
		sudo apt install awscli
	#Make the script executible
		chmod  +x  /root/Automation_Project/automation.sh
	#switch to root user with sudo su
		sudo  su
		./root/Automation_Project/automation.sh
	# or run with sudo privileges
		sudo ./root/Automation_Project/automation.sh


step to create cron Tab

	#first check crontab is availble for root or not 
		crontab -l
	#Create a new crontab file, or edit an existing file.
		crontab -e
	# insert following  code in file
		5 0 * * * root /root/Automation_Project/automation.sh
	#The crontab file will be placed in the /etc/cron.d/ directory.






