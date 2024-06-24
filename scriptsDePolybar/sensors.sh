#!/bin/bash

# Obtener las temperaturas del sistema
temperatures=$(sensors | grep -E 'Tctl' | awk '{print $1, $2}')

# Imprimir las temperaturas
echo "CPU $temperatures"

