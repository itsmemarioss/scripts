#!/bin/bash

# by Mário 14/11/2017

echo "Iniciando Backup do banco espelho SIGAA/UFC"

file="`date +\%Y-\%m-\%d`_bkp"

echo $file

cd /home/mario/Desenvolvimento/backups

echo "Criando arquivo $file..."

# senha definida no arquivo .pgpass
pg_dump -v -U user -h localhost -p 5432 -T table.excluded -Fc database > "$file"
#pg_dump -v -U postgres -h localhost -p 5432 -Fc teste_bkp > "$file"

echo "Restaurando backup no servidor 200.129.12.94"

# restore em outro ambiente
pg_restore -v -U postgres -h localhost --dbname=postgres --create "$file"
#pg_restore -v -U postgres -h localhost --clean --create --dbname=postgres "$file"

echo "Restore finalizado"


