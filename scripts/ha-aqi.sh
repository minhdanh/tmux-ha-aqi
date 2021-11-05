#!/bin/bash

source $HOME/.config/tmux-ha-aqi

raw_aqi=$(curl -s -k -X GET \
  -H "Authorization: Bearer $HA_TOKEN" \
  -H "Content-Type: application/json" \
  $HA_ENDPOINT/api/states/sensor.u_s_air_quality_index | grep -oP '"state": "(\K[^"]*)')

aqi="#[fg=green]$raw_aqi"
if [[ -z "$raw_aqi" ]]; then
  aqi="#[fg=default]N/A"
fi
if [[ "$raw_aqi" -gt "50" ]]; then
  aqi="#[fg=yellow]$raw_aqi"
fi
if [[ "$raw_aqi" -gt "100" ]]; then
  aqi="#[fg=orange]$raw_aqi"
fi
if [[ "$raw_aqi" -gt "150" ]]; then
  aqi="#[fg=red]$raw_aqi"
fi
if [[ "$raw_aqi" -gt "200" ]]; then
  aqi="#[fg=purple]$raw_aqi"
fi
if [[ "$raw_aqi" -gt "300" ]]; then
  aqi="#[fg=brown]$raw_aqi"
fi
printf "#[fg=blue]AQI: %s#[fg=default]" "$aqi"
