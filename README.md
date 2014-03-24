[![Code Climate](https://codeclimate.com/github/bguest/bathrooms.png)](https://codeclimate.com/github/bguest/bathrooms) [![Build Status](https://travis-ci.org/bguest/bathrooms.png?branch=master)](https://travis-ci.org/bguest/bathrooms)[![Coverage Status](https://coveralls.io/repos/bguest/bathrooms/badge.png?branch=master)](https://coveralls.io/r/bguest/bathrooms?branch=master)[![Dependency Status](https://gemnasium.com/bguest/bathrooms.png)](https://gemnasium.com/bguest/bathrooms)

#About

Bathroom monitoring Raspberry pi, runs rails app to let employees who
can't see the bathrooms know weather or not the bathroom is being used. Pictures and blog post to
come.

#Contact
benguest@gmail.com

#Raspberry Pi

## Connections

| RaspberryPi  | Lead Wire | SH - 3535 -  WS2801 | 5V WS2801-16P STRIP |
|:-------------|:----------|:--------------------|:--------------------|
| (Power)      | RED       | +12V - Red          | 5V       - Black    |
| CLK (Clock)  | BLACK     | CLK  - White        | CI -> CO - Green    |
| MOSI         | GREEN     | DAT  - Green        | DI -> DO - Red      |
| GND (Ground) | BLACK     | GND  - Blue         | GND      - Blue     |

## Setup

See RaspberryPi_Setup.md

## TODO

1. Add reset button next to sign that turns off all leds
2. Update running sign when update sign effects

### Notes

ssh pi@raspberrypi.local
sudo ifconfig <— ipaddress

cd `gem env gemdir`

ps -ef | grep thin
df -h  du                 # disk usage

sudo ./a.out

sudo shutdown -h now
