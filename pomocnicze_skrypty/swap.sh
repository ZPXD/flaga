# Jeżeli po instalacji u siebie na serwerze przez VSCode Jupuytera alba innych rzeczy nie 
# możesz nic robić na serwerze, odpal ten skrypt. Po prostu włącz ten program.

# aby odpalić: wejdź na root (sudo su)
# i wpisz: bash swap.sh

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
