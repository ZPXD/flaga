# Flaga

W tym repozytorium znajduje się tutaj cały kod do zainstalowania na serwerze aby przygotować się do zajęć, przygotować zdobyty serwer i postawić na nim stronę internetową z Twoją flagą.


## Szturm na AWS:

To przygoda otwierająca zajęcia programowania xD

Czas trwania: ok 120-180 minut, chociaz można tu spędzić wiele czasu i często wracać, ciągle ucząc się nowych rzeczy i poznając świetnych ludzi. Jak masz już trochę doświadczenia i wiesz co robisz, to uda Ci się powiesić flagę w ok. 30 minut.

### Cel
Przygotuj wszystko czego trzeba aby rozpocząć naukę programowania na Zajęciach Programowania xD. 
Zdoądź serwer, postaw stronę www i powieś flagę. Pomóż innym.
Poznaj niesamowitych ludzi i zobacz jak u nas jest :)
 
### Wygrana: 
Daje dodstęp do aktywnego uczestnictwa w rocznych darmowych Zajęć Programowania xD

Rozpocznij szturm, zdobądź serwer, postaw stronę www i zawieś flagę. 
Albo wróć do szturmu tam gdzie skończyłeś:

- [Etap 1 - Wprowadzenie i przygotowania - Instrukcje](https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_1_przygotowania.md)
- [Etap 2 - Anonimowość - Instrukcje](https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_2_anonimowosc.md)
- [Etap 3 - Edytor kodu VSCode - Instrukcje](https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_3_edytor_kodu_vscode.md)
- [Etap 4.1 - Zdobądź serwer - Instrukcje](https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_4_1_zdobadz_serwer.md)
- [Etap 4.2.A - Zdobądź serwer - Droga Home - Instrukcje](https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_4_2_A_zdobadz_serwer_home.md)
- [Etap 4.2.B - Zdobądź serwer - Droga AWS - Instrukcje](https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_4_2_B_zdobadz_serwer_aws.md)
- [Etap 4.3 - Zdobądź serwer: połączenie z serwerem przez VSCode](https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_4_3_zdobadz_serwer_polaczenie.md)
- [Etap 5 - Domena - Instrukcje](https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_5_domena.md)
- [Etap 6 - GitHub - Instrukcje](https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_6_github.md)
- [Etap 7.A - Strona www i Flaga - droga ASAP - Instrukcje]( https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_7_ASAP_strona_www_i_flaga.md)
- [Etap 7.B - Strona www i Flaga - droga klasyczna - Instrukcje]( https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_7_Klasyczna_strona_www_i_flaga.md)
- [Etap 8 - Materiały i Jupyter - Instrukcje](https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_8_materialy_i_jupyter.md)
- [Etap 9 - Pomoc - Instrukcje](https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_9_pomoc.md)
- [Etap 10 - Rozdroże - Instrukcje](https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_10_rozdroze.md)


#### Ważne linki:

- [Szturm na AWS - Discord (Tu jesteśmy na żywo)](https://discord.gg/46JVvHgzqz)
- [Szturm na AWS - Film krok po kroku](https://www.youtube.com/playlist?list=PLaPjE0og8b6Lof4yYXJmdRv5coaVePmI5)
- [Szturm na AWS - Formularz aby dołączyć do Zajęć Programowania xD](https://zajecia-programowania-xd.pl/szturm_na_aws/caly_formularz)


# Droga ASAP (dołącz w 5 minut):

## Jeżeli masz już
- serwer na zajęcia i przypisaną do niego domenę na zajęcia
- Githuba na zajęcia, VSCode i Jupytera

To możesz skorzystać z drogi ASAP 

Ale i tak wróć tutaj i przejdź wszystkie etapy pokolei, poczytaj o funkcjach które wywołujesz, poprzeglądaj kod. Poznaj się z ludźmi, pomóż komuś. To świetna zabawa i poczujesz klimat.

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

#### 2. Uruchom skrypt unite_the_clans.sh stawiający wszystko za Ciebie:

```
wget -q 'https://raw.githubusercontent.com/ZPXD/flaga/main/pomocnicze_skrypty/unite_the_clans.sh' && chmod +x unite_the_clans.sh && ./unite_the_clans.sh;
```
Teraz masz:
- użytkownika
- klucz RSA
- Twoja strona www stoi w internecie

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

I sprawdź połączenie z serwerem przez VSC korzystając ze skrótu dla Twojego użytkownika (to co jest obok słowa Host w pliku config np. xd lub moj_serwerek).

#### 4. Modyfikuj flagę aby było na niej coś poza "xD". To konieczne aby dołączyć do zajęć.

Pobaw się flagą, zmień coś (zobacz etap 8 w tym pliku) lub idź dalej. 

#### 5. Ruszaj dalej. Jesteś już blisko:
- [Etap 9 - Leć komuś pomóc - Instrukcje](https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_10_rozdroze.md)
- [Etap 10 - Leć do nas na zamek - Instrukcje](https://github.com/ZPXD/flaga/blob/main/instrukcje/etap_9_pomoc.md)
- [I wypełnij formularz aby dołączyć do Zajęć Programowania xD](https://zajecia-programowania-xd.pl/szturm_na_aws/caly_formularz)

#### Gotowe?

**Przyjdź o 18:00 i zaprezentuj flagę:** 
[Zajęcia Programowania xD - Discord (Tu jesteśmy na żywo)](https://discord.gg/9rc3KJdJCa)

## Flagi: 

Zawisło już ponad 750 flag. Zobacz je na:
https://zajecia-programowania-xd.pl/flagi
