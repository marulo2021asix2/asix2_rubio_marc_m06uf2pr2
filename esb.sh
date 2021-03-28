#!/bin/bash
clear
case $1 in 
	-e) if (( $# != 3 )) 
		then
			echo "Número de parametres incorrectes"
			echo "La opció -e necesita 3 paràmetres"
			echo "La primera opció es -e"
			echo "La segona opció es la extenció dels archius a enviar a la paperera"
			echo "La tercera opció es el directori on es troban els archius per enviar a la paperera"
			exit 2
		fi
		if [[ ! -d ~/paperera ]]
		then
			mkdir ~/paperera
		fi
		if [[ ! -d $3 ]]
		then
			echo "La carpeta no existeix"
		else
			if (( $(ls -A $3/*.$2 2> /dev/null | wc -l) != 0 ))
			# Comproba si hi ha archius amb la extenció indicada dins del directori. 
			# 2> /dev/null es per redireccionar avisos extras del bash.
			# 
			then
				mv $3/*.$2 ~/paperera
				echo "Els archius amb extenció de $2 de la carpeta $3 se han enviado a la papelera"
			else
				echo "Els archius amb la extenció indicada no existeixen"
			fi
		 fi		 
		 ;;	 
	-r) if (( $# != 1 )) 
		then
			echo "Número de parametres incorrectes"
			echo "La opció -r no necessita altres paràmetres"
			exit 1
		fi
		if [[ ! -d ~/paperera ]]
		then
			echo "La papelera aun no existe"
		else
			if (( $(ls -A ~/paperera | wc -l) != 0 ))
			then
				rm ~/paperera/* 
				echo "Paperera buida"
			else
				echo "La paperera ja esta buida" 
			fi
		fi
		;;	
	
esac

exit 0
