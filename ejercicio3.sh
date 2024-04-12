#!/bin/bash


main() {

    ejecutable=$1

    #$ejecutable

    # $nombre=$(cut -f 2 -d ' ' | pgrep $ejecutable)

    while [[ $(pgrep -c $ejecutable) != 0 ]]; do

        imp=$(ps -C $ejecutable --no-headers -o %cpu="" -o %mem="")

        echo "$imp"

        #trans1=$(echo "$imp" | cut -d ' ' -f1-2)

        #echo $trans

        trans=$(echo $imp | tr [" "] [","])

        echo "$trans" >> Registro_de_consumo.log

        sleep "2"

    done

    gnuplot>plot "Registro_de_consumo.log"

}

main "$@"