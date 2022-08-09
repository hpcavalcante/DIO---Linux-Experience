#!/bin/bash

echo "Atualizando o servidor"
apt-get update
apt-get upgrade -y
echo "Instalando o web server Apache"
apt-get install apache2 -y
echo "Instalando o unzip"
apt-get install unzip -y
echo "Baixando web app para o servidor apache"
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio-main
cp -R * /var/www/html