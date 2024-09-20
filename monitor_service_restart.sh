#!/bin/bash
while true
do

# Set up Telegram bot API and chat ID
BOT_API_KEY="7460907122:AAHhRVogyCEK_OnJA-UzOuGxOodbAw0Vtcg"
CHAT_ID="206948142"

# Check if MySQL service is running  
if ! systemctl is-active --quiet mysql.service; then
  # If not running, restart and send message to Telegram
    sudo service mysql restart
    MESSAGE="MySQL Service was down. Restarting now"
    curl -s -X POST https://api.telegram.org/bot$BOT_API_KEY/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
fi

# Check if NGINX web server is running
if ! systemctl is-active --quiet nginx.service; then
  # If not running, restart and send message to Telegram
    sudo service nginx restart
    MESSAGE="Nginx Service was down. Restarting now"
    curl -s -X POST https://api.telegram.org/bot$BOT_API_KEY/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
fi

# Check if Apache web server is running
if ! systemctl is-active --quiet apache2.service; then
  # If not running, restart and send message to Telegram
    sudo service apache2 restart
    MESSAGE="Apache Service was down. Restarting now"
    curl -s -X POST https://api.telegram.org/bot$BOT_API_KEY/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
fi

# Check if PHP8.2 service is running
if ! systemctl is-active --quiet php8.2-fpm.service; then
  # If not running, restart and send message to Telegram
    sudo service php8.2-fpm restart
    MESSAGE="PHP Service was down. Restarting now"
    curl -s -X POST https://api.telegram.org/bot$BOT_API_KEY/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"
fi

sleep 1
done
