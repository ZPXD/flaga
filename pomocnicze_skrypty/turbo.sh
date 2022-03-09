#!/bin/bash

# Domena.
domena=$1

# Dogranie paczek.
sudo python3 /var/www/flaga/pomocnicze_skrypty/xD.py

# Środowisko.
python3 -m venv /var/www/flaga/flagaenv
source /var/www/flaga/flagaenv/bin/activate
export FLASK_APP=app.py
pip3 install -r requirements.txt

# Serwerowe pliki i uruchomienie usługi i serwera.
sudo python3 /var/www/flaga/pomocnicze_skrypty/xd.py $domena
