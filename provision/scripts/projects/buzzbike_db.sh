#!/usr/bin/env bash

DB_USER="buzzbike"
DB_PASSWORD="buzzbike"
DB_NAMES=("buzzbike" "buzzbike_test")


echo "-------------------- Creating user '$DB_USER'"
sudo su postgres -c "psql -c \"CREATE ROLE $DB_USER SUPERUSER LOGIN PASSWORD '$DB_PASSWORD'\" "

for db in "${DB_NAMES[@]}"
do
    echo "-------------------- Creating database '$db'"
    sudo su postgres -c "createdb -E UTF8 -O $DB_USER $db"
    echo "-------------------- Creating extension 'postgis' on database '$db'"
    PGPASSWORD=$DB_PASSWORD psql -U $DB_USER -d $db -c "CREATE EXTENSION postgis;"
done

