
# Automation_Project

automaion.sh->

			-script check if apache2 is installed or not ..if  it is not installed then auatomation script installed apache2
			-script check if apache2 2 is running or not ..if it is not running then this script started the apache2
			-script check if apache2 is enabled or not ..if it is disabled then this scipt enable the apache2 service 

			-after that ,this script create tar file of all log file which is oresent in /var/log/apache2/
			and upload generated tar file on s3 server




----step to run automation.sh -->

	#Make the script executible
		chmod  +x  /root/Automation_Project/automation.sh
	#switch to root user with sudo su
		sudo  su
		./root/Automation_Project/automation.sh
	# or run with sudo privileges
		sudo ./root/Automation_Project/automation.sh





