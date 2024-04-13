#!/bin/bash


main() {

    ejecutable=$1

    #$ejecutable

    # $nombre=$(cut -f 2 -d ' ' | pgrep $ejecutable)

    while [[ $(pgrep -c $ejecutable) != 0 ]]; do

        imp=$(ps -C $ejecutable --no-headers -o %cpu="" -o %mem="")

        date="$(date)"

        trastime="$imp "$(echo $date | cut -d ' ' -f4)""

        echo "$trastime"

        #trans1=$(echo "$imp" | cut -d ' ' -f1-2)

        #echo $trans

        echo $trastime >> Registro_de_consumo.log

        sleep "2"

    done

    echo "set datafile separator " "" | gnuplot

    echo "plot Registro_de_consumo.log u 1:2" | gnuplot

}

main "$@"