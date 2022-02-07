# Keycloak pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/keycloak.svg)](https://dash.yunohost.org/appci/app/keycloak) ![](https://ci-apps.yunohost.org/ci/badges/keycloak.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/keycloak.maintain.svg)  
[![Installer Keycloak avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=keycloak)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer Keycloak rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble

Keycloak provides user federation, strong authentication, user management, fine-grained authorization, and more.


**Version incluse :** 16.1.1~ynh1



## Captures d'écran

![](./doc/screenshots/keaycloak.png)

## Avertissements / informations importantes

* You can configure the app by the admin panel of Keycloak.
* The app runs inside a Docker container. It will install Docker on your system.
* Users are not synced with YunoHost.

## Documentations et ressources

* Site officiel de l'app : https://keycloak.org
* Documentation officielle de l'admin : https://www.keycloak.org/docs/latest/server_admin/
* Dépôt de code officiel de l'app : https://github.com/keycloak/keycloak
* Documentation YunoHost pour cette app : https://yunohost.org/app_keycloak
* Signaler un bug : https://github.com/YunoHost-Apps/keycloak_ynh/issues

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/keycloak_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/keycloak_ynh/tree/testing --debug
ou
sudo yunohost app upgrade keycloak -u https://github.com/YunoHost-Apps/keycloak_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications :** https://yunohost.org/packaging_apps