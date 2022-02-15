Witaj

Jesteś na **GitHub**'ie i czytasz właśnie plik **README.md** który znajduje się wewnątrz **repozytorium Flaga** z 7 i 8 etapu Szturmu na AWS.

#### W tym etapie w 6 krokach:
- wejdziesz na serwer
- przygotujesz go
- pobierzesz repozytorium z flagą,
- utworzysz nowe środowisko programistyczne
- w którym uruchomisz i udostępnisz w sieci stronę www napisaną w pythonie
- i jeżeli wszystko zadziała, przejdziesz do etapu 8 i powiesisz flagę. Zaczynajmy!

#### 1. Start. Wejdź na serwer.
Aby zacżąć włącz terminal (lub powershell) i połącz się ze swoim serwerem. Jeżeli nie wiesz jak to powróć do etapu 5:
- http://bityl.pl/6X3gF
### Porządek na serwie:

#### Home:

Otwórz terminal/powershell i wpisz:

```
ssh root@1.1.1.1
```
#### AWS: 
Będąc w folderze xD, gdzie masz klucz .pem. Włącz terminal (lub jak masz Windowsa, to powershell i kliknij na pasek z adresem folderu i otworzy Ci się powershell). Wpisz tam:
```
ssh -i nazwaklucza.pem ubuntu@1.1.1.1 
```



#### Resetowanie serwera
Od teraz, gdyby coś poszło nie tak, zawsze możesz zrestartować serwer i zacząć od nowa:
- http://bityl.pl/Bmvwu

#### Krok jedynie dla serwerów na AWS:
Dla serwerów postawionych na AWS najpierw dodatkowo ustawiamy uprawnienia root ("administratora"). Skopiuj poniższe komendy i wklej do terminala.
```
sudo passwd   # <----- To dla AWS tylkooo! Podaj hasło i zapisz. Wpisz jeszcze poniższe i podaj hasło.
su -          # <----- Od teraz będziesz jako 'root'.
```

#### Użytkownik

Napisz w terminalu poniższy kod zamieńiając XXX na nazwę jaką chcesz mieć jako użytkownik Twojego serwera.
```
NEW_USER=XXXX
```
Stworzyłeś zmienną NEW_USER. Teraz możesz ją wywoływać zawsze pisząc jej nazwę ze znakiem dolara.
```
echo $NEW_USER
```

#### root

Taką samą stałą, wbudowaną jest $USER. Zawsze pokazuje aktualnego użytkownika. Wpisz:
```
echo $USER
```
Jeżeli wszystko zrobiłeś prawidłowo, pojawi Ci się: **root**. Root to coś jak administrator. Ma nawet swój folder o ścieżce /root do którego tylko on ma dostęp. Wszystko co ma przypisane uprawnienia **root** możesz robić z jego poziomu. Ty jednak chcesz stworzyć nowego użytkownika.

Czas stworzyć użytkownika o takiej nazwie jak chcesz.

Będziesz pytany o numer telefonu, pokoju i inne rzeczy - wszystko pomijaj naciskając enter.

Wklej poniższy kod aby stworzyć użytkownika o takiej nazwie jaką wartość przypisałeś do NEW_USER.
```
adduser --disabled-password $NEW_USER
```
I poniższy kod aby przypisać go do grupy www-data (potrzebnej np. do postawienia strony www) i do grupy sudo (potrzebnej do wykonywania operacji z poziomu użytkownika **root**).
```
adduser $NEW_USER www-data
adduser $NEW_USER sudo
```

2. Sprawdź czy jesteś w grupie sudo i www-data:
```        
groups $NEW_USER 
```
Wyświetli się: $USER : $USER www-data sudo


#### Chodzenie pomiędzy użytkownikami:
```
su $USER
sudo su ubuntu
su -
exit
```

#### Logujemy się i idziemy dalej:

```
su $USER
```
#### Sudo.

```
apt install git
```

```
sudo apt install tree
```


#### 2. Uaktualniamy paczki (packages).
```
sudo apt update
sudo apt upgrade
```
W trakcie instalacji gdy proces się zatrzymuje z zapytaniem "Do you want to continue? [Y/n]" na końcu, napisz "Y" aby przejść dalej.

PS: w plikach **README.md** kod umieszcza się w takiej ramce jak poniżej.
```
pwd
```
Nie musisz ręcznie go przepisywać. Możesz łatwo skopiować, najedź myszką na tę ramkę wyżej i w prawym rogu a pokaże się przycisk - kliknij i masz skopiowany tekst. Teraz możesz wkleić kod, w zależności czy jesteś w powershellu czy w terminalu:
- **terminal:** (linux, mac) klikając jednocześnie ctrl+shift+v
- **powershell:** (windows) klikając prawym przyciskiem myszy.



#### TWORZENIE KLUCZA ".rsa"

Stwórz klucz:

```
cd /home/$USER # czy sie da, jak nie nowy katalog
mkdir /home/$USER/.ssh
chmod 700 .ssh
cd  /home/$USER/.ssh
ssh-keygen -f /home/$USER/.ssh/xd_NAZWA_UZYTKOWNIKA_TWOJA -C $USER -N ''
cat ~/.ssh/xd_NAZWA_UZYTKOWNIKA_TWOJA.pub > authorized_keys
chmod 600 authorized_keys
```

Sprawdź, czy klucz został stworzony. 

```
ls
```
Pojawią się 2 klucze o nazwie xd_$USER. W przeciwnym razie powtórz albo daj znać, 
że potrzebujesz pomocy.

#### POBRANIE KLUCZA rsa .pub

1. Wchodzisz do katalogu xD w terminal/powershell
2. Uprawnienia katalogu 

