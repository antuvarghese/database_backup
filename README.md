# database_backup
This is a shell script written for backuping databases...
-------------------------------------------------------------------------------- 
There are two choices available...  
  
1.Full backup 
 
->Backup all databases(except perfomance_schema,information_schema etc )
  
2.Manual backup 

->Backup only the database mentioned
->enter the name of database want to backup

-------------------------------------------------------------------------------

Location 
--------
create directory as mentioned below
 
Full backup 
 
/backup/db-backup/full_backup

Manual backup

/backup/db-backup/manual_backup

===============================================================================

give chmod permission to database_backup.sh
then run

sudo ./database_backup.sh
