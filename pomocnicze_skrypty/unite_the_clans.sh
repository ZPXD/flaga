#!/bin/bash

# Warcraft 2 code - win scenario instantly.


# Ten code to cheat-mode: wygrana przygody jedną komendą :)

# Na świeżym serwerze:

# 1. Odpal skrypt
# 
#    sudo su 
#    wget -q 'https://raw.githubusercontent.com/ZPXD/flaga/main/pomocnicze_skrypty/unite_the_clans.sh' && chmod +x unite_the_clans.sh && ./unite_the_clans5.sh && rm unite_the_clans.sh;
#
#    Skrypt zapyta o zmienne takie jak nazwa użytkownika i domena.


the_user=$1
domena=$2

flaga_start=`pwd`/flaga

if [ $USER == "root"  ] ; then
    echo "USER to root - OK"
#    echo "Użytkownik to: $the_user"   
#    echo "Domena to: $domena"
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
    echo "PODAJ NAZWE NOWEGO UŻYTKOWNIKA"
    read the_user
    while true; do
    echo "Czy zatwierdzić nazwę użytkownika \"$the_user\" "
    read -p "(tak - jest OK / nie - popraw / wyjdz - ewakuacja)" choice
        case "$choice" in 
            tak|t|T|yes|y|Y ) 
                echo "WERYFIKACJA UŻYTKOWNIKA" 
                if [ ${#the_user} -le 1 ] ; then
                    echo "ODRZUCONO NAZWĘ UŻYTKOWNIKA - jest za krótka"
                    echo "PODAJ NOWĄ NAZWĘ UŻYTKOWNIKA:"
                    read the_user 
                else 
                    echo "ZATWIEDZONO UŻYTKOWNIKA" 
                    break 
                fi
            ;;
            nie|n|N|no|p|popraw ) echo "PODAJ NAZWE UŻYTKOWNIKA:"; read the_user ;;
            w|wyjdz|e|exit|ewakuacja ) echo "KONCZE DZIALANIE PROGRAMU"; exit ;;
            * ) echo "dokonaj wyboru jeszcze raz";;
        esac
    done

    echo "PODAJ NAZWE TWOJEJ DOMENY:"
    read domena
    while true; do
    echo "Czy zatwierdzić nazwę domeny \"$domena\" "
    read -p "(tak - jest OK / nie - popraw / pomin - ignoruje test domeny / wyjdz - ewakuacja)" choice
        case "$choice" in 
            tak|t|T|yes|y|Y ) 
                echo "WERYFIKACJA DOMENY" 

                #test IP domeny
                server_ip=`curl -s http://checkip.amazonaws.com`
                dns_ip=$(host $domena | grep address | awk 'NR==1{ print $4 }')
                if [ "$server_ip" = "$dns_ip" ]
                then
                    echo "Wpisana domena jest OK"
                    break
                else
                    echo "/!\/!\/!\ "
                    echo "WPISANO ZŁĄ DOMENE!"
                    echo "podana domena: $domena"    
                    echo "TWOJ ADRES SERWERA to:"
                    echo "$server_ip"      
                    echo "TWOJA KONFIGURACJA DNS to:"
                    echo "$(host $domena)"
                    echo "Poczekaj na aktualizację DNS"
                    echo "WPISZ NAZWĘ TWOJEJ DOMENY JESZCZE RAZ:"
                    read domena
                fi
            ;;
            i|ignoruj|p|pomin|s|skip ) echo "Pomijam sprawdzanie domeny"; break ;;
            nie|n|N|no|p|popraw ) echo "PODAJ NAZWE DOMENY:"; read domena ;;
            w|wyjdz|e|exit|ewakuacja ) echo "KONCZE DZIALANIE PROGRAMU"; exit ;;
            * ) echo "dokonaj wyboru jeszcze raz";;
        esac
    done

    echo "Zweryfikowano dane"

fi

#uninstall apache
systemctl stop apache
apt remove apache2 --yes
rm -r /var/www/html

wget_output=$(wget -q "$domena")
if [ $? -ne 0 ]; then
    echo "BRAK STRONY WWW, kontynuuje instalację "
else
    echo "/!\/!\/!\ "
    echo "PRZERWANO INSTALACJĘ, SERWER ODPOWIADA NA PORCIE HTTP - MASZ JUZ STRONE WWW!"
    echo "/!\/!\/!\ "
    echo "Jeśli pomimo tego chcesz uruchomić skrypt, wyłącz stronę WWW komendą: "
    echo "systemctl stop nginx "
    exit
fi

klucz=klucz_$the_user

# SCRIPT:
apt install git --yes
git clone https://github.com/ZPXD/flaga.git

# Użytkownicy.
adduser $the_user --gecos GECOS --disabled-password --force-badname
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
    echo "KOPIOWANIE KLUCZA DO KATALOGU UBUNTU:"
    cp -f /home/$the_user/.ssh/$klucz /home/ubuntu/$klucz
    chown ubuntu:ubuntu /home/ubuntu/$klucz
fi

echo "KOPIOWANIE KLUCZA DO KATALOGU ROOT:"
cp -f /home/$the_user/.ssh/$klucz /root/$klucz

# var/www
mkdir /var/www
chown -R www-data:www-data /var/www
chmod -R 775 /var/www

# Flaga
cd /
mv -f $flaga_start /var/www

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


# INFO:
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
echo "Jest tam też plik config. Dodaj w nim konfigurację z poprawną nazwą nowego klucza i użytkownikiem:"
echo " "
echo "Host $domena"
echo "  HostName $server_ip"
echo "  User $the_user"
echo "  IdentityFile ~/.ssh/$klucz"
echo " "
echo "Sprawdź połączenie użytkownikiem $the_user w Visual Studio Code."

su $the_user
#cd /var/www
#pwd



#Cryst was here
#GetCrysted
