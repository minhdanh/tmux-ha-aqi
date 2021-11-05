#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
aqi="#($CURRENT_DIR/ha-aqi.sh)"

aqi_interpolation="\#{aqi}"

main() {
    status_right=$(tmux show-option -gqv "status-right")
    status_left=$(tmux show-option -gqv "status-left")

    status_right=${status_right/$aqi_interpolation/$aqi}

    status_left=${status_left/$aqi_interpolation/$aqi}

    tmux set-option -gq "status-right" "$status_right"
    tmux set-option -gq "status-left" "$status_left"
}
main
