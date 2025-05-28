#!/bin/bash

echo "Установка Docker остановится в режиме ROOT# - наберите exit  для продолжения"
echo "Docker installation will stop in ROOT mode# - type exit to continue"
sleep 10

# Установка Docker
echo "Установка Docker..."
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
newgrp docker

# Установка Home Assistant OS Agent
echo "Установка Home Assistant OS Agent..."
wget https://github.com/home-assistant/os-agent/releases/download/1.7.2/os-agent_1.7.2_linux_aarch64.deb
sudo dpkg -i os-agent_1.7.2_linux_aarch64.deb

# Установка Home Assistant Supervised
echo "Установка Home Assistant Supervised..."
wget https://github.com/home-assistant/supervised-installer/releases/download/3.1.0/homeassistant-supervised.deb
sudo dpkg -i homeassistant-supervised.deb

# Исправление ошибок установки
echo "Исправление ошибок установки..."
sudo apt --fix-broken install

# Настройка Chromium для отображения дашборда Home Assistant на сенсорном дисплее
# Создание файла run_kiosk.sh
echo "Создание файла run_kiosk.sh..."
cat <<EOL > /home/pi/run_kiosk.sh
#!/bin/bash
/usr/bin/chromium-browser --start-fullscreen --app=http://localhost:8123 &
EOL

# Дать права на выполнение файлу run_kiosk.sh
chmod +x /home/pi/run_kiosk.sh

# Редактирование файла /etc/xdg/labwc/autostart
echo "Редактирование файла /etc/xdg/labwc/autostart..."
echo "/home/pi/run_kiosk.sh &" | sudo tee -a /etc/xdg/labwc/autostart

# Настройка Chromium для отображения дашборда Home Assistant на сенсорном дисплее
#echo "Настройка Chromium для отображения дашборда Home Assistant на сенсорном дисплее..."
# sudo apt-get install -y chromium-browser
# mkdir -p ~/.config/lxsession/LXDE-pi
#echo "@chromium-browser --kiosk --incognito --disable-pinch --overscroll-history-navigation=0 http://localhost:8123" > /etc/xdg/lxsession/LXDE-pi/autostart

# Перезагрузка системы
echo "Перезагрузка системы..."
sudo reboot
