Witaj

Jesteś na **GitHub**'ie i czytasz właśnie plik **README.md** który znajduje się wewnątrz **repozytorium** flaga z instrukcjami 5, 7 i 8 etapu Szturmu na AWS.

#### Z pomocą tego skryptu:
- wejdziesz na zdobyty serwer
- przygotujesz go
- pobierzesz repozytorium z flagą,
- utworzysz nowe środowisko programistyczne
- w którym uruchomisz i udostępnisz w sieci stronę www napisaną w pythonie
- i jeżeli wszystko zadziała, przejdziesz do etapu 8 i powiesisz flagę. 

Zaczynajmy!

#### Aha, jeszcze jedno. Zadbajmy o szybkość, bądź szybki jak wiatr dzięki 4 rzeczom:

- Upewnij się, że masz już stworzony **folder xD** w którym masz wszystkie potrzebne rzeczy (w tym np. klucz jak taki dostałeś zdobywając serwer AWS, serwery Home go nie mają) 
- że masz **zakładkę xD** w której masz wszystkie podręczne linki dzięki którym szybko przywołasz potrzebne informacje
- że wiesz, jak szybko włączyć terminal, nie ważne w jakim folderze jesteś:
 **terminal:** (linux, mac) klikając jednocześnie **ctrl+shift+t**
 **powershell:** (windows) otwórz folder w którym chcesz otworzyć terminal i kliknij w adres i napisz tam powershell - otworzy się.
