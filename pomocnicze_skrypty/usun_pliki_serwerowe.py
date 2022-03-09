import configparser
import os
import sys

def clear_files_and_folders_creation():
    
    # Usuńmy drugi plik nginxa.
    try:
        nginx_file_1 = '/etc/nginx/sites-available/{}'
        nginx_file_1 = nginx_file_1.format(domena)
        nginx_file_2 = '/etc/nginx/sites-enabled/{}'
        nginx_file_2 = nginx_file_2.format(domena)
        os.system('sudo rm {}'.format(nginx_file_1))
        print('Plik nginx 1 usuniety:', nginx_file_1, '\n')
    except:
        pass

    # Usuńmy drugi plik nginxa.
    nginx_file_2 = '/etc/nginx/sites-enabled/{}'
    nginx_file_2 = nginx_file_2.format(domena)
    try:
        os.system('sudo rm {}'.format(nginx_file_2))
        print('Plik nginx 2 usuniety:', nginx_file_2, '\n')
    except:
        pass

    # Usuńmy plik gunicorna.
    gunicorn_file = '/etc/systemd/system/flaga.service'
    try:
        os.system('sudo rm {}'.format(gunicorn_file))
        print('Plik gunicorn usuniety:', gunicorn_file, '\n')
    except:
        pass

if __name__ == '__main__':
    config = configparser.ConfigParser()
    config.read('/var/www/flaga/settings.ini')
    domena = config['XD']['domena']
    if len(sys.argv) > 1:
        domena = sys.argv[1]
    if domena == 'xd.pl' and len(sys.arvg) == 1:
        print('Nie zmieniles domeny. Zrob to piszac:\ndomena=nazwa-TWOJEJ-domeny.pl')
    else:
        clear_files_and_folders_creation(domena)
        print('Podana przez Ciebie domena na ktorej postawilismy stronke to:\n', domena, '\n')
        print('Sprawdz czy sie zgadza i edytuj jej nazwę piszac:\ndomena=nazwa-TWOJEJ-domeny.pl')
        print('Jak nazwa domeny bedzie sie zgadzac, uruchom spowrotem plik xd.py:\nsudo python3 xd.py $domena')
        print('Powinno się udac. W przeciwnym razie napsz na dziale pomoc.')
