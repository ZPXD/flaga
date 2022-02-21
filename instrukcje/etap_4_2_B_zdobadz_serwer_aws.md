## Etap 4.2.B - Zdobądź serwer - droga AWS EC2 Ubuntu Linux 


Kto zna login i adres IP do swojego serwera - kliknijcie poniżej.
    AWS
    - założenie konta AWS i zapisanie klucza w folderze .ssh
    - elastic IP
    - http rules, inbound
    - zapisanie ip i ubuntu do pliku config



Kto zna login i adres IP do swojego serwera - kliknijcie poniżej.



	AWS
	- założenie konta AWS i zapisanie klucza w folderze .ssh
	- elastic IP
	- http rules, inbound
	- zapisanie ip i ubuntu do pliku config


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

#### Wsparcie:

[Pomoc na discordzie dla problemów związanych z Etapem 4](https://discord.gg/8YQAaBHh3u)


**Przejdź dalej:** [Etap 4.3 - Zdobądź serwer: połączenie z serwerem przez VSCode](http://bityl.pl/nYH1X)
