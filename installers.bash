#!/bin/bash

#apt update
#apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys #58118E89F3A912897C070ADBF76221572C52609D
#apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'
#apt update && apt-cache policy docker-engine
#apt install -y docker-engine
#работает только на убунту, но я пока ушел от докера
echo "Do you want install nodejs, npm, and others? [y|Y to install | * to exit]: "
read item
case $item in
    y|Y)
        echo "Installing..."
        installing
    ;;
    *)
        echo ":("
        exit -1
    ;;
esac

function installing() {
apt install -y npm nodejs mysql-server git
mysql_secure_installation

mysql << EOF
	create database usersDB2; 
	create user 'metidaSQL'@'localhost' identified with mysql_native_password by '123456';
	grant all privileges on usersDB2.users to 'metidaSQL'@'localhost';
	grant all privileges on usersDB2.articles to 'metidaSQL'@'localhost';
EOF

}


