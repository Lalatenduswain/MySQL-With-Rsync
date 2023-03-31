#! /bin/bash
# SCRIPT TO BACKUP MYSQL DATABASE TO REMOTE SERVER THROUGH RSYNC
# Lalatendu Swain - March 2023

# SET SOME VARIABLES
FILENAME="`date +mysqldump-%Y-%m-%d-%H:%M:%S`.sql"
LOCALFILE="/home/sql_backup/$FILENAME"
LOCKFILE="/tmp/sqlbackup.lock"
BACKUPSERVER="10.1.1.1"
MYSQLPASS="secretsgohere"
REMOTEPATH="/home/somebackups/"
REMOTEFILE="$REMOTEPATH$FILENAME"

# CHECK THE LOCKS
if [ -f $LOCKFILE ]; then
        echo "lockfile exists! exiting."
        exit 1
else
        touch /tmp/sqlbackup.lock
fi

# DUMP THE DATABASES TO A FILE
echo "Dumping the DBs..."
mysqldump -p$MYSQLPASS --single-transaction --quick -A > $LOCALFILE
if [ $? -eq 0 ]; then
        echo 'mysqldump was successful'
else
        echo 'mysqldump failed'
        exit 1
fi

# MOVE THAT FILE TO THE REMOTE MACHINE
echo "Copying them to the remote machine..."
rsync -e "ssh -p 2020" -vazP $LOCALFILE root@$BACKUPSERVER:$REMOTEFILE

RXC="ssh -p 2020 root@$BACKUPSERVER"

echo "Linking the latest file"
#$RXC ln -fs $REMOTEFILE $REMOTEPATH/latest-backup.sql
#$RXC touch $REMOTEPATH/load-latest-dump

#echo "Loading the MySQL dump on the remote machine in the background.."
#$RXC nohup /home/loadmysqldump.sh $REMOTEFILE &

echo "Removing the dump file..."
rm -vf $LOCALFILE # delete the old file

# FINALLY REMOVE THE BACKUP LOCK
rm $LOCKFILE
