#!/bin/bash


nombre=$1

command=$2

ID=$(cut -d " " -f 1 | pgrep -l $nombre)

if [[ "$(pgrep -l $nombre)" == "$ID $nombre" ]]; then
    
    while [ $(pgrep -l $nombre) == "$nombre" ]; do

        if [ $(pgrep -l $nombre) == "$nombre" ]; then

            ps - $nombre

        else
            kill -CONT $ID

        fi

    done

else

    echo "Error: Proceso $nombre no está corriendo."

fi



