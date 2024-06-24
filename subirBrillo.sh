#!/bin/bash

# Define la ruta del archivo de brillo
brightness_file="/sys/class/backlight/amdgpu_bl0/brightness"

# Obtiene el valor actual de brillo
current_brightness=$(cat "$brightness_file")

# Define el incremento de brillo
increment=10

# Calcula el nuevo valor de brillo
new_brightness=$((current_brightness + increment))

# Limita el nuevo valor de brillo para evitar errores
max_brightness=$(cat "/sys/class/backlight/amdgpu_bl0/max_brightness")
if [ "$new_brightness" -gt "$max_brightness" ]; then
    new_brightness=$max_brightness
fi

# Establece el nuevo valor de brillo
echo "$new_brightness" | sudo tee "$brightness_file" >/dev/null