- Oraz, że wiesz, że jeżeli coś tu nie działa, a zwłaszcza jeżeli masz starszy system, to zawsze dobrze zrobisz jak napiszesz na kanale pomocy.
Powershell/terminal: Windows: kliknij ścieżkę w folderze xD
![alt text](https://i.imgur.com/6mxKsAY.gif "Powershell gif")
PS: od teraz, nie ważne czy jesteś na powershellu czy w terminalu, będę na tego typu okno mówił terminal, a powershell używał jedynie gdy będę opisywał coś co dotyczy konkretnie powershella.

## ETAP 5 - serwer

Czas połączyć się z Twoim serwerem i przygotować go. W tym etapie:
- połączenie z serwerem
- awaryjnie: restart
- root 
- użytkownik
- sudo i uaktualniamy paczki (packages).
- tworzymy klucz RSA
- pobieramy z serwera klucz RSA
- łaczymy się z serwerem

### 1. Połącz się ze swoim serwerem:

(Jeżeli nie wiesz jak to powróć do dokumentu z etapu 5: [Jak połączyć się z serwerem](http://bityl.pl/6X3gF) ). Wpisz:

#### A. Home:
```
ssh root@1.1.1.1
```
#### B. AWS: 
Będąc w folderze xD, gdzie masz klucz .pem wpisz:
```
ssh -i nazwaklucza.pem ubuntu@1.1.1.1 
```
#### C. A po ukończeniu poniższych kroków, będziesz łączyć się:
Otwierając terminal w **dowolnym** miejscu i pisząc:
```
ssh moj_serwerek
```

### 2. Pssst! 
Od teraz, gdyby coś poszło nie tak, zawsze możesz zrestartować serwer i zacząć od nowa: [Resetowanie Serwera](http://bityl.pl/Bmvwu). To potrwa ok 5-10 minut i będziesz mógł zacząć od nowa. Raczej tego nie rób jak nie trzeba - stracisz wszystko co jest na serwerze.

### 3. Root.

#### Root (teraz już wszyscy robią poniższe kroki).

Pewną stałą wbudowaną w system jest $USER. Zawsze pokazuje aktualnego użytkownika. Wpisz:
```
echo $USER
```

Jeżeli wszystko zrobiłeś prawidłowo, pojawi Ci się: **root**. Chyba, że jesteś na AWS, to pokaże Ci się **ubuntu**. Root to coś jak administrator. Ma nawet swój folder o ścieżce /root do którego tylko on ma dostęp. Wszystko co ma przypisane uprawnienia **root** możesz robić z jego poziomu. Ty jednak chcesz stworzyć nowego użytkownika. 

Jednak najpierw, minuta dla AWS'owców.

#### Poniższe kilka linijek jest jedynie dla serwerów na AWS (nie na np. Home):

Dla serwerów postawionych na AWS najpierw dodatkowo ustawiamy uprawnienia root ("administratora"). Skopiuj poniższe komendy i wklej do terminala.
```
sudo passwd   # <----- Wpisz hasło i zapisz je sobie gdzieś.
su -          # <----- Tak logujesz się na użytkownika 'root'.
```
Teraz jesteś jako root.


### 4. Użytkownik

Użytkownik to to jako kto jesteś na serwerze. Zwykli użytkownicy mają inne uprawnienia niż root. Nie mogą robić pewnych rzeczy i wchodzić w pewne miejsca.

Napisz w terminalu poniższy kod zamieńiając XXX na nazwę jaką chcesz mieć jako użytkownik Twojego serwera.
Nazwa nie może zawierać spacji i specjalnych znaków.
```
NEW_USER=XXXX
```
Stworzyłeś zmienną NEW_USER. Teraz możesz ją wywoływać zawsze pisząc jej nazwę ze znakiem dolara.
```
echo $NEW_USER
```

#### Tworzymy użytkownika.

Czas stworzyć użytkownika o takiej nazwie jak chcesz.

Będziesz pytany o numer telefonu, pokoju i inne rzeczy - wszystko pomijaj naciskając enter.

Wklej poniższy kod aby stworzyć użytkownika o takiej nazwie jaką wartość przypisałeś do NEW_USER.
```
adduser $NEW_USER
```
I poniższy kod aby przypisać go do grupy www-data (potrzebnej np. do postawienia strony www) i do grupy sudo (potrzebnej do wykonywania operacji z poziomu użytkownika **root**).


#### Przy tej okazji, mały boost.

Nie musisz kodu ręcznie go przepisywać. Możesz łatwo skopiować, najedź myszką na tę ramkę wyżej i w prawym rogu a pokaże się przycisk - kliknij i masz skopiowany tekst. Oczywiście możesz robić to także ręcznie. Ważna rzecz: **możesz jednocześnie skopiować i wkleić do terminala wiele linii kodu** Teraz możesz wkleić kod, w zależności czy jesteś w powershellu czy w terminalu:
- **terminal:** (linux, mac) klikając jednocześnie ctrl+shift+v
- **powershell:** (windows) klikając prawym przyciskiem myszy.

```
adduser $NEW_USER www-data
adduser $NEW_USER sudo
```

Sprawdź czy jesteś w grupie sudo i www-data:
```        
groups $NEW_USER 
```
Wyświetli się: $USER : $USER www-data sudo

#### Katalog domowy.

Od teraz też masz swój nowy domowy katalog. Narazie nic tam nie ma. Gdy będziesz się logował na swojego użytkownika, tutaj będziesz się pojawiał
```
cd /home/$NEW_USER
pwd
```

#### Chodzenie pomiędzy użytkownikami:

Jak przełączać użytkowników? Wejście na Twojego użytkownika: su + nazwa Twojego użytkownika.
```
su $NEW_USER
```

Tego nie wpisuj: Wejście spowrotem na **root**:
```
su root
```
Tego nie wpisuj: Gdybyś miał jeszcze innego użytkownia, wszedł byś na niego pisząc (nie zadziała):
```
su inny_uzytkownik
```

### 5. Sudo i uaktualniamy paczki (packages).

Jako użytkownik, pewnych rzeczy robić nie możesz. Np. wchodzić na niektóre foldery, modyfikować pewnych plików czy ich w pewnych miejscach tworzyć. Ani nie możesz instalować nowych paczek. 

#### Pytanie [Y/n]

PS: w trakcie różnych instalacji gdy proces się zatrzymuje z zapytaniem "Do you want to continue? [Y/n]" na końcu, napisz "Y" aby przejść dalej.

#### Zaktualizuj paczki:
```
apt update 
```
Nie działa. A spróbuj z sudo:
```
sudo apt update 
```
Działa. Podnieś wersję paczek:
```
sudo apt upgrade
```
Teraz upewniliśmy się, że paczki na naszym serwerze są zaktualizowane. Czasem wchodząc na nowy serwer mamy doczynienia z niezłym skansenem i zawsze warto to zrobić przed całą resztą.

Dzięki sudo możesz robić takie rzeczy jak instalacje. Zwłąszcza takie które mają wpływ na bardziej systemowe rzeczy, jak np. powyższe aktualizowanie paczek, 

#### Upewnij się gdzie jesteś:

Napisz pwd a poznasz ścieżkę katalogu w którym jesteś.
```
pwd
```
Gdziekolwiek jesteś, przenieś się do swojego katalogu domowego. Zrobisz to używając komendy cd.

#### Teleportacja.

Przeniesiesz do dowolnego katalogu pisząc cd + ścieżka. Lećmy do Twojego katalogu domowego.
```
cd /home/$USER
```

### 6. Tworzenie klucza ".rsa"

Stwórz klucz RSA :)

Stwórz katalog .ssh pisząc mkdir + ścieżka folderu.
```
mkdir /home/$USER/.ssh
```

Nadaj mu wymagane uprawnienia i wejdź do środka:
```
chmod 700 .ssh
cd  /home/$USER/.ssh
```
Nazwij swoje klucze rsa. Bez spacji, znaków specjalnych. Najlepiej tak abyś kojarzył to z Twoim użytkownikiem i serwerem, projektem, np. klucz=xd_moj_uzytkownik:
```
klucz=NAZWA_KLUCZA
```
Stwórz parę kluczy RSA: prywatny i publiczny. Zapisz publiczny do authorized_keys i ustaw mu uprawnienia na 600 używając chmod. Wklej poniższe (to gęstsze komendy, ale nie martw się tym aż tak, opowiemy wszystko na zajęciach):
```
ssh-keygen -f /home/$USER/.ssh/$klucz -C $USER -N ''
cat ~/.ssh/$klucz.pub > authorized_keys
chmod 600 authorized_keys
```

Sprawdź, czy klucz został stworzony. 
```
ls
```
Pojawią się 2 klucze o nazwie xd_$USER. W przeciwnym razie powtórz te kroki albo daj znać, 
że potrzebujesz pomocy.

### 7. Pobieranie z serwera KLUCZA rsa .pub

Teraz sprawmy abyś mógł się logować. Potrzebujemy pobrać do Twojego katalogu xD nowoutworzony klucz prywatny (bez dopisku .pub).

#### Ci z was, którzy są na AWS muszą zrobić dodatkowy krok.
Trzeba przygotować klucz do pobrania. Narazie nie możemy zrobić tego tutaj, bo nasz użytkownik główny to ubuntu. Trzeba skopiować klucz i nadać mu właściwe uprawnienia, pobrać go przez ubuntu i dopiero będzie można go używać na naszym nowym użytkowniku i dać mu jego uprawnienia. W tym celu dwie linie:
```
sudo cp $klucz /home/ubuntu/$klucz
sudo chown ubuntu:ubuntu /home/ubuntu/$klucz
```
Gotowe. 

#### Wejdź będąc w katalogu xD w drugi terminal/powershell

Aby pobrać klucz na komputer wejdź do folderu xD w terminalu i edytuj w poniższej komendzie:
- NUMER_IP - numer ip Twojego serwera, masz to w notatkach,
- NAZWA_UŻYTKOWNIKA - taka jaką stworzyłeś,
- NAZWA_KLUCZA - taka jaką stworzyłeś.
Komenda dla VPS Ubuntu w Home:
```
scp root@NUMER_IP:/home/NAZWA_UŻYTKOWNIKA/.ssh/NAZWA_KLUCZA NAZWA_KLUCZA
```
Komenda dla AWS EC2 Ubuntu (tu jest jeszcze jedna zmienna):
- NAZWA_KLUCZA_PEM - ten klucz który dostałeś tworząc serwer.
```
scp -i NAZWA_KLUCZA_PEM.pem ubuntu@NUMER_IP:/home/ubuntu/NAZWA_KLUCZA NAZWA_KLUCZA
```

Zobacz ls, powinieneś widzieć plik NAZWA_KLUCZA. 
```
ls
```

### 8. Łączenie przez klucz ".rsa"

Otwórz terminal/powershell w katalogu i wpisz:
```
ssh -i NAZWA_KLUCZA NAZWA_UŻYTKOWNIKA@$NUMER_IP
```

Działa? To nie wszystko. Daj:
```
exit
```


#### Ustawmy szybkie łączenie się:

1. Otwórz folder xD i skopiuj znajdujący się tam klucz który właśnie popbrałeś.
2. Znajdź u siebie folder .ssh Powinien być w folderze Twojego użytkownika.
3. Wklej do środka .ssh Twój klucz który przed chwilą skopiowałeś w kroku 1.
4. W środku .ssh znajdź plik config (w windowsie jest to Config) - lub stwórz go. 
5. Otwórz go i usuń w nim wszystkie wzmianki o Twoim serwerze (bloki zaczynające się od Host, w których jest ip Twojego serwera.
6. W środku wklej:
```
Host TUTAJ_WPISZ_JAKAS_FAJNA_NAZWE_KROTKA_xD
  HostName TU_WPISZ_IP_TWOJEGO_SERWERA_xD
  User TU_WPISZ_JAK_NAZYWA_SIE_TWOJ_UZYTKOWNIK
  IdentityFile TU_WPISZ_PELNA_SCIEZKE_DO_KLUCZA_RSA
```
Przykład:
```
Host moj_serwerek
  HostName 1.1.1.1
  User rafal_paczes
  IdentityFile /home/rafi/.ssh/potezny_klucz_rafiego
```

#### Od teraz będziesz mógł łączyć się z dowolnego serwera pisząc:
ssh + to co wpisałeś wyżej po prawej stronie słowa Host. Np:
```
ssh moj_serwerek
```
I jesteś.



## Etap 6 - łączenie domeny z serwerm:

Wróć tu za chwilę. Teraz zobacz tutaj: [łączenie domeny z serwerem](http://bityl.pl/C4xbH).

Przyniesz domenę do serwera w panelu. To zabierze z 5 minut, zaraz tu wrócisz.

## Etap 7 - WWW

Postaw stronę www tak, abyśmy widzieli ją w sieci.

- miejsce na stronę: folder /var/www
- git
- Instalacja paczek systemowych wymaganych do postawienia strony.
- Wewnątrz środowiska (env).
- Instalacja wymaganych bibliotek.
- Stworzenie plików z informacjami dla serwera aby wystawił stronę (nginx i gunicorn).
- Restart nginxa i serwisów.
- Moja strona działa!


### 1. Miejsce na stronę: Folder /var/www 


Poza tym na AWS trzeba stworzyć folder, gdzie będziemy trzymać Twoją stronę z flagą: mkdir i nazwa folderu: /var/www. Dodaj 2>1 aby nie wyświetlało błędu, jeżeli folder już istnieje. I wejdź do /var.
```
mkdir /var/www
cd /var
```
Jeżeli ten katalog już istnieje (będzie błąd) - jest ok - idź dalej.

W środku znajduje się katalog www. Tam będziemy trzymać strony. Nadaj mu uprawnienia które pozwolą potem na dostęp do plików danych. I wejdź do środka.
```
sudo chown -R www-data:www-data /var/www
sudo chmod -R 775 /var/www
cd /var/www
```

### 2. Git.

Instalujemy git'a. To narzędzie do pobierania repozytoriów czyli powiedźmy projektów, aplikacji. My pobieramy repozytorium flagi, które zawiera wszystko czego potrzeba abyś postawił stronę www i zawiesił flagę. Zainstaluj go używając apt, co zrobisz jako użytkownik tylko, jak pamiętasz, używając sudo.
```
sudo apt install git
```
I pobieramy (to) repozytorium i rozkładamy manatki.
```
git clone https://github.com/ZPXD/flaga.git
```

I wejdź do flagi.
```
cd flaga
```
Wszystkie polecenia od teraz do końca skryptu wykonywane są wykonywane w folderze /var/www/flaga .

PS: Zawsze możesz sprawdzić w którym folderze jesteś, pisząc:
```
pwd
```

### 3. Domena.

Ustaw nazwę aplikacji i MODYFIKUJ nazwę domeny.:
```
export FLASK_APP=app.py
domena=TUTAJ_WPISZ.pl
echo 'Moja domena to:' $domena
```

Domena się nie zgadza? Popraw powyższe. Zgadza? Chodźmy dalej.


### Wybór a. Etap 7 - Tryb szybki.

Jeżeli chcesz przejść etap 7 szybko to po prostu wklej ten cały kod. Jednak więcej się nauczysz przechodząc ten etap krok po kroku, nawet gdy nie znasz 90% tych rzeczy. To hartuje i daje dobre podstawy na przyszłość. Ewentualnie wróć tutaj później. Oto kod na szybko:

```
chmod +x pomocnicze_skrypty/turbo.sh
source pomocnicze_skrypty/turbo.sh $domena
```

I wejdź w przeglądarce na adres swojej strony www. Działa? Pewnie, że działa. Gratulacje! Leć do etapu 8. Ale jeszcze lepiej, przeczytaj całość poniżej. Zobaczysz co się dzieje pod spodem i wiele się nauczysz.

#### Wybór b. Etap 7 - Tryb klasyczny.

Chcesz dowiedzieć się trochę co się dzieje pod maską, samemu to poczuć i przeklikać? Świetny wybór, czegoś się nauczysz albo chociaż nabierzesz obycia i doświadczenia. Do dzieła.

#### Instalacja paczek systemowych wymaganych do postawienia strony.

Uruchom skrypt pythona który zawiera serię komend dla linuxa, które zrealizuje automatycznie. Jeżeli jesteś ciekaw co to za komendy możesz podejrzeć plik pisząc cat + nazwa_pliku (**cat /var/www/flaga/pomocnicze_skrypty/xD.py** ).
PS: chodzi o xD.py z dużej litery xD.py a nie xd.py z małej litery.
```
sudo python3 /var/www/flaga/pomocnicze_skrypty/xD.py
```
PS: Tak jak się domyślasz, terminal nie czyta niczego po znaku "#" zobacz samemu, wpisz:
```
ls # sdfgsdfgsdgsgjpodgksg
```

### 4. Wewnątrz środowiska (env).

Wszystkie polecenia wykonywane w tym kroku są wykonywane w folderze /var/www/flaga .

Upewnij się w jakim folderze jesteś, napisz:
```
pwd
```
Jeżeli to nie /var/www/flaga to napisz w terminalu:
```
cd /var/www/flaga
```

Stwórz środowisko:
```
python3 -m venv flagaenv      # Stwórz środowisko flagenv używając venv.
source flagaenv/bin/activate  # Aktywuj środowisko flagaenv
export FLASK_APP=app.py       # I zapisz zmienną FLASK_APP równą app.py (nazwie programu strony www) 
```

#### Instalacja wymaganych bibliotek.
Użyjemy do tego **pip3** - to narzędzie którym pobieramy w pythonie potrzebne biblioteki. We fladze używamy dodatkowo pliku **requirements.txt**, który jest niczym innym jak listą nazw i wersji bibliotek które będą.
```
pip3 install -r requirements.txt
```

#### 6. Dodanie domeny.
Napisz:
```
nano settings.ini
```
po spacji wpisz nazwę swojej domeny np (bez "www") wg wzoru:
```
domena = nazwa_domeny.pl
```
Aby zapisać wciśnij ctrl+s Aby zamknąć wciśnij ctrl+x

PS: możesz też zrobić to definiując zmienną w bashu np:
```
domena=nazwa_domeny.pl
echo $domena
```

#### 7. Stworzenie plików z informacjami dla serwera aby wystawił stronę (nginx i gunicorn).
Uruchom skrypt przygotowujący hosting na serwerze (1 raz).
```
sudo python3 pomocnicze_skrypty/xd.py 
```
lub, jeżeli zdefiniowałeś zmienną, napisz:
```
sudo python3 pomocnicze_skrypty/xd.py $domena
```

#### Restart nginxa i serwisów. To zadziało się automatycznie. Nie musisz tego robić.

To przyda Ci się za każdym razem, gdy po modyfikacji plików html lub programu app.py będziesz chciał zobaczyć zmiany na stronie.
```
sudo systemctl daemon-reload
sudo systemctl restart nginx
sudo systemctl restart flaga.service
```
lub, jeżeli chcesz, napisałem skrypt który to robi za Ciebie.
```
sudo python3 pomocnicze_skrypty/reload.py
```
#### Gdyby coś poszło nie tak w kroku 6 i 7
Użyj tej komendy a cofniesz się do początku kroku 6.

Jeżeli modyfikowałeś zmienną domena, wpisz:
```
python3 pomocnicze_skrypty/usun_pliki_konfiguracyjne.py $domena
```
Jeżeli modyfikowałeś plik settings.ini, albo to i to, to użyj:
```
python3 pomocnicze_skrypty/usun_pliki_konfiguracyjne.py
```

### 8. Zobacz czy strona działa!

Wejdź na adres Twoje strony w wyszukiwarkę. Zobacz czy strona działa. Nie? Pogłówkuj trochę i/lub napisz na pomoc. 

Działa? Wyślij komuś, pochwal się komuś.

Powróć do:
- [strona 7 etapu Szturmu na AWS](https://zajecia-programowania-xd.pl/szturm_na_aws/7)
- [discord 7 etapu Szturmu na AWS](https://discord.gg/NjKvJeYZtB)



## Etap 8: Flaga.

- Edytuj plik tekstowy którego treść widać na Twojej stronie.
- Zobaczy czy na stronie jest nowa treść!
- Stwórz nową zakładkę wymaganą do przejścia szturmu!
- Zobacz czy zakładka działa :)


#### Edytuj plik tekstowy którego treść widać na Twojej stronie.

Urządź się tu :) Będąc dalej na serwerze, w folderze /var/www/flaga edytuj zawartość pliku xd.txt. Dodaj tam coś od siebie.
```
cd /var/www/flaga
nano dane/xd.txt
```

#### Zobaczy czy na stronie jest nowa treść!


Zobacz na stronie www czy działa :)


#### Stwórz nową zakładkę wymaganą do przejścia szturmu!

Ostatnie co zostało, to edycja zakładki /xd flagi. Twoja flaga aby przejść dalej musi spełniać 3 kryteria. 
- być widoczna w sieci, czyli działać - to mamy
- w zakładce xd jest na niej "xD" - to też już mamy
- w zakladce xd jest na niej coś napisane poza "xDDD" - to mamy do zrobienia.

Wejdź w przeglądarce na adres swojej strony www i dopisz **/xd** - to Twoja zakładka /xd.

Bedąc dalej w folderze /var/www/flaga edytuj plik templates/xd.txt. Zobacz, jest tam w 12 linii "xDDD". Zostaw xD (z dowolną ilością "D") i: dodaj coś od siebie. Dzięki temu będzie można sprawdzić czy ukończyłeś ten etap. Zrób to tak:
```
nano templates/xd.html
```
To plik html. Dodaj coś w 12 linii pomiędzy znakami ">" a "</h1>".
```
<h1 style="text-align:center">xDDD TUTAJ OD SIEBIE DOPISZ :) </h1>
```
Przeładuj:
```
sudo systemctl restart flaga.service
```
lub
```
sudo python3 pomocnicze_skrypty/reload.py
```

#### Zobacz czy zakładka działa :)

Zobacz na stronie www czy działa :) - dodaj do swojego adresu "/xd" czyli jak masz domenę "kubus-puchatek.pl" to wpisz "kubus-puchatek.pl/xd".


#### Gotowe?
Możesz opuścić Terminal pisząć:

Najpierw aby się wylogować:
```
exit
```
Potem aby opuścić terminal:
```
exit
```
A strona nadal będzie stała w internecie.


#### Jeżeli postawiłeś stronę www, flagę i edytowałeś ją to przeszedłeś ten etap i idź dalej:
- [strona 8 etapu Szturmu na AWS](https://zajecia-programowania-xd.pl/szturm_na_aws/8)
- [discord 8 etapu Szturmu na AWS](https://discord.gg/S5bN7TCAYq)

#### Flagi: 

Zawisło już ponad 750 flag. Zobacz je na:
https://zajecia-programowania-xd.pl/flagi
