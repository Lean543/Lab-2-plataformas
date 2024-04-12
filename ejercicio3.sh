#!/bin/bash


main() {

    ejecutable=$1

    #$ejecutable

    # $nombre=$(cut -f 2 -d ' ' | pgrep $ejecutable)
    
    echo "CPU MEM" -n > Registro_de_consumo.log

    while [[ $(pgrep -c $ejecutable) != 0 ]]; do

        imp=$(ps -C $ejecutable --no-headers -o %cpu="" -o %mem="")

        echo $imp

        #trans=$(echo "$imp" | cut -d ' ' -f1-2)

        #echo $trans

        echo "$imp" >> Registro_de_consumo.log

        sleep "3"

    done

}

main "$@"