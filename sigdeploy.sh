#!/bin/bash
# Usage: id_rsa.pub deve ser copiado para authorized_hosts no servidor, para evitar que seja necessário digitar a senha.
# sigdeploy -h app01-stg-jne.ufca.edu.br -u csi -i inst1 sigaa.ear
# Caso não seja informado o servidor e a instância será usado os valores no arquivo.
# Autor Mário S. Sousa


#migration=/var/sistemas/migration


# TODO build...
# ant....

while getopts ":h:u:i:" opt; do
    case $opt in
        h) server=$OPTARG;;
        i) inst=$OPTARG;;
        u) user=$OPTARG;;
    esac
done

#definindo variávies
shift $(($OPTIND - 1))
ear=${1:?"Arquivo para deploy não informado"}
server=${server:-"app01-tst-jne.ufca.edu.br"}
inst=${inst:-"inst1"}
user=${user:-"csi"}

folder=/var/sistemas/ear_sistemas/ear_$inst
backup=backup_ear

echo "Iniciando deploy com os seguintes parâmetros:"
echo " - server: $server"
echo " - user: $user"
echo " - inst: $inst"
echo " - ear: $ear"
echo " "

# bkp ear
echo "realizando backup do ear..."

if [ ! -d "$backup" ] 
then
  mkdir $backup
fi

scp -r $user@$server:$folder/*.ear $backup

# stop service jboss, clean work e temp
echo "parando instância $inst ..."
ssh -t $user@$server "jboss -x $inst"

# migration
# echo "realizando migration..."
# flyway migrate...

# substituir ear
echo "uppando novo ear para $inst ..."
# copy $ear to folder
scp $ear $user@$server:$folder

# start service jboss
echo "iniciando instância $inst ..."
ssh $user@$server "jboss -s $inst"


