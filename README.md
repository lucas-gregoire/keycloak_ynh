# Keycloak for YunoHost

[![Integration level](https://dash.yunohost.org/integration/keycloak.svg)](https://dash.yunohost.org/appci/app/keycloak) ![Status badge](https://ci-apps.yunohost.org/ci/badges/keycloak.status.svg) ![Maintain badge](https://ci-apps.yunohost.org/ci/badges/keycloak.maintain.svg)  
[![Install Keycloak with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=keycloak)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allow you to install Keycloak quickly and simply on a YunoHost server.  
If you don't have YunoHost, please see [here](https://yunohost.org/#/install) to know how to install and enjoy it.*

## Overview

Keycloak provides user federation, strong authentication, user management, fine-grained authorization, and more.

**Shipped version:** 16.1.1

## Screenshots

![Screenshot of Keycloak](https://www.keycloak.org/resources/images/screen-login.png)

## Configuration

How to configure this app : by the admin panel of Keycloak.

## Documentation

* Official documentation: <https://www.keycloak.org/documentation>

## YunoHost specific features

### Supported architectures

* x86-64 - [![Build Status](https://ci-apps.yunohost.org/ci/logs/keycloak%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/keycloak/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/keycloak%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/keycloak/)

## Additional information

* The app runs inside a Docker container. It will install Docker on your system.

## Links

* Report a bug: <https://gitlab.com/ecobosto/keycloak_ynh/issues>
* App website: <https://www.keycloak.org>
* YunoHost website: <https://www.yunohost.org>

---

## Developers info

Please do your pull request to the [testing branch](https://gitlab.com/ecobosto/keycloak_ynh/tree/testing).

To try the testing branch, please proceed like that.

```
sudo yunohost app install https://gitlab.com/ecobosto/keycloak_ynh/tree/testing --debug
or
sudo yunohost app upgrade keycloak -u https://gitlab.com/ecobosto/keycloak_ynh/tree/testing --debug
```
