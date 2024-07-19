#!/bin/bash

# Obtiene el valor actual de brillo
current_brightness=$(xrandr --verbose | grep -i brightness | cut -f2 -d ' ' | head -n1)

# Define el decremento de brillo
decrement=0.1

# Calcula el nuevo valor de brillo
new_brightness=$(echo "$current_brightness - $decrement" | bc)

# Limita el nuevo valor de brillo para evitar errores
if (( $(echo "$new_brightness < 0.1" | bc -l) )); then
    new_brightness=0.1
fi

# Aplica el nuevo valor de brillo
xrandr --output eDP-1 --brightness "$new_brightness"

