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
        print('Plik nginx 1 usunięty:', nginx_file_1, '\n')
    except:
        pass

    # Usuńmy drugi plik nginxa.
    nginx_file_2 = '/etc/nginx/sites-enabled/{}'
    nginx_file_2 = nginx_file_2.format(domena)
    try:
        os.system('sudo rm {}'.format(nginx_file_2))
        print('Plik nginx 2 usunięty:', nginx_file_2, '\n')
    except:
        pass

    # Usuńmy plik gunicorna.
    gunicorn_file = '/etc/systemd/system/flaga.service'
    try:
        os.system('sudo rm {}'.format(gunicorn_file))
        print('Plik gunicorn usunięty:', gunicorn_file, '\n')
    except:
        pass

if __name__ == '__main__':
    config = configparser.ConfigParser()
    config.read('settings.ini')
    domena = config['XD']['domena']
    if len(sys.argv) > 1:
        domena = sys.argv[1]
    print('Podana przez Ciebie domena na której stawiamy stronkę to:\n', domena, '\n')
    clear_files_and_folders_creation(domena)
