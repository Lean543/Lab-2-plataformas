#!/bin/bash


main(){

	ID=$1

	ps -p $ID -o comm=Nombre -o pid=PID -o ppid=Proceso_padre -o user=Usuario_propietario -o %cpu=Uso_de_CPU -o %mem=Uso_de_memoria -o stat=Estado -o command=Path_del_ejecutable
	
}

main "$@"
