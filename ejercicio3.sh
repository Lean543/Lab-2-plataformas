#!/bin/bash


main() {

    ejecutable=$1
    

    while [[ $(pgrep -c $ejecutable) != 0 ]]; do

        imp=$(ps -C $ejecutable --no-headers -o %cpu="" -o %mem="")

        time1=$(ps -C $ejecutable --no-headers -o time="")

        trastime="$(echo $time1 | cut -d ':' -f3)"

        conc="$trastime $imp"

        echo $conc

        echo $conc >> Registro_de_consumo.log

    done

    gnuplot -e "set datafile separator ' '; plot 'Registro_de_consumo.log' using 1:2 t 'cpu', 'Registro_de_consumo.log' using 1:3 t 'mem'"

}

main "$@"