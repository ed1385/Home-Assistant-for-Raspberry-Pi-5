# Home-Assistant-for-Raspberry-Pi-5
Here is a script for installing Home Assistant on a Raspberry Pi 5 using Raspbian 64-bit and ensuring compatibility with a touchscreen display:

После выполнения этих шагов Home Assistant должен быть установлен и готов к использованию.
Вы можете получить доступ к веб-интерфейсу Home Assistant, перейдя по адресу http://localhost:8123 в вашем веб-браузере на сенсорном дисплее.
Установите чистую OS rasbian 64bit for Raspberry Pi 5  
https://www.raspberrypi.com/software/operating-systems/#raspberry-pi-os-64-bit 

1) загрузите файлы 
git  clone https://github.com/ed1385/Home-Assistant-for-Raspberry-Pi-5.git
2) выполните команды
sudo chmod +x install_home_assistant_step1.sh
sudo chmod +x install_home_assistant_step2.sh
3) Запустите скрипты:
sudo ./install_home_assistant_step1.sh  
sudo ./install_home_assistant_step2.sh   //если остановится в режиме ROOT# наберите exit для продолжения выполнения

После выполнения этих шагов Home Assistant должен быть установлен и готов к использованию. 
Вы можете получить доступ к веб-интерфейсу Home Assistant, перейдя по адресу http://localhost:8123 в вашем веб-браузере на сенсорном дисплее.

AUTO START :
Редактируем  
sudo nano /etc/xdg/labwc/autostart  - добавим ваш файл автостарта в конце 
/home/pi/run_kiosk.sh &   - файл должен быть создан и сделан исполняемым
Все команды управления запуском пишем в него.

В моем варианте:
//********************************************************************
#!/bin/bash
#https://wiki.seeedstudio.com/reTerminal_Home_Assistant/
# Функция для проверки статуса Home Assistant
sleep 30
# Запуск unclutter для скрытия курсора мыши
unclutter &
# Запуск Chromium
/usr/bin/chromium-browser --start-fullscreen --app=http://localhost:8123 &
//*********************************************************************

Для отключения курсора установите sudo apt install unclutter .
Чтобы запускать Unclutter при каждой перезагрузке, просто добавьте  в свой запуск авто запуск.
unclutter &

Если у вас возникнут дополнительные вопросы или потребуется помощь с настройкой, не стесняйтесь обращаться.

