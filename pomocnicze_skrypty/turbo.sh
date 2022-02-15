#!/bin/bash

# Domena.
domena=$1

# Przygotowanie katalogu /var/www na flage.
mkdir /var/www
cd /var
sudo chown -R www-data:www-data /var/www
sudo chmod -R 775 /var/www
cd /var/www

# Pobieramy git a nim repozytorium flaga i wchodzimy do srodka.
sudo apt install git
git clone https://github.com/ZPXD/flaga.git
cd /var/www/flaga

# Dogranie paczek.
sudo python3 /var/www/flaga/pomocnicze_skrypty/xD.py

# Środowisko.
python3 -m venv /var/www/flaga/flagaenv
source /var/www/flaga/flagaenv/bin/activate
export FLASK_APP=app.py
pip3 install -r requirements.txt

# Serwerowe pliki i uruchomienie usługi i serwera.
sudo python3 /var/www/flaga/pomocnicze_skrypty/xd.py $domena

