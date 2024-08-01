#!/bin/bash

# 设置mysql的登录用户名和密码(根据实际情况填写)
mysql_user="root"
mysql_password="root"
mysql_host="localhost"
mysql_port="3306"
mysql_charset="utf8mb4"
mysql_database="blog"
mysql_container_name="project_mysql_1"

# 是否删除过期数据
expire_backup_delete="ON"
expire_days=7
backup_time=`date +%Y%m%d%H%M`

# 备份文件存放地址(根据实际情况填写)
backup_dir=/user/local/mysql_backup/$mysql_database

echo "Welcome to use MySQL backup tools!"

# 备份指定数据库中数据(此处假设数据库是blog)
mkdir -p $backup_dir
docker exec $mysql_container_name mysqldump -h$mysql_host -P$mysql_port -u$mysql_user -p$mysql_password -B $mysql_database > $backup_dir/$backup_time.sql

# 删除过期数据
if [ "$expire_backup_delete" == "ON" -a  "$backup_dir" != "" ];then
        `find $backup_dir/ -type f -mtime +$expire_days | xargs rm -rf`
        echo "Expired backup data delete complete!"
fi