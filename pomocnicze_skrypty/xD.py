
import os

os.system('apt install python3-pip python3-dev python3-venv build-essential libssl-dev libffi-dev python3-setuptools')
os.system('apt install nano')
os.system('apt remove apache2')
os.system('apt install nginx')
os.system('systemctl enable nginx')
os.system('systemctl start nginx')

os.system('rm -r /var/www/html')

os.system('apt install nano')
