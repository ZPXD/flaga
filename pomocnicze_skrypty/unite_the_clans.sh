#!/bin/bash

# Warcraft 2 code - win scenario instantly.


# Ten code to cheat-mode: wygrana przygody 5 komendami :)

# Na świeżym serwerze:

# 1. wejdź na root (utwórz go jeżeli jeszcze nie robiłeś).
#
#    Napisz:
#    echo $USER
#    
#    jak pokazuje root to idź dalej. Jeżeli nie, utwórz hasło dla root:
#
#    sudo passwd
#    su

# 2. Update paczek.
#
#    apt update

# 3. Git.
#
#    apt install git
#    git clone https://github.com/ZPXD/flaga.git

# 4. Przypisz wartości zmiennym:
#
#    NEW_USER=ja_xd
#    DOMENA=domena.pl

# 5. Pozwól skryptowi działać i go uruchom:
#
#    source flaga/pomocnicze_skrypty/unite_the_clans.sh $NEW_USER $DOMENA 

#    gotowe!


# SCRIPT:

# Zmienne.
user=$1
domena=$2
klucz=xd_$1
flaga_start=`pwd`/flaga

# Update paczek.
apt upgrade

# Użytkownicy.
adduser $user
adduser $user sudo
adduser $user www-data
su $user

# Klucze RSA.
mkdir /home/$user/.ssh
chmod 700 /home/$user/.ssh
cd  /home/$user/.ssh
ssh-keygen -f /home/$user/.ssh/$klucz -C $USER -N ''
cat ~/.ssh/$klucz.pub > /home/$user/.ssh/authorized_keys
chmod 600 authorized_keys

# IF UBUNTU IN HOME:
if [ $? -eq 0 ]; then
    echo "UBUNTU. COPYING KEY:"
    sudo cp $klucz /home/ubuntu/$klucz
    sudo chown ubuntu:ubuntu /home/ubuntu/$klucz
fi

# var/www
mkdir /var/www
chown -R www-data:www-data /var/www
chmod -R 775 /var/w

# Flaga
cp -r $flaga_start /var/www/
rm -r $flaga_start 
chown -R $user:$user /var/www/flaga

# Dogranie paczek.
sudo python3 /var/www/flaga/pomocnicze_skrypty/xD.py

# Środowisko.
python3 -m venv /var/www/flaga/flagaenv
source /var/www/flaga/flagaenv/bin/activate
export FLASK_APP=app.py
pip3 install -r requirements.txt

# Serwerowe pliki i uruchomienie usługi i serwera.
sudo python3 /var/www/flaga/pomocnicze_skrypty/xd.py $domena

# How to download the key:
server_ip=`curl -s http://checkip.amazonaws.com`
echo $x
if [ $? -eq 0 ]; then
    echo "Get your key by using command:"
    echo "Paste below command into your terminal in computer"
    echo " while being in /.shh folder:"
    echo " "
    echo "scp -i klucz.pem ubuntu@$server_ip:/home/ubuntu/$klucz $klucz"
else
    echo "Get your key by using command:"
    echo "Paste below command into your terminal in computer"
    echo " while being in /.shh folder:"
    echo " "
    echo "scp -i klucz.pem ubuntu@$server_ip:/home/$user/.ssh/$klucz $klucz"
fi


# INFO:
echo "Stworzony użytkownik:" $USER
echo "Stworzona strona na domenie:" $domena
echo " "
echo "Sprawdź Twoją domenę w przeglądarce."
