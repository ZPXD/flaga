# Szturm na AWS

## Etap 4.3 - Zdobądź serwer: połączenie z serwerem przez VSCode

Masz już VSCode, masz serwer, znasz jego login, adres ip, wiesz gdzie jest folder .ssh.

[Zobacz jak połączyć się z serwerem przez VSCode](http://bityl.pl/nYH1X)


#### Cel:
Wejdź na Twój serwer przez VSCode.

#### Plan:

#### 1. Otwórz VSCode i zainstaluj rozszeżenie Remote-SSH.


#### 2. Połącz się z serwerem aby sprowokować otworzenie pliku config w folderze .ssh


#### 3. Otwórz z .ssh plik config i wklej tam w zalezności od tego czy masz server w Home czy w AWS:

Tu będzie też kilka słów więcej o pliku config i folderze .ssh.


#### config dla Home:
```
Host xd_root
  HostName 1.1.1.1
  User root
	
Host xd
  HostName 1.1.1.1
  User xd
  IdentityFile "~/.ssh/tu_wstaw_nazwe_klucza"
```

#### config dla AWS:

```
Host xd_ubuntu
  HostName 1.1.1.1
  User ubuntu
  IdentityFile "~/.ssh/tu_wstaw_nazwe_klucza.pem"

Host xd
  HostName 1.1.1.1
  User moja_nazwa_uzytkownika
  IdentityFile "~/.ssh/tu_wstaw_nazwe_klucza"
```

#### 3. Upewnij się, że jesteś jako root na serwerze. ("administratorem").

Zobacz czy jesteś na serwerze jako **root**. Poniższa komenda pokaże Ci root, ubuntu albo inną nazwę.
```
echo $USER
``` 
Jeżeli nie jesteś root, to bądź :) Jeżeli jesteś na np. ubuntu, ustaw **root**.
```
sudo passwd
su
echo $USER
```

#### 4. Update paczek.

Uaktualnij paczki :) 

```
apt update
```




#### 7. Krok dodatkowy: Spróbuj się połączyć z serwerem terminala/powershell ; )

Na windowsie 10 możesz szybko włączyć powershell, nie ważne w jakim folderze jesteś:
- **linux/mac terminal:** (linux, mac) klikając jednocześnie **ctrl+shift+t**
- **windows powershell:** (windows) otwórz folder w którym chcesz otworzyć terminal i kliknij w adres i napisz tam powershell - otworzy się. Od teraz, nie ważne czy jesteś na powershellu czy w terminalu, będę na tego typu okno mówił terminal, a powershell używał jedynie gdy będę opisywał coś co dotyczy konkretnie powershella.

Jeżeli terminal/powershell otworzy się, wpisz:
```
ssh xd_root
```
Działa? Super! :))) Możesz zacżąć bawić się swoim terminalem/powershellem.
Nie działa? Spoko, pomówimy o tym w przyszłości. Narazie to nie takie ważne, idź dalej :)

yt : https://www.youtube.com/watch?v=upcSexk1UfU&t=1s
txt: http://bityl.pl/6X3gF

**Serwer zdobyty!**

Teraz połącz się aby zacząć na nim tworzyć. Będziesz pisać tu programy, udostępniać je w sieci i robić wiele innych rzeczy. 





#### Wsparcie:

[Pomoc na discordzie dla problemów związanych z Etapem 4](https://discord.gg/8YQAaBHh3u)


**Przejdź dalej:** [Etap 5 - Domena - Instrukcje](http://bityl.pl/Q86MW)

