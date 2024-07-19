#!/bin/bash

# Obtiene el valor actual de brillo
current_brightness=$(xrandr --verbose | grep -i brightness | cut -f2 -d ' ' | head -n1)

# Define el incremento de brillo
increment=0.1

# Calcula el nuevo valor de brillo
new_brightness=$(echo "$current_brightness + $increment" | bc)

# Limita el nuevo valor de brillo para evitar errores
if (( $(echo "$new_brightness > 1.0" | bc -l) )); then
    new_brightness=1.0
fi

# Aplica el nuevo valor de brillo
xrandr --output eDP-1 --brightness "$new_brightness"

