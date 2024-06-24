#!/bin/bash

# Obtener el espacio libre y el porcentaje utilizado
disk_info=$(df -h / | awk 'NR==2 {print $4, $5}')

# Imprimir el espacio libre y el porcentaje utilizado
echo "STG: $disk_info"

