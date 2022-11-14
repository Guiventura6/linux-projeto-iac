#!/bin/bash

# Atencao: Rodar script com o usuario root

echo "#############################################"
echo "##   Iniciando criacao da infraestrutura   ##"
echo "#############################################"

echo -e "Criando diretorios...\n"
mkdir -v /publico
mkdir -v /adm
mkdir -v /ven
mkdir -v /sec
echo -e "Concluido!\n"

echo -e "Criando grupos..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC
echo -e "Concluido!\n"

echo -e "Adicionando dono e grupos aos diretorios..."
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec
echo -e "Concluido!\n"

echo -e "Configurando Permissoes...\n"
# Todos os usuarios terao permissao total ao diretorio publico
chmod -v 777 /publico
# Os usuarios de cada grupo terao permissao total dentro de seu respectivo diretorio
# mas nao poderao ter permissao de leitura, escrita e execucao em diretorios de departamentos 
# que eles nao pertencem

chmod -v 770 /adm
chmod -v 770 /ven
chmod -v 770 /sec 
echo -e "Concluido!\n"


echo -e "Criando usuarios..."
useradd carlos -c "Carlos da Silva" -s /bin/bash -m -p $(openssl passwd 123) -G GRP_ADM
useradd maria -c "Maria da Silva" -s /bin/bash -m -p $(openssl passwd 123) -G GRP_ADM
useradd joao -c "Joao da Silva" -s /bin/bash -m -p $(openssl passwd 123) -G GRP_ADM

useradd debora -c "Debora da Silva" -s /bin/bash -m -p $(openssl passwd 123) -G GRP_VEN
useradd sebastiana -c "Sebastiana da Silva" -s /bin/bash -m -p $(openssl passwd 123) -G GRP_VEN
useradd roberto -c "Roberto da Silva" -s /bin/bash -m -p $(openssl passwd 123) -G GRP_VEN

useradd josefina -c "Josefina da Silva" -s /bin/bash -m -p $(openssl passwd 123) -G GRP_SEC
useradd amanda -c "Amanda da Silva" -s /bin/bash -m -p $(openssl passwd 123) -G GRP_SEC
useradd rogerio -c "Rogerio da Silva" -s /bin/bash -m -p $(openssl passwd 123) -G GRP_SEC
echo -e "Concluido!\n"

echo -e "Criacao da Infraestrutura concluida com sucesso!!\n"
