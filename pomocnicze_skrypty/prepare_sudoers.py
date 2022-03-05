import sys

```
Usage:

NEW_USER=nazwa_uzytkownika_nowego
sudo python3 prepare_sudoers.py $NEW_USER > /etc/sudoers
```
def prepare_sudoers(user):
    sudoers = open('/etc/sudoers').readlines()
    new_sudoers = ''
    for line in sudoers:
        new_sudoers += line
        if '' in line:
            new_sudoers += "{} ALL=(ALL) NOPASSWD:ALL".format(user)

    print(new_sudoers)

if __name__ == '__main__':
    user = sys.argv[1]
    prepare_sudoers(user)
