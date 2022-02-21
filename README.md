# Flaga

W tym repozytorium znajduje się tutaj cały kod do zainstalowania na serwerze aby przygotować się do zajęć, przygotować zdobyty serwer i postawić na nim stronę internetową z Twoją flagą.


## Szturm na AWS:

Rozpocznij szturm, zdobądź serwer, postaw stronę www i zawieś flagę. 
Albo wróć do szturmu tam gdzie skończyłeś:


- [Etap 1 - Wprowadzenie i przygotowania - Instrukcje](http://bityl.pl/4TWc5)
- [Etap 2 - Anonimowość - Instrukcje](http://bityl.pl/irUcO)
- [Etap 3 - Edytor kodu VSCode - Instrukcje](http://bityl.pl/7yKAX)
- [Etap 4.1 - Zdobądź serwer - Instrukcje](http://bityl.pl/jNbnY)
- [Etap 4.2.A - Zdobądź serwer - Droga Home - Instrukcje](http://bityl.pl/8tLm2)
- [Etap 4.2.B - Zdobądź serwer - Droga AWS - Instrukcje](http://bityl.pl/i3YCE)
- [Etap 4.3 - Zdobądź serwer: połączenie z serwerem przez VSCode](vfC2s)
- [Etap 5 - Domena - Instrukcje](http://bityl.pl/Q86MW)
- [Etap 6 - GitHub - Instrukcje](http://bityl.pl/wwI8j)
- [Etap 7.A - Strona www i Flaga - droga ASAP - Instrukcje]( http://bityl.pl/o7IM4)
- [Etap 7.B - Strona www i Flaga - droga klasyczna - Instrukcje]( http://bityl.pl/BcfxJ)
- [Etap 8 - Materiały i Jupyter - Instrukcje](http://bityl.pl/7efYd)
- [Etap 9 - Pomoc - Instrukcje](http://bityl.pl/QKsi4)
- [Etap 10 - Rozdroże - Instrukcje](http://bityl.pl/g7LrS)


#### Ważne linki:

- [Szturm na AWS - Formularz](https://zajecia-programowania-xd.pl/szturm_na_aws/caly_formularz)
- [Szturm na AWS - Discord (Tu jesteśmy na żywo)](https://discord.gg/46JVvHgzqz)
- [Szturm na AWS - Film krok po kroku](https://www.youtube.com/playlist?list=PLaPjE0og8b6Lof4yYXJmdRv5coaVePmI5)



### Mam serwer, przypisaną domenę, VSC i chcę szybko dołączyć do zajęć. Co robić?

## Droga ASAP:

Po zalogowaniu na serwer:

#### 1. wejdź na root (utwórz go jeżeli jeszcze nie robiłeś).
```
echo $USER
```
Jak pokazuje root to idź do kroku 2. Jeżeli nie, utwórz hasło dla root wpisując:
```
sudo su
```
I sprawdź znów pisząc "echo $USER", aż będzie pokazywać root. Jak masz błąd, spytaj na grupie o pomoc.

#### 2. Uruchom skrypt:
```
wget -q 'https://raw.githubusercontent.com/ZPXD/flaga/main/pomocnicze_skrypty/unite_the_clans.sh' && chmod +x unite_the_clans.sh && ./unite_the_clans.sh;
```

#### 3. Pobierz klucz RSA i edytuj plik ~/.ssh/config aby łączyć się ze swoim serwerem, jako użytkownik.

Jak masz serwer w AWS: 
```
scp -i NAZWA_KLUCZA_PEM.pem ubuntu@NUMER_IP:/home/ubuntu/NAZWA_KLUCZA NAZWA_KLUCZA
```
Jak masz serwer VPS z Home:
```
scp root@NUMER_IP:/home/NAZWA_UZYTKOWNIKA_NA_SERWERZE/.ssh/NAZWA_KLUCZA NAZWA_KLUCZA
```
Klucz wrzuć do folderu .ssh i dodaj go do pola w pliku .ssh/config wg. wzoru:

```
Host moj_serwerek
  HostName 1.1.1.1
  User rafal_paczes
  IdentityFile /home/rafi/.ssh/potezny_klucz_rafiego
```

Gotowe! Pobaw się flagą, zmień coś (zobacz etap 8 w tym pliku) lub idź dalej. 

#### 4. Ruszaj dalej. Jesteś już blisko:

- [Etap 8 - Materiały i Jupyter - Instrukcje](http://bityl.pl/7efYd)
- [Etap 9 - Pomoc - Instrukcje](http://bityl.pl/QKsi4)
- [Etap 10 - Rozdroże - Instrukcje](http://bityl.pl/g7LrS)
- [Szturm na AWS - wypełnij formularz aby dołączyć do Zajęć Programowania xD](https://zajecia-programowania-xd.pl/szturm_na_aws/caly_formularz)



## Flagi: 

Zawisło już ponad 750 flag. Zobacz je na:
https://zajecia-programowania-xd.pl/flagi
