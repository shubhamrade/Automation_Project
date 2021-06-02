s3_bucket=upgrad-shubhamr
my_name=Shubham

sudo apt update -y


echo "-------------------------------------------------"

dpkg -s apache2 &> /dev/null

if [ $? -eq 0 ]; then
    echo "Package  is installed!"
else
        echo "package ready for installing"
        sudo apt install apache2
fi

echo "-------------------------------------------------"
isActive=$(systemctl is-active apache2)

if [ "$isActive" = "active" ]; then
 echo "apache service is running"
else
 echo "apache service is started"
 sudo systemctl start apache2.service
 echo "apache service is running"
fi

echo "-------------------------------------------------"
isEnabled=$(systemctl is-enabled apache2.service)
if [ "$isEnabled" = "disabled" ]; then

        systemctl enable  apache2.service
fi

echo "Process is enabled"

echo "----------------------------------------------------"



echo "creating tar File for all log file "
timestamp=$(date '+%d%m%Y-%H%M%S')
log_file_name=*.log
log_type=httpd-logs
file_type=tar
tar_file_name=$my_name-$log_type-$timestamp.$file_type
tar_file_path=/tmp/$tar_file_name

cd /var/log/apache2/

tar -cvf $tar_file_path $log_file_name


echo "tar File is created with name :$tar_file_name"
echo "----------------------------------------------------"


aws s3 \
cp $tar_file_path \
s3://$s3_bucket/$tar_file_name

echo "file: $tar_file_name is uploaded on s3 server"
echo "----------------------------------------------------"


file_size=`du -h "$tar_file_path" | cut -f1`
echo "----------------------------------------------------"
file="/var/www/html/inventory.html"
if [ -f "$file" ]
then
        echo "$file is already created"
else
        touch $file
        echo "$file is created"
        echo " <p> <b> Log Type  &emsp;   Date Created   &emsp; &emsp;    Type   &emsp;   Size </b> </p> " >>$file
fi

echo " <p> $log_type  &emsp; $timestamp  &emsp; $file_type  &emsp; $file_size </p> " >>$file

