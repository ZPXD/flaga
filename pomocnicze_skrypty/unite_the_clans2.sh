#!/bin/bash

# Warcraft 2 code - win scenario instantly.


# Ten code to cheat-mode: wygrana przygody 5 komendami :)

# Na świeżym serwerze:

# 1. wejdź na root (utwórz go jeżeli jeszcze nie robiłeś).
#
#    Napisz:
#    echo $USER
#    
#    jak pokazuje root to idź do kroku 2. Jeżeli nie, utwórz hasło dla root wpisując:
#
#    sudo su
#    echo $USER
#
#    i sprawdź znów pisząc "echo $USER", aż będzie pokazywać root. Jak masz błąd, spytaj na grupie o pomoc.

# 2. Przypisz wartości zmiennym:
#
#    NEW_USER=ja_xd
#    DOMENA=TU_WSTAW_NAZWE_SWOJEJ_DOMENY
   
# 3. Odpal skrypt
# 
#    wget -qO - 'https://raw.githubusercontent.com/ZPXD/flaga/main/pomocnicze_skrypty/unite_the_clans2.sh' | bash -s $NEW_USER $DOMENA
#
#    Skryp załaduje poprzednio podane zmienne.


the_user=$1
domena=$2
klucz=xd_$1
flaga_start=`pwd`/flaga

if [ $USER == "root"  ] ; then
    echo "USER to root - OK"
    echo "Użytkownik to: $the_user"   
    echo "Domena to: $domena"
else
    echo "/!\/!\/!\ "
    echo "PRZELOGUJ SIE NA ROOTa, wpisz:"
    echo "sudo su"
    echo "/!\/!\/!\ "
    exit
fi

# instalacja curl do weryfikacji domeny:
apt -qq  update --yes
apt -qq install curl --yes




if [ $# == "2"  ] ; then
    echo "Weryfikowanie danych"
    #test IP domeny
    server_ip=`curl -s http://checkip.amazonaws.com`
    dns_ip=$(host $domena | awk '{ print $4 }')

    if [ "$server_ip" = "$dns_ip" ]
    then
        echo "Wpisana domena jest OK"
    else
        echo "/!\/!\/!\ "
        echo "WPISANA ZLA DOMENE!"
        echo "podana domena: $domena"    
        echo "TWOJ ADRES SERWERA to:"
        echo "$server_ip"      
        echo "TWOJA KONFIGURACJA DNS:"
        echo "$(host $domena)"
        echo "jeśli chcesz zmienić domenę to wpisz:"
        echo "DOMENA=twoja.domena.pl"
        echo "/!\/!\/!\ "
        exit
    fi

else
    echo "/!\/!\/!\ "
    echo "PODAJ NAZWE UŻYTKOWNIKA ORAZ DOMENY, a następnie uruchom polecenie ponownie"
    echo "/!\/!\/!\ "
    exit
fi





wget_output=$(wget -q "$domena")
if [ $? -ne 0 ]; then
    echo "HTTP error"
else
    echo "/!\/!\/!\ "
    echo "STRONA ODPOWIADA NA HTTP, MASZ JUZ FLAGE"
    echo "/!\/!\/!\ "
    exit
fi






# Update paczek.
apt -qq update --yes
apt upgrade --yes

# SCRIPT:
apt install git --yes
git clone https://github.com/ZPXD/flaga.git

# Clash
source flaga/pomocnicze_skrypty/unite_the_clans.sh $the_user $domena

# Użytkownicy.
adduser $the_user --gecos GECOS --disabled-password
adduser $the_user sudo
adduser $the_user www-data


# Klucze RSA.
mkdir /home/$the_user/.ssh
chmod 700 /home/$the_user/.ssh
cd  /home/$the_user/.ssh
ssh-keygen -f /home/$the_user/.ssh/$klucz -C $the_user -N ''
cat /home/$the_user/.ssh/$klucz.pub > /home/$the_user/.ssh/authorized_keys
chmod 600 /home/$the_user/.ssh/authorized_keys
chown $the_user:$the_user /home/$the_user/.ssh
# IF UBUNTU IN HOME:
if [ $(getent passwd ubuntu) ] ; then
    echo "UBUNTU. COPYING KEY:"
    sudo cp $klucz /home/ubuntu/$klucz
    sudo chown ubuntu:ubuntu /home/ubuntu/$klucz
fi

# var/www
mkdir /var/www
chown -R www-data:www-data /var/www
chmod -R 775 /var/www

# Flaga
cd /
mv $flaga_start /var/www

# Dogranie paczek.
python3 /var/www/flaga/pomocnicze_skrypty/xD.py

# Środowisko.
python3 -m venv /var/www/flaga/flagaenv
source /var/www/flaga/flagaenv/bin/activate
export FLASK_APP=app.py
pip3 install -r /var/www/flaga/requirements.txt

# Serwerowe pliki i uruchomienie usługi i serwera.
python3 /var/www/flaga/pomocnicze_skrypty/xd.py $domena

chown -R $the_user:$the_user /var/www/flaga


if [ $(getent passwd ubuntu) ] ; then
    #gdy mamy ubunut
    echo "Edytuj poniższą komendę i wklej u siebie w terminalu/powershellu na komputerze."
    echo "Pobierze się plik. Przenieś go do swojego folderu ssh."
    echo " "
    echo "scp -i [NAZWA_KLUCZA_AWS].pem ubuntu@$server_ip:/home/ubuntu/$klucz $klucz"
    echo " "
    echo "Jest tam też plik config. Dodaj w nim konfigurację z poprawną nazwą nowego klucza"
    echo "Host $domena"
    echo "  HostName $server_ip"
    echo "  User $the_user"
    echo "  IdentityFile ~/.ssh/$klucz"
else
    #gdy mamy home.pl lub micr.us
    echo "Edytuj poniższą komendę i wklej u siebie w terminalu/powershellu na komputerze."
    echo "Pobierze się plik. Przenieś go do swojego folderu ssh."
    echo " "
    echo "scp root@$server_ip:/root/.ssh/$klucz $klucz"
    echo " "
    echo "Jest tam też plik config. Dodaj w nim konfigurację z poprawną nazwą nowego klucza"
    echo "Host $domena"
    echo "  HostName $server_ip"
    echo "  User $the_user"
    echo "  IdentityFile ~/.ssh/$klucz"
fi

# INFO:
clear
echo "Stworzony użytkownik:" $the_user
echo "Stworzona strona na domenie:" $domena
echo " "
echo "Sprawdź Twoją domenę w przeglądarce."

su $the_user
#cd /var/www
#pwd
