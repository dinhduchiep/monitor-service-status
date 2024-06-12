#!/bin/bash
while true
do

# Set up Telegram bot API and chat ID
BOT_API_KEY="6360723418:AAF1aya50fEi6sVuOwhXp53IV19siP3gqLc"
CHAT_ID="489842337"

# Check if MySQL service is running  
if ! systemctl is-active --quiet mysql.service; then
  # If not running, restart and send message to Telegram
    sudo service mysql restart
    MESSAGE="MySQL Service was down. Restarting now"
    curl -s -X POST https://api.telegram.org/bot$BOT_API_KEY/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
fi

# Check if Nginx web server is running  (Thay bằng dịch vụ webserver trên VPS của bạn)
if ! systemctl is-active --quiet nginx.service; then
  # If not running, restart and send message to Telegram
    sudo service nginx restart
    MESSAGE="NGINX Service was down. Restarting now"
    curl -s -X POST https://api.telegram.org/bot$BOT_API_KEY/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
fi

# Check if PHP service is running (Thay bằng dịch vụ PHP trên VPS của bạn)
if ! systemctl is-active --quiet php8.1-fpm.service; then
  # If not running, restart and send message to Telegram
    sudo service php8.1-fpm restart
    MESSAGE="PHP Service was down. Restarting now"
    curl -s -X POST https://api.telegram.org/bot$BOT_API_KEY/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
fi

sleep 1
done
