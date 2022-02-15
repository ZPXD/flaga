import configparser
import os
import sys

def create_nginx_and_gunicorn_files(domena):

    # Edytujemy plik nginx:
    plik_nginxa = ''
    plik_nginxa_template = open('nginx_file').readlines()
    for l in plik_nginxa_template:
        if l.strip().startswith('server_name'):
            l=l.replace('NAZWA_STRONY', domena)
        plik_nginxa += l

    # Zapisujemy plik nginx:
    with open("/etc/nginx/sites-available/{}".format(domena), "w") as file1:
        file1.write(plik_nginxa)
    
    # Robimy link do kopii pliku nginx:
    os.system('sudo ln -s /etc/nginx/sites-available/{} /etc/nginx/sites-enabled/'.format(domena))

    # Kopiujemy plik gunicorna tam gdzie powinien być.
    gunicorn_file = '/var/www/flaga/gunicorn_file'
    where_it_needs_to_be = '/etc/systemd/system/flaga.service'
    plik_gunicorn = open('gunicorn_file').read()
    os.system('cp {} {}'.format(gunicorn_file, where_it_needs_to_be))
    
    # Restartujemy startujemy serwis flagi, restartujemy nginxa.
    os.system('sudo systemctl start flaga.service')
    os.system('sudo systemctl daemon-reload')
    os.system('sudo systemctl restart nginx')
    os.system('sudo systemctl restart flaga.service')

if __name__ == '__main__':
    config = configparser.ConfigParser()
    config.read('settings.ini')
    domena = config['XD']['domena']
    if len(sys.argv) > 1:
        domena = sys.argv[1]
    print('Podana przez Ciebie domena na której stawiamy stronkę to:\n', domena, '\n')
    create_nginx_and_gunicorn_files(domena)
