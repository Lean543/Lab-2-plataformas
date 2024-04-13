#!/bin/bash


monitoriar(){   

    ejecution=true

    while [ $ejecution ]; do                                                                                                                              

        find=$(echo "$(inotifywait dirmonitorice) $(date)")

        echo "$find" >> Service_searches

    done

}


main(){

    mkdir dirmonitorice

    monitoriar
    
}

main "$@"