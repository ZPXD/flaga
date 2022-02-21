## Etap 4.3 - Zdobądź serwer: połączenie z serwerem przez VSCode


- [Etap 4.1 - Zdobądź serwer - Film](http://bityl.pl/hrFwi)
- [Etap 4.2.A - Zdobądź serwer - Droga Home - Film](http://bityl.pl/NheyZ)
- [Etap 4.3 - Zdobądź serwer: połączenie z serwerem przez VSCode](http://bityl.pl/nYH1X)

[Pomoc na discordzie dla problemów związanych z Etapem 4](https://discord.gg/8YQAaBHh3u)

    - Remote-SSH i połączenie przez VSC
    - root
    - apt

	
Etap 4.3 - Zdobądź serwer: Połączenie z serwerem przez VSCode


	Cel: 
	Wejdź na Twój serwer przez VSCode.


4. Otwórz korzystając z VSCode plik config w katalogu .ssh i wklej tam:

 ```
Host xd_root
  HostName 1.1.1.1
  User root
	
Host xd
  HostName 1.1.1.1
  User 
  IdentityFile "~/.ssh/tu_wstaw_nazwe_klucza"
```

5. Spróbuj się połączyć z terminala/powershell ; )
```
ssh xd_root
```

Działa? Super! :))) Nie działa? Spoko, zaraz to zrobimy z VSC :) Idź dalej :)


	Plan:

	1. Otwórz VSCode i zainstaluj rozszeżenie Remote-SSH.

	2. Połącz się.

	
	3. Upewnij się, że jesteś jako root na serwerze. ("administratorem").

	echo $USER


	4. Update paczek.

	apt update



**Serwer zdobyty!**

Teraz połącz się aby zacząć na nim tworzyć. Będziesz pisać tu programy, udostępniać je w sieci i robić wiele innych rzeczy. 

**Cel:** wygrywasz w momencie gdy wejdziesz na Twój serwer.

**Instrukcja:**
yt : https://www.youtube.com/watch?v=upcSexk1UfU&t=1s
txt: http://bityl.pl/6X3gF

Aby zacząć etap upewnij się, że masz wszystkie ważne informacje pod ręką:
- login, 
- adres ip i 
- hasło albo klucz.pem. 

Jeżeli brakuje Ci któregoś z nich, cofnij się jeszcze raz do poprzedniego etapu. 
W instrukcjach jest jasno przedstawione jak zgromadzić te informacje.

**Udało się? Daj znać, że wszystko gra:**
https://zajecia-programowania-xd.pl/szturm_na_aws/5
[tu mogło by być w sumie coś w stylu "pingnij x" w przyszłości.]


- że wiesz, jak szybko włączyć terminal, nie ważne w jakim folderze jesteś:
 **terminal:** (linux, mac) klikając jednocześnie **ctrl+shift+t**
 **powershell:** (windows) otwórz folder w którym chcesz otworzyć terminal i kliknij w adres i napisz tam powershell - otworzy się.
Powershell/terminal: Windows: kliknij ścieżkę w folderze xD
![alt text](https://i.imgur.com/6mxKsAY.gif "Powershell gif")
PS: od teraz, nie ważne czy jesteś na powershellu czy w terminalu, będę na tego typu okno mówił terminal, a powershell używał jedynie gdy będę opisywał coś co dotyczy konkretnie powershella.


**Przejdź dalej:** [Etap 5 - Domena - Instrukcje](http://bityl.pl/Q86MW)

