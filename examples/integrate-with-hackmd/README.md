growi-docker-compose with HackMD(CodiMD) Integration Example
=====================================================

This example enables GROWI to integrate with [HackMD(CodiMD)](https://github.com/hackmdio/codimd)  
so that user will be able to simultaneously edit page with multiple people.

Install and Start
------------------

### Clone repos and copy docker-compose.override.yml

```bash
git clone https://github.com/weseek/growi-docker-compose.git growi
cd growi
cp examples/integrate-with-hackmd/docker-compose.override.yml .
```

### Add environment variables to `app` container

| variables               | example values                  | description                                                                                                       |
| ----------------------- | ------------------------------- | ----------------------------------------------------------------------------------------------------------------- |
| `HACKMD_URI`            | `https://hackmd.demo.growi.org` | HackMD server URI<br>which can be accessed from GROWI client browser                                              |
| `HACKMD_URI_FOR_SERVER` | `http://hackmd:3000`            | HackMD server URI<br>which can be accessed from GROWI server container<br>Default: The same value as `HACKMD_URI` |



1. Open `docker-compose.yml`
2. Edit `app` container's settings
  1. Set `HACKMD_URI`
  2. Set `HACKMD_URI_FOR_SERVER` if you need

### Add environment variables to `hackmd` container

| variables   | example values           | description                                                         |
| ----------- | ------------------------ | ------------------------------------------------------------------- |
| `GROWI_URI` | `https://demo.growi.org` | GROWI server URI<br>which can be accessed from client browser |


1. Open `docker-compose.override.yml`
2. Edit `hackmd` container's settings
  1. Set `GROWI_URI`

### Start

```bash
docker-compose up
```

and access to:

* http://localhost:3000 (GROWI)
* http://localhost:3100 (HackMD directly)


Configuration of HackMD(CodiMD)
---------------------------

By defautl, HackMD server will be launched **with the anonymous user accessible**.  
If you want to change it, configure as below.

1. See [the official document](https://github.com/hackmdio/codimd#configuration)
2. Add environment variables
    - Open docker-compose.override.yml and edit 'hackmd' container settings
3. Add settings to `config.json`
    - Open `hackmd/config.json` and edit
