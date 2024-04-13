#!/bin/bash


monitoriar(){   

    ejecution=true

    while [ $ejecution ]; do                                                                                                                              

        find=$(echo "$(inotifywait dirmonitorice) $(date)")

        echo "$find" >> Service_searches

    done

}


main(){

#      cd /etc/systemd/system/

#      creationinfo="[Unit]
# Description=Servicio de Monitoreo de Cambios en Directorios
# After=network.target

# [Service]
# Type=simple
# ExecStart="$(realpath ejercicio4.sh)"
# WorkingDirectory="$(realpath Lab_2_plataformas)"

# [Install]
# WantedBy=multi-user.target"

#     sudo echo $creationinfo > monitoriate.service

    monitoriar
    
}

main "$@"