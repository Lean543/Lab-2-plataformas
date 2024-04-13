#!/bin/bash

main() {
    
    nombre=$1

    command=$2

    if [[ $(pgrep -c $nombre) != 0 ]]; then
        
        while [[ $(pgrep -c $nombre) != 0 ]]; do

            if [[ $(pgrep -c $nombre) != 0 ]]; then

                ps -f -C $nombre

                sleep "3"

            else

                $command

            fi

        done

    else

        echo "Error: Proceso $nombre no está corriendo."

    fi

}

main "$@"
