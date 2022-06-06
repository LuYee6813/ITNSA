# /bin/bash
inotifywait -r -m /share/ -e create -e moved_to | while read dir action file
do
    a=`date`+"%Y-%m-%d_%H:%M:%S"
    zip -r "/var/backups/Backup-$a.zip" /share
done
