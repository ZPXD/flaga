# Szturm na AWS 

## Etap 4.2.B - Zdobądź serwer - droga AWS EC2 serwer Linux Ubuntu 20 


#### Cel:
- Zdobądź konto  i serwer na AWS
- Poustawiaj co trzeba (http rules, inbound, elastic IP) aby serwer działał sprawnie.
- Poznaj login i adres IP do swojego serwera, pobierz klucz do folderu .ssh.


#### Uwagi wstępne:
1. Założenie konta Free Tier (darmowego) na AWS i tak wymaga posiadania karty kredytowej i podania jej numerów podczas rejestracji.
2. Jeżeli zrobimy wszystko wg. Instrukcji, będzie ok, ale bywa, że AWS nalicza dodatkowe opłaty jak przekroczymy jakieś limity bo np. Ktoś coś źle ustawi, albo np. Nieumyślnie zapuści jakiś program który zje mu całe zasoby obliczeniowe. Będziemy przed tym robić zapory, ale trzeba wiedzieć, że jest takie ryzyko. Kilka osób na własną rękę ustawiało już np. Elastic IP i naliczyło niektórym po $0.01 czy $0.04. Niby nic, ale lepiej tego uniknąć. Na VPS z drogi A takich atrakcji nie będzie.
3. Wszystko z głową.




#### Plan
  
#### 1. Zakładanie konta Free Tier na AWS:

http://bityl.pl/TIlmq 


#### 2. Zdobądź serwer EC2 Ubuntu na AWS:

http://bityl.pl/j4vWK 

#### 3. Ustaw Inbound rules.

http://bityl.pl/tMeyP 

#### 4. Ustaw Elastic IP:

Video (6 min): https://www.youtube.com/watch?v=9Uu2VKoot-c (Autor: Cryst, Bohater Szturmu na AWS)

Instrukcja: http://bityl.pl/A27lv (Autor: @obiekt_626#8860, Bohater Szturmu na AWS)

#### 5. KROK DODATKOWY: Usuwanie instancji na AWS:

Ten krok możesz wykonać opcjonalnie jak coś namieszasz i zechcesz zacząć od początku.
Jeżeli wszystko jest w porządku, pomiń ten krok i wróć tutaj później w miarę potrzeb.
https://www.youtube.com/watch?v=ykeW7Jw1K6E 

Następnie należy postawić instancję jeszcze raz wg. instrukcji etapu z postawieniem serwera (krok 2,3).

#### 6. KROK DODATKOWY: Zatrzymywanie instancji AWS:

To krok dodatkowy, na razie możesz go pominąć. Wróć tutaj później w miarę potrzeb.
W tym kroku dowiesz się jak zatrzymać na jakiś czas pracę serwera.

#### 7. Sprawdź czy masz wszystko pod ręką:

1. login - na AWS na początku zawsze ubuntu
2. adres ip serwera - tu sprawdzisz jaki masz adres ip: http://bityl.pl/l2Oee 
3. klucz.pem który pobrałeś - sprawdź czy jest w folderze .ssh

Jeżeli serwer jest zdobyty i masz te wszystkie 3 informacje zapisane w notatniku, 
możesz ruszać dalej. Czas połączyć się z Twoim serwerem. 

#### Wsparcie:

[Pomoc na discordzie dla problemów związanych z Etapem 4](https://discord.gg/8YQAaBHh3u)



**Przejdź dalej:** 

[Etap 4.3 - Zdobądź serwer: połączenie z serwerem przez VSCode](https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_4_3_zdobadz_serwer_polaczenie.md)
