#!/bin/bash

#################################################################################################
# Copyright  2005-2024 DANIEL FERNANDO LA ROTTA (sistemas@asescobpo.com)             
# Se concede permiso para copiar, distribuir y/o modificar este programa siempre                 
# y cuando se cite al autor y la fuente de linuxtotal.com.mx y según los términos                
# de la GNU General Public License,  
# Versión 3 o cualquiera O Posterior publicada por la Free Software Foundation.                  
#################################################################################################

# fecha y hora, ejemplo 20110920_2300
# archivo termina como 'mysql_20110920_2300.sql.gz'

fecha=`date +%Y%m%d_%H%M`
archivo="mysql_$fecha.sql.gz"

# elimina la opción --master-data si tu servidor no es maestro en replicación

mysqldump --user=root --password=${ROOT_PASSWORD} --all-databases --opt --routines \
--add-drop-database --add-drop-table --complete-insert --create-options  | gzip > $archivo && \
echo "Respaldo realizado exitosamente el `date`" >> bitacora.txt

#adicionalmente si se tiene otro servidor linux, copiamos el archivo ya
#generado de respaldo por medio de scp de ssh y asi aseguramos que el 
#respaldo este en otra locación, logrando redundancia (en los artículos
#relacionados chécate "Autentifiación SSH con llave privada")
