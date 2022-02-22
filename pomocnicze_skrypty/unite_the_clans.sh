#!/bin/bash

# Warcraft 2 code - win scenario instantly.






# Wersja w przebudowie








# Ten code to cheat-mode: wygrana przygody jedną komendą :)

# Na świeżym serwerze:

# 1. Odpal skrypt
# 
#    sudo su 
#    wget -q 'https://raw.githubusercontent.com/Cryst/flaga-1/main/pomocnicze_skrypty/unite_the_clans4.sh' && chmod +x unite_the_clans4.sh && ./unite_the_clans4.sh;
#
#    Skrypt zapyta o zmienne takie jak nazwa użytkownika i domena.


the_user=$1
domena=$2
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
apt -qq update --yes
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
    #echo "/!\/!\/!\ "
    #echo "PODAJ NAZWE UŻYTKOWNIKA ORAZ DOMENY, a następnie uruchom polecenie ponownie"
    #echo "/!\/!\/!\ "
    #exit
    echo "PODAJ NAZWE NOWEGO UŻYTKOWNIKA"
    read the_user
    while true; do
    echo "Czy zatwierdzić nazwę użytkownika \"$the_user\" "
    read -p "(tak - jest OK / nie - popraw / wyjdz - ewakuacja)" choice
        case "$choice" in 
            tak|t|T|yes|y|Y ) echo "ZATWIEDZONO UŻYTKOWNIKA"; break;;
            nie|n|N|no|p|popraw ) echo "PODAJ NAZWE UŻYTKOWNIKA:"; read the_user ;;
            w|wyjdz|e|exit|ewakuacja ) echo "KONCZE DZIALANIE PROGRAMU"; exit ;;
            * ) echo "dokonaj wyboru jeszcze raz";;
        esac
    done

    echo "PODAJ NAZWE TWOJEJ DOMENY:"
    read domena
    while true; do
    echo "Czy zatwierdzić nazwę domeny \"$domena\" "
    read -p "(tak - jest OK / nie - popraw / wyjdz - ewakuacja)" choice
        case "$choice" in 
            tak|t|T|yes|y|Y ) echo "ZATWIEDZONO NAZWE DOMENY"; break;;
            nie|n|N|no|p|popraw ) echo "PODAJ NAZWE DOMENY:"; read domena ;;
            w|wyjdz|e|exit|ewakuacja ) echo "KONCZE DZIALANIE PROGRAMU"; exit ;;
            * ) echo "dokonaj wyboru jeszcze raz";;
        esac
    done

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


fi

klucz=klucz_xd
#uninstall apache
systemctl stop apache
apt remove apache2 --yes
rm -r /var/www/html

wget_output=$(wget -q "$domena")
if [ $? -ne 0 ]; then
    echo "BRAK STRONY WWW, kontynuuje instalację "
else
    echo "/!\/!\/!\ "
    echo "STRONA ODPOWIADA NA HTTP, MASZ JUZ FLAGE"
    echo "/!\/!\/!\ "
    exit
fi

# Update paczek.
# apt -qq update --yes
# mv /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
# apt --yes remove openssh-server
# apt --yes install openssh-server
# apt upgrade --yes
# apt-get --yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
# mv /etc/ssh/sshd_config.bak /etc/ssh/sshd_config


# SCRIPT:
apt install git --yes
git clone https://github.com/ZPXD/flaga.git

# Clash
#source flaga/pomocnicze_skrypty/unite_the_clans3.sh $the_user $domena

# Użytkownicy.
adduser $the_user --gecos GECOS --disabled-password
adduser $the_user sudo
adduser $the_user www-data
echo "$the_user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#sed -i 's/%sudo/#%sudo/g' /etc/sudoers


if [ $(getent passwd ubuntu) ] ; then
    echo "mamy już usera ubuntu, pomijam tworzenie go"
else
    adduser ubuntu --gecos GECOS --disabled-password
    adduser ubuntu sudo
    if $(grep -q "ubuntu" /etc/sudoers) ; then
        echo "ubuntu ma już sudo"
    else
        echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
    fi
fi

# Klucze RSA.
mkdir /home/$the_user/.ssh
chmod 700 /home/$the_user/.ssh
#cd /home/$the_user/.ssh
ssh-keygen -t rsa -b 4096 -f /home/$the_user/.ssh/$klucz -C $the_user -N ''
cat /home/$the_user/.ssh/$klucz.pub > /home/$the_user/.ssh/authorized_keys
chmod 600 /home/$the_user/.ssh/authorized_keys
chown -R $the_user:$the_user /home/$the_user/.ssh

# IF UBUNTU IN HOME:
if [ $(getent passwd ubuntu) ] ; then
    echo "UBUNTU. COPYING KEY:"
    cp /home/$the_user/.ssh/$klucz /home/ubuntu/$klucz
    chown ubuntu:ubuntu /home/ubuntu/$klucz
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
systemctl enable flaga

# Tworzenie SWAP'a
if [ $(grep MemTotal /proc/meminfo | awk '{ print $2 }') -le 1200000 ] ; then 
    if $(grep -q "swap" /etc/fstab) ; then
        echo "SWAP ODNALEZIONY, pomijam tworzenie nowego"
    else
        echo "TWORZENIE SWAP"
        fallocate -l 1G /swapfile
        chmod 600 /swapfile
        mkswap /swapfile
        swapon /swapfile
        echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
    fi
    swapon --show
else 
    echo "Wystarczająco RAM, pomijam SWAP" 
fi


# STARE INFO
# STARE INFO
if [ $(getent passwd ubuntu) ] ; then
    #gdy mamy aws
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
# STARE INFO
# STARE INFO


# NOWE INFO:
clear

python3 /var/www/flaga/pomocnicze_skrypty/banner.py

echo "Stworzono użytkownika:" $the_user
echo "Stworzono stronę na domenie:" $domena
echo "Klucz do pobrania nosi nazwę:" $klucz
echo " "
echo "Sprawdź swoją stronę w przeglądarce."
echo " "
echo "W programie Visual Studio Code połącz się z serwerem i otwórz folder aktualnego użytkownika:"
echo "Kliknij prawym na $klucz na liście i wybierz opcję \"Pobierz...\" lub \"Download...\""
echo "Zapisz plik w katalogu .ssh :"
echo "Na Windows jest to katalog: \"%USERPROFILE%/.ssh/ \""
echo "Na Linux jest to katalog: \"~.ssh\ \""
echo " "
echo "Jest tam też plik config. Dodaj w nim konfigurację z poprawną nazwą nowego klucza i użytkownikiem"
echo "Host $domena"
echo "  HostName $server_ip"
echo "  User $the_user"
echo "  IdentityFile ~/.ssh/klucz_xd"
echo " "
echo "Sprawdź połączenie nowym użytkownikiem w Visual Studio Code."

su $the_user
#cd /var/www
#pwd
