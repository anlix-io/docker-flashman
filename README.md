# README #

Docker compose deploy of [FlashMan](https://github.com/guisenges/flashman) tool

## INSTRUCTIONS ##

### DOCKER SETUP ###

* install Docker
	* see https://docs.docker.com/engine/installation/
	* TL;DR (Ubuntu 16.04)
		* `sudo apt-get remove docker docker-engine docker.io`
		* `sudo apt-get update`
		* `sudo apt-get install apt-transport-https ca-certificates curl software-properties-common`
		* `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
		* `sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"`
		* `sudo apt-get update`
		* `sudo apt-get install docker-ce`

* install Docker Compose
	* see https://docs.docker.com/compose/install/
	* TL;DR (Ubuntu 16.04)
		* `sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose`
		* `sudo chmod +x /usr/local/bin/docker-compose`
		* `docker-compose --version`


* run setup and docker containers with docker compose command from this project main directory
	* `sudo ./setup.sh && sudo docker-compose -f docker-compose-flashman.yml up -d`

* setup Nginx configuration:

```
location / {
	proxy_set_header X-Real-IP $remote_addr;
	proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
	proxy_set_header X-NginX-Proxy true;
	proxy_set_header Upgrade $http_upgrade;
	proxy_set_header Connection 'upgrade';
	proxy_set_header Host $host;

	proxy_pass http://localhost:8000/;
	proxy_http_version 1.1;

	proxy_cache_bypass $http_upgrade;
}
```

## PLACING IMAGES ON FIRMWARE DIRECTORY ##

* firmwares directory is created at `/data/firmwares` on the host machine 

* when adding new firmware images, please follow the following file format:
	* `<VENDOR *UPPERCASE*>_<HARDWARE MODEL *UPPERCASE*>_<HARDWARE VERSION *UPPERCASE*>_<RELEASE ID *FORMAT USED BY FLASMAN BUILDROOT CONFIGURATION>.bin`

* example:
	* `TP-LINK_MR3020_V1_0000-flm.bin`

## COPYRIGHT ##

Copyright (C) 2017-2018 Anlix

## LICENSE ##

This is free software, licensed under the GNU General Public License v2.
The formal terms of the GPL can be found at http://www.fsf.org/licenses/
