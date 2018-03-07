#!/usr/bin/env bash

DB_VERSION=9.3
DB_NAME="wtm"
DB_USERNAME="vagrant"
DB_PASSWORD="vagrant"

#echo "-------------------- updating package lists"
#apt-get update
# gotta put this before the upgrade, b/c it reboots and then all commands are lost

export PGPASSWORD=$DB_PASSWORD
if [ "$( psql -U $DB_USERNAME postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='$DB_USERNAME'" )" = '1' ]
then
    echo "rolname '$DB_USERNAME' already exists"
else
    echo "rolname '$DB_USERNAME' does not exist"
    echo "-------------------- installing postgres"
    apt-get -y install postgresql-$DB_VERSION postgresql-contrib-$DB_VERSION
    # fix permissions
    echo "-------------------- fixing listen_addresses on postgresql.conf"
    sudo sed -i "s/#listen_address.*/listen_addresses '*'/" vim po$DB_VERSION/main/postgresql.conf
    echo "-------------------- fixing postgres pg_hba.conf file"
    # replace the ipv4 host line with the above line
    sudo sed -i "s/local   all             all                                     peer/local   all             all                                     md5/" /etc/postgresql/$DB_VERSION/main/pg_hba.conf
    sudo cat >> /etc/postgresql/$DB_VERSION/main/pg_hba.conf <<EOF
# Accept all IPv4 connections - FOR DEVELOPMENT ONLY!!!
host    all         all         0.0.0.0/0             md5
EOF
    echo "-------------------- creating postgres $DB_USERNAME role with password '$DB_PASSWORD'"
    # Create Role and login
    sudo su postgres -c "psql -c \"CREATE ROLE $DB_USERNAME SUPERUSER LOGIN PASSWORD '$DB_PASSWORD'\" "
    echo "-------------------- restarting postgres"
    sudo service postgresql restart
    echo "-------------------- installing postgis"
fi

if psql -lqt -U $DB_USERNAME | cut -d \| -f 1 | grep -w $DB_NAME;
then
    echo "Database '$DB_NAME' already exists"
else
    # Create WTM database
    echo "-------------------- creating $DB_NAME database"
    sudo su postgres -c "createdb -E UTF8 -T template0 --locale=en_US.utf8 -O $DB_USERNAME $DB_NAME"
    echo "-------------------- upgrading packages to latest"
    apt-get upgrade -y
fi
