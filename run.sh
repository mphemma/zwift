#!/bin/bash

CONFIG_PATH=/data/options.json

username=$(jq --raw-output ".username" $CONFIG_PATH)
password=$(jq --raw-output ".password" $CONFIG_PATH)
player_id=$(jq --raw-output ".player_id" $CONFIG_PATH)
mqtt_host_name=$(jq --raw-output ".mqtt_host_name" $CONFIG_PATH)
mqtt_client_name=$(jq --raw-output ".mqtt_client_name" $CONFIG_PATH)
mqtt_login=$(jq --raw-output ".mqtt_login" $CONFIG_PATH)
mqtt_pw=$(jq --raw-output ".mqtt_pw" $CONFIG_PATH)
mqtt_topic=$(jq --raw-output ".mqtt_topic" $CONFIG_PATH)
mqtt_topic_will=$(jq --raw-output ".mqtt_topic_will" $CONFIG_PATH)


if [ -f /config.py ];
then
    rm /config.py
fi

echo "username='${username}'" >> /config.py
echo "password='${password}'" >> /config.py
echo "player_id=${player_id}" >> /config.py
echo "mqtt_host_name='${mqtt_host_name}'" >> /config.py
echo "mqtt_client_name='${mqtt_client_name}'" >> /config.py
echo "mqtt_login='${mqtt_login}'" >> /config.py
echo "mqtt_pw='${mqtt_pw}'" >> /config.py
echo "mqtt_topic='${mqtt_topic}'" >> /config.py
echo "mqtt_topic_will='${mqtt_topic_will}'" >> /config.py

python /mqtt-zwift.py

