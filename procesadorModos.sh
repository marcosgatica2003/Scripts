#!/bin/bash

echo "Selecciona el modo de energía del procesador:"
echo "1) performance"
echo "2) powersave"
echo "3) schedutil"
echo "4) ondemand"
echo "5) conservative"
echo "6) userspace"
read -p "Opción [1-6]: " choice

case $choice in
    1)
        mode="performance"
        ;;
    2)
        mode="powersave"
        ;;
    3)
        mode="schedutil"
        ;;
    4)
        mode="ondemand"
        ;;
    5)
        mode="conservative"
        ;;
    6)
        mode="userspace"
        ;;
    *)
        echo "Opción inválida"
        exit 1
        ;;
esac

for cpu in /sys/devices/system/cpu/cpu[0-9]*; do
    cpu_number=$(basename $cpu | sed 's/cpu//')
    if pkexec cpufreq-set -c $cpu_number -g "$mode"; then
        echo "Modo de energía cambiado a $mode para CPU $cpu_number"
    else
        echo "Error al cambiar el modo de energía para CPU $cpu_number"
    fi
done

