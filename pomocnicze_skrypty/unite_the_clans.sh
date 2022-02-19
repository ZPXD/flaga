#!/bin/bash

# Warcraft 2 code - win scenario instantly.

# Ten code to cheat-mode: wygrana przygody 5 komendami :)





# Nazwa użytkownika

the_user=$1
domena=$2
klucz=xd_$1
flaga_start=`pwd`/flaga

# Update paczek.
apt upgrade --yes
apt install curl --yes

#test IP domeny
HOST=$(host $DOMENA | awk '{ print $4 }')

#twoje aktualne IP
IP=$(curl -s http://checkip.amazonaws.com/)

echo ""
echo "wpisana domena: $DOMENA"
echo ""

if [ "$IP" = "$HOST" ]
then
 echo "domena jest OK"
else
 echo "domena jest zla"
fi

echo "twoje IP:"
echo "$IP"
echo "rekord A z domeny:"
echo "$HOST"

wget_output=$(wget -q "$DOMENA")
if [ $? -ne 0 ]; then
 echo "HTTP error"
else
 echo "HTTP OK"
fi


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

# How to download the key:
apt install curl --yes
server_ip=`curl -s http://checkip.amazonaws.com`
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
echo " "
if [ $(getent passwd ubuntu) ] ; then
    echo "Edytuj poniższą komendę i wklej u siebie w terminalu/powershellu na komputerze."
    echo "Pobierze się plik. Przenieś go do swojego folderu ssh."
    echo " "
    echo "scp -i [TU_WSTAW_NAZWE_SWOJEGO_KLUCZA_AWS].pem ubuntu@$server_ip:/home/ubuntu/$klucz $klucz"
    echo " "
    echo "Jest tam też plik config. Dodaj w nim poprawnie nazwę klucza"
    echo "Host moj_serwerek"
    echo "  HostName 1.1.1.1"
    echo "  User rafal_paczes"
    echo "  IdentityFile /home/rafi/.ssh/potezny_klucz_rafiego"
else
    echo "Edytuj poniższą komendę i wklej u siebie w terminalu/powershellu na komputerze."
    echo "Pobierze się plik. Przenieś go do swojego folderu ssh."
    echo " "
    echo "scp root@$server_ip:/home/$the_user/.ssh/$klucz $klucz"
    echo " "
    echo "Jest tam też plik config. Dodaj w nim poprawnie nazwę klucza"
    echo "Host moj_serwerek"
    echo "  HostName $server_ip"
    echo "  User $the_user"
    echo "  IdentityFile ~/.ssh/$klucz"
fi

# INFO:
echo " "
echo " "
echo "Stworzony użytkownik:" $the_user
echo "Stworzona strona na domenie:" $domena
echo " "
echo " "
echo " "
echo "Sprawdź Twoją domenę w przeglądarce."
echo " "
tutaj=`pwd`
echo "PS: jesteś w folderze:" $tutaj

su $the_user
cd /var/www/flaga
