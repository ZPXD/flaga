import configparser
import os
import sys

def etap_7_w_minute(domena):
    os.system('mkdir /var/www 2>1')
    os.system('chmod -R www-data:www-data /var/www')
    os.system('apt install git')
    os.system('git clone https://github.com/ZPXD/flaga.git /var/www')
    os.system('python3 xD.py')
    os.system('python3 -m venv flagaenv')
    os.system('source flagaenv/bin/activate')
    os.system('pip3 install -r requirements.txt')
    os.system('python3 xd.py $domena')

if __name__ == '__main__':
    config = configparser.ConfigParser()
    config.read('settings.ini')
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
        create_nginx_and_gunicorn_files(domena)
