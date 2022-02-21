## Etap 4 - Zdobądź serwer


- [Etap 4.1 - Zdobądź serwer - Film](http://bityl.pl/hrFwi)
- [Etap 4 - Zdobądź serwer - Discord](https://discord.gg/8YQAaBHh3u)

	Filmy Szturmowe 4:

	Etap 4.1 - Zdobądź serwer: wybór
	Etap 4.2.A - Zdobądź serwer: Droga Home
	Etap 4.2.B - Zdobądź serwer: Droga AWS
	Etap 4.3 - Zdobądź serwer: Połączenie z serwerem przez VSCode

	Cel:
	Zdobądź serwer i połącz się z nim przez VSCode.



	Etap 4.1 - Zdobądź serwer: wybór

	Cel:
	Wybierz którą drogą pójdziesz. Home, AWS czy inną.


	A. Serwer VPS Ubuntu - Home.  ( ~ 20zł/m) 

	Proponuję tę drogę dla świętego spokoju - mamy support po Polsku, w miarę stabilne środowisko i łatwo każdemu wyjaśnić gdzie co jest. Mniej zmartwień niż na AWS oraz masz taki sam panel jak my wszyscy więc łatwiej sobie w razie czego pomóc. Otwarcie mówię, że mam 80 groszy od serwera od Home więc kosze na was górę złota gdy to wybieracie, jak kilka osób kliknie to będę miał na wegetariańskiego kebaba.

	Plusy i minusy:
	+ Obsługa PL 24/7
	- Płatny ok. 20zł/m

	 B. Serwer AWS EC2 Ubuntu z Free Tier (darmowy). 

	Plusy i minusy:
	+ Darmowy na rok
	- Zmienne IP sprawia, że trzeba więcej się naklikać
	- Trzeba podać numery karty kredytowej
	- Może naliczyć dodatkowe opłaty jak coś nabroimy [rzadkie. będę to omawiał na video]
	- Obsługa dosyć powolna (nawet kilka dni) po angielsku

	 C. Serwer VPS Ubuntu - inne opcje. (~10-50zł/m)

	Plusy i minusy:
	+ Sam wybierasz gdzie kupujesz serwer z jego waletami i zadami
	- Jak coś się skiepści to możemy nie wiedzieć jak Ci pomóc



	
	Etap 4.2.A - Zdobądź serwer: Droga Home


	Cel: 
	Zdobycie serwera.


	Plan:

	1. Zdobądź Server VPS na home.pl
	http://bityl.pl/hhLNr 

	2. Logowanie do panelu
	
	3. Reinstalacja systemu (Ubuntu 20)

	4. Ustaw hasło. (zapisz sobie gdzieś na kartce)

	5. Otwórz plik ~/.ssh/config i wklej tam:
	
	Host xd_root
  	  HostName 1.1.1.1
      User root
	
    Host xd
  	  HostName 1.1.1.1
      User 
      IdentityFile "~/.ssh/tu_wstaw_nazwe_klucza"
	

	6. Spróbuj się połączyć z terminala/powershell ; )

	ssh xd_root

	Działa? Super! :)))
	Nie działa? Spoko, zaraz to zrobimy z VSC :)
	Idź dalej :)



	
	Etap 4.3 - Zdobądź serwer: Połączenie z serwerem przez VSCode


	Cel: 
	Wejdź na Twój serwer przez VSCode.


	Plan:

	1. Otwórz VSCode i zainstaluj rozszeżenie Remote-SSH.

	2. Połącz się.

	
	3. Upewnij się, że jesteś jako root na serwerze. ("administratorem").

	echo $USER


	4. Update paczek.

	apt update



	AWS
	- założenie konta AWS i zapisanie klucza w folderze .ssh
	- elastic IP
	- http rules, inbound
	- zapisanie ip i ubuntu do pliku config

.

Etap zaczyna się od wyboru jednej z 3 dróg 
**Cel:** a kończy gdy umiesz połączyć się ze zdobytym serwerem ze swojego komputera.

**Instrukcja:**
http://bityl.pl/0KCAV

Wybierz serwer. W razie czego wybór można po czasie zmienić:

** A. Serwer VPS Ubuntu - Home.  ( ~ 20zł/m) **

Proponuję tę drogę dla świętego spokoju - mamy support po Polsku, w miarę stabilne środowisko i łatwo każdemu wyjaśnić gdzie co jest. Mniej zmartwień niż na AWS oraz masz taki sam panel jak my wszyscy więc łatwiej sobie w razie czego pomóc. Otwarcie mówię, że mam 80 groszy od serwera od Home więc kosze na was górę złota gdy to wybieracie, jak kilka osób kliknie to będę miał na wegetariańskiego kebaba.

Plusy i minusy:
+ Obsługa PL 24/7
- Płatny ok. 20zł/m

** B. Serwer AWS EC2 Ubuntu z Free Tier (darmowy). **

Plusy i minusy:
+ Darmowy na rok
- Zmienne IP sprawia, że trzeba więcej się naklikać
- Trzeba podać numery karty kredytowej
- Może naliczyć dodatkowe opłaty jak coś nabroimy [rzadkie. będę to omawiał na video]
- Obsługa dosyć powolna (nawet kilka dni) po angielsku

** C. Serwer VPS Ubuntu - inne opcje. (~10-50zł/m)**

Plusy i minusy:
+ Sam wybierasz gdzie kupujesz serwer z jego waletami i zadami
- Jak coś się skiepści to możemy nie wiedzieć jak Ci pomóc

**Serwer zdobyty? Podaj IP swojego serwera na zajęcia:**
https://zajecia-programowania-xd.pl/szturm_na_aws/4
- wybór serwera

    HOME
    - kupno serwera
    - reisntalacja systemu
    - ustawienie hasła
    - zapisanie ip i root do pliku config

    AWS
    - założenie konta AWS i zapisanie klucza w folderze .ssh
    - elastic IP
    - http rules, inbound
    - zapisanie ip i ubuntu do pliku config

    - Remote-SSH i połączenie przez VSC
    - root
    - apt

Kto zna login i adres IP do swojego serwera - kliknijcie poniżej.


**Przejdź dalej:** [Etap 4.2.A - Zdobądź serwer - Droga Home - Instrukcje](http://bityl.pl/8tLm2)
**Przejdź dalej:** [Etap 4.2.B - Zdobądź serwer - Droga AWS - Instrukcje](http://bityl.pl/i3YCE)
