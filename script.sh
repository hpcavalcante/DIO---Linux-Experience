#!/bin/bash

echo -e "\e[0;36m Criando diretorios... \e[0m "

DIR=$(mkdir /publico /adm /ven /sec)
$DIR
echo -e "\e[0;36m Criando grupos...\e[0m"

for i in GRP_ADM GRP_SEC GRP_VEN ; do groupadd $i ; done

echo -e "\e[0;36m Criando usuarios...\e[0m"

for i in carlos maria joao debora sebastiana roberto josefina amanda rogerio ; do useradd $i -m -s /bin/bash -p $(openssl passwd -crypt Senha123) ; done

echo -e "\e[0;36m Adicionando usuarios aos grupos...\e[0m"
for i in carlos maria joao ; do addgroup $i GRP_ADM ; done
for i in debora sebastiana roberto ; do addgroup $i GRP_VEN  ; done
for i in josefina amanda rogerio ; do addgroup $i GRP_SEC ; done

echo -e "\e[0;36m Adicionando permissoes...\e[0m"

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo -e "\e[0;36m Feito. \e[0m"