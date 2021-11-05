#!/bin/bash

source $HOME/.config/tmux-ha-aqi

aqi=$(curl -s -k -X GET \
  -H "Authorization: Bearer $HA_TOKEN" \
  -H "Content-Type: application/json" \
  $HA_ENDPOINT/api/states/sensor.u_s_air_quality_index | grep -oP '"state": "(\K[^"]*)')

printf "AQI: %s#[fg=default]" "$aqi"
