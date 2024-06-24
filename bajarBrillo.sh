#!/bin/bash

# Define la ruta del archivo de brillo
brightness_file="/sys/class/backlight/amdgpu_bl0/brightness"

# Obtiene el valor actual de brillo
current_brightness=$(cat "$brightness_file")

# Define el decremento de brillo
decrement=10

# Calcula el nuevo valor de brillo
new_brightness=$((current_brightness - decrement))

# Limita el nuevo valor de brillo para evitar errores
if [ "$new_brightness" -lt 0 ]; then
    new_brightness=0
fi

# Establece el nuevo valor de brillo
echo "$new_brightness" | sudo tee "$brightness_file" >/dev/null

