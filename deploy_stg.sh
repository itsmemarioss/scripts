#!/bin/bash
# Usage
# Autor Mário

ear=${1:?"Arquivo para deploy não informado"}
user=csi
server=${2:-"app01-tst-jne.ufca.edu.br"}
inst=${3:-"inst1"}
folder=/var/sistemas/ear_sistemas/ear_$inst
migration=/var/sistemas/migration
backup=backup_ear

# TODO build...

# bkp ear
echo "realizando backup do ear..."

if [ ! -d "$backup" ] 
then
  mkdir $backup && cd $backup
fi

scp -r $user@$server:$folder/* ./

# stop service jboss, clean work e temp
echo "parando instância $inst ..."
ssh -t $user@$server "jboss -x $inst"

# migration
echo "realizando migration..."
# flyway migrate...

# substituir ear
echo "uppando novo ear para $inst ..."
# copy $ear to folder
# scp $ear $user@$server:$folder

# start service jboss
echo "iniciando instância $inst ..."
ssh $user@$server "jboss -s $inst"
