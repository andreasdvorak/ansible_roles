# Ansible Roles

# Information to start
## Anlegen vom ansible Benutzer
in der Datei /etc/ssh/sshd_config "PermitRootLogin yes" setzen

    ssh root@<IP> -o StrictHostKeyChecking=no -o IdentitiesOnly=yes

## Ansible commands

   ansible-inventory -i inventory.ini --list

## Verbindungstest
   
    ansible all -i inventory.ini -m ping

## Anzeige der Facts

    ansible all -i inventory.ini -m setup

## testen von einem playbook
    --check

## Begrenzung auf webserver
    --limit webserver

## show value for specific host and variable
    ansible rocky9 -m debug -a "var=fail2ban_loglevel" -i inventory.ini

## lint
    ansible-lint verify-apache.yml

-----------------------
## ab jetzt alles als ansible Benutzer
    ansible-playbook -i inventory.ini site.yml

## run only on mailserver
    ansible-playbook -i inventory.ini site.yml -l mailserver

## run only on certain tags
    ansible-playbook -i inventory.ini site.yml --tags "common"

## zum Testen
    ansible-playbook -i inventory.ini roles/checkmk/tasks/main.yaml

# OS Update
vorher den ungewünschten Host in der inventory.ini auskommentieren

    ansible-playbook -i inventory.ini roles/os_update/tasks/main.yaml

