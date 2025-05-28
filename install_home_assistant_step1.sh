#!/bin/bash

# Обновление системы
echo "Обновление системы..."
sudo apt update
sudo apt upgrade -y

# Установка зависимостей
echo "Установка зависимостей..."
sudo apt-get install -y jq wget curl udisks2 apparmor-utils libglib2.0-bin network-manager dbus systemd-journal-remote systemd-resolved

# Запуск и включение Network Manager
echo "Запуск и включение Network Manager..."
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager

# Изменение параметров загрузки
echo "Изменение параметров загрузки..."
sudo sed -i '$ s/$/ systemd.unified_cgroup_hierarchy=false lsm=apparmor/' /boot/firmware/cmdline.txt

# Перезагрузка системы
echo "Перезагрузка системы..."
sudo reboot
