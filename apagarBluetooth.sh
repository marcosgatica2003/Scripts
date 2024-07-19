#!/bin/bash

echo "Apagando el servicio de Bluetooth..."
sudo systemctl stop bluetooth.service
sudo systemctl mask bluetooth.service
echo "Servicio de Bluetooth apagado y enmascarado."

