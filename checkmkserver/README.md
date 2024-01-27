# Configuration of checkmk server
omd create mycheck
  The site can be started with omd start mycheck.
  The default web UI is available at http://vmd123182.contaboserver.net/mycheck/

  The admin user for the web applications is cmkadmin with password: MF3fJYc6
  For command line administration of the site, log in with 'omd su mycheck'.
  After logging in, you can change the password for cmkadmin with 'cmk-passwd cmkadmin'.

# Prüfung, ob notwendige Module geladen sind.
apachectl -M | grep -E 'headers|rewrite|ssl'
# Laden von Modulen
a2enmod headers
a2enmod ssl

# Zertifikat erstellen
certbot --apache -d checkmk.privatundfrei.de

## Variables

put these variables e.g. in the file ../host_vars/FQDN-HOSTNAME or ../group_vars/all

  checkmk_agent_private_key_source: '' # path and filename
  checkmk_agent_public_key_source: '' # path and filename
  checkmk_server_version: ''
  checkmk_site: ''