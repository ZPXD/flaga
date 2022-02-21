# Szturm na AWS 

## Etap 4.2.A - Zdobądź serwer- droga Home serwer VPS Linux Ubuntu 20 

[Zobacz film jak zdobyć serwer drogą Home](http://bityl.pl/NheyZ)



#### Cel:
- Zdobądź serwer na Home. 
- Kto zna login i adres IP do swojego serwera - idźcie dalej.


####	1. Zdobądź Server VPS Ubuntu 20 na home.pl (~20zł miesięcznie).

[Kliknij tutaj aby dostać się do serwera](http://bityl.pl/hhLNr)


#### 2. Instrukcja przygotowania serwera.

[Instrukcja przygotowania serwera w panelu](http://bityl.pl/0IW1J)

1. Logowanie do panelu
2. Reinstalacja systemu (Ubuntu 20)
3. Ustaw hasło. (zapisz je sobie gdzieś na kartce)
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
