#!/bin/bash
DATE=$(date +%d-%m-%Y-%H:%M)
BACKUP_DIR="/backup/db-backup/"
MYSQL="$(which mysql)"
mysql -u root -p* -e 'show databases;'
echo "1.Full Backup"
echo "2.Manual Backup"
read a
if [ $a == 2 ]
then

	echo "Enter Database name for backup"
	read DB
	mysqldump -u root -p* $DB | gzip -9 > "$BACKUP_DIR/manual_backup/$DB-$DATE.sql.gz"
	ls -al $BACKUP_DIR/manual_backup/
	echo -e "\n"
	echo -e "\e[1;34m *****Manual Backup Successful***** \e[0m"
	echo -e "\n"
	
else

	databases=`$MYSQL -u root -p* -e "show databases"| grep -Ev "(database|Database|information_schema|performance_schema)"`
	for db in $databases; do
		mysqldump --force --opt -u root -p* --databases $db | gzip > "$BACKUP_DIR/full_backup/$db-$DATE.gz"
	done
	ls -al $BACKUP_DIR/full_backup/
	echo -e "\n"
	echo -e "\e[1;34m *****Full Backup Successful***** \e[0m"
	echo -e "\n"

fi
