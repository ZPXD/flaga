import configparser
import os

config = configparser.ConfigParser()
config.read('settings.ini')

domena = config['XD']['domena']

plik_nginxa = ''
plik_nginxa_template = open('nginx_file').readlines()
for l in plik_nginxa_template:
	if l.strip().startswith('server_name'):
		l=l.replace('NAZWA_STRONY', domena)
	plik_nginxa += l

with open("/etc/nginx/sites-available/{}".format(domena), "w") as file1:
    file1.write(plik_nginxa)

os.system('sudo ln -s /etc/nginx/sites-available/{} /etc/nginx/sites-enabled/'.format(domena))

plik_gunicorn = open('flaga.service').read()
with open('/etc/systemd/system/flaga.service', "w") as f:
	f.write(plik_gunicorn)
		
os.system('sudo systemctl start flaga.service')