```
scp root@46.41.135.4:/var/www/zpxd NAZWA_KLUCZA NAZWA_KLUCZA
scp -i twoj_klucz.pem ubuntu@46.41.135.4:/home/$USER/.ssh/NAZWA_KLUCZA NAZWA_KLUCZA
```
3. Zobacz ls, powinieneś widzieć plik NAZWA_KLUCZA. 
```
ls
```

4. Skopiuj swoją ścieżkę folderu xD i wklej do notatnika podreczne_xd. Dodaj do tego po ukośniku NAZWA_KLUCZA.

Na linuxie to było by:

```
sciezka_pliku_pub = /home/$USER/xD/NAZWA_KLUCZA
```
Na windowsie:

```
sciezka_pliku_pub = C://......
```

Zapisz ją w notatkach podreczne_xd.

#### ŁĄCZENIE PRZEZ KLUCZ ".rsa"

1. Otwórz terminal/powershell w katalogu i wpisz:

```
ssh -i NAZWA_KLUCZA $USER@$$IP
```

Działa? Zostaw w tle, przyda się potem. Nie działa? Spróbuj jeszcze raz, pomyśl, albo daj znać na pomocy.













#### Folder /var/www.

Poza tym na AWS trzeba stworzyć folder, gdzie będziemy trzymać Twoją stronę z flagą: mkdir i nazwa folderu: /var/www
```
mkdir /var/www 2>1    # <---- Czyli stwórz katalog var wewnątrz którego znajduje się pusty katalog www. Stwórz: /var/www
cd /var
sudo chmod -R www-data:www-data /var/www
cd /www
```

#### 3. Git.
Instalujemy git'a, pobieramy repozytorium i rozkładamy manatki.
```
git clone https://github.com/ZPXD/flaga.git # <--- wklej dokładnie tą linię do terminala
cd flaga
sudo python3 xD.py # <---- z dużej litery xD.py a nie xd.py z małej litery.
```
PS: Tak jak się domyślasz, terminal nie czyta niczego po znaku "#" zobacz samemu, wpisz:
```
ls # sdfgsdfgsdgsgjpodgksg
```

#### 4. Wewnątrz środowiska (env).
Wszystkie polecenia wykonywane w tym kroku są wykonywane w folderze /var/www/flaga .

Upewnij się w jakim folderze jesteś, napisz:
```
pwd
```
Teraz, zobacz ale jeszcze nie wpisuj poniższych 3 komend:

```
python3 -m venv flagaenv      # Stwórz środowisko flagenv używając venv.
source flagaenv/bin/activate  # Aktywuj środowisko flagaenv
export FLASK_APP=app.py       # I zapisz zmienną FLASK_APP równą app.py (nazwie programu strony www) 
```
Teraz skopiuj wszystkie 3 linie i spróbuj je wkleić w terminalu. Po ostatniej komendzie naciśnij enter.

#### Instalacja wymaganych bibliotek.
Użyjemy do tego **pip3** - to narzędzie którym pobieramy w pythonie potrzebne biblioteki. We fladze używamy dodatkowo pliku **requirements.txt**, który jest niczym innym jak listą nazw i wersji bibliotek które będą.
```
pip3 install -r requirements.txt
```

#### Następnie podaj swoją domenę.
Napisz:
```
nano settings.ini
```
po spacji wpisz nazwę swojej domeny np (bez "www") wg wzoru:
```
domena = nazwa_domeny.pl
```
Aby zapisać wciśnij ctrl+s Aby zamknąć wciśnij ctrl+x

Uruchom skrypt przygotowujący hosting na serwerze (1 raz).
```
sudp python3 xd.py
```
#### Restart nginxa i serwisów.
```
sudo systemctl daemon-reload
sudo systemctl restart nginx
sudo systemctl restart flaga.service
```

#### Zobacz czy strona działa. Działa? Wyślij komuś, pochwal się i powróć do:
- [strona 7 etapu Szturmu na AWS](https://zajecia-programowania-xd.pl/szturm_na_aws/7)
- [discord 7 etapu Szturmu na AWS](https://discord.gg/NjKvJeYZtB)



## Etap 8: Flaga.

Urządź się tu :) Będąc dalej na serwerze, w folderze /var/www/flaga edytuj zawartość pliku xd.txt. Dodaj tam coś od siebie.
```
cd /var/www/flaga
nano xd.txt
```
Zobacz na stronie www czy działa :)

Ostatnie co zostało, to edycja flagi. Twoja flaga aby przejść dalej musi spełniać 3 kryteria
- być widoczna w sieci, czyli działać - to mamy
- jest na niej "xD" - to też już mamy
- oraz jest coś napisane poza "xDDD" - to mamy do zrobienia.

Bedąc dalej w folderze /var/www/flaga edytuj plik flaga_xd.txt. "xDDD" + coś od siebie. Dzięki temu będzie można sprawdzić czy ukończyłeś ten etap.
```
nano /templates/xd.html
```

Przeładuj:
```
sudo systemctl restart flaga.service
```

Zobacz na stronie www czy działa :) - dodaj do swojego adresu "/xd" czyli jak masz domenę "kubus-puchatek.pl" to wpisz "kubus-puchatek.pl/xd".


#### Gotowe?
Możesz opuścić Terminal pisząć

```
exit
```

A strona nadal będzie stała w internecie.

#### Jeżeli postawiłeś stronę www, flagę i edytowałeś ją to przeszedłeś ten etap i idź dalej:
- [strona 8 etapu Szturmu na AWS](https://zajecia-programowania-xd.pl/szturm_na_aws/8)
- [discord 8 etapu Szturmu na AWS](https://discord.gg/S5bN7TCAYq)

#### Flagi: 

Zawisło już ponad 650 flag. Zobacz je na:
https://zajecia-programowania-xd.pl/flagi
