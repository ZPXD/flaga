import configparser
import os
import sys

def etap_7_w_minute(domena):
    #os.system('sudo python3 /var/www/flaga/pomocnicze_skrypty/xD.py')
    #os.system('sudo python3 -m venv /var/www/flaga/flagaenv')
    #os.system('sudo chown $USER:$USER /var/www/flaga/flagaenv')
    #os.system('source /var/www/flaga/flagaenv/bin/activate')
    #os.system('sudo pip3 install -r /var/www/flaga/requirements.txt')
    #os.system('python3 /var/www/flaga/pomocnicze_skrypty/xd.py $domena')

if __name__ == '__main__':
    config = configparser.ConfigParser()
    config.read('/var/www/flaga/settings.ini')
    domena = config['XD']['domena']
    if len(sys.argv) > 1:
        domena = sys.argv[1]
    if domena == 'xd.pl':
        print('Nie zmieniles domeny. Zrob to piszac:\ndomena=nazwa-TWOJEJ-domeny.pl.')
    else:
        print('Twoja domena to:', domena)
        print('Przygotowuje pliki serwerowe.')
        print()
        print('Jeżeli się pomyliłeś, uruchom:\ndomena=nazwa-TWOJEJ-domeny.pl\noraz wpisz:\npython3 usun_pliki_serwerowe.py $domena')
        print('I spróbuj znowu.')
        print()
        print('W innym razie, kontynuuj.')
        etap_7_w_minute(domena)
