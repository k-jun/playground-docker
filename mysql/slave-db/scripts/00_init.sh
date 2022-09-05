# #!/bin/sh
#
# # masterをロックする
# mysql -u root -h mysqld-master --password=root -e "RESET MASTER;"
# mysql -u root -h mysqld-master --password=root -e "FLUSH TABLES WITH READ LOCK;"
#
# # masterのDB情報をDumpする
# mysqldump -uroot -h mysqld-master --password=root --all-databases --master-data --single-transaction > /tmp/master_dump.sql
#
# # dumpしたmasterのDBをslaveにimportする
# mysql -u root --password=root -e "STOP SLAVE;"
# mysql -u root --password=root < /tmp/master_dump.sql
#
# # masterに繋いで bin-logのファイル名とポジションを取得する
# log_file=`mysql -u root -h mysqld-master --password=root -e "SHOW MASTER STATUS\G" | grep File: | awk '{print $2}'`
# pos=`mysql -u root -h mysqld-master --password=root -e "SHOW MASTER STATUS\G" | grep Position: | awk '{print $2}'`
#
# # slaveの開始
# mysql -u root --password=root -e "RESET SLAVE;"
# mysql -u root --password=root -e "CHANGE MASTER TO MASTER_HOST='mysqld-master', MASTER_USER='root', MASTER_PASSWORD='root', MASTER_LOG_FILE='${log_file}', MASTER_LOG_POS=${pos};"
# mysql -u root --password=root -e "START SLAVE;"
#
# # masterをunlockする
# mysql -u root --password=root -h mysqld-master -e "UNLOCK TABLES;"
