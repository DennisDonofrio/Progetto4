DBNAME=vagrant
DBUSER=vagrant
DBPASSWD=vagrantpass

apt-get update -y
apt-get upgrade -y
apt-get install mysql-server -y
sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
service mysql restart
mysql -e "CREATE USER '$DBUSER'@'%' IDENTIFIED BY '$DBPASSWD'"
mysql -e "GRANT ALL ON *.* to '$DBUSER'@'%'"
mysql -e "CREATE DATABASE $DBNAME"