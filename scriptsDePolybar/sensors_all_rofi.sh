#!/bin/bash

# Obtener todas las temperaturas usando sensors
sensors_output=$(sensors)
gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader)

# Extraer y formatear las líneas que contienen la palabra 'temp', 'Composite', 'Tctl', y 'edge'
sensors_temps=$(echo "$sensors_output" | grep -E 'temp1|Composite|Tctl|edge' | awk '{print $1, $2, $3}')

sensors_temps+=" GPU $gpu_temp"

# Formatear las temperaturas para mostrarlas en rofi
temps_formatted=$(echo "$sensors_temps" | while read -r line; do
    sensor=$(echo $line | cut -d':' -f1)
    temp=$(echo $line | cut -d' ' -f2)
    if [[ $sensor == "Sensor 1" || $sensor == "Sensor 2" || $sensor == "GPU" ]]; then
        echo "$sensor: $temp"
    else
        echo "$sensor $temp"
    fi
done)
# Mostrar las temperaturas en rofi
echo "$temps_formatted" | rofi -dmenu -theme ~/.config/rofi/rofi.rasi -p "TEMPERATURAS"

