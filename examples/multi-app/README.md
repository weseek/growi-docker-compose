crowi-plus-docker-compose Multiple Sites Example
================================================

This example enables the execution of three crowi-plus sites.

Install and Start
------------------

### Build Image

```bash
git clone https://github.com/weseek/crowi-plus-docker-compose.git crowi-plus
cd crowi-plus
docker build -t crowiplusmulti_app .
```

### replace docker-compose.yml
```bash
cp examples/multi-app/docker-compose.yml .
```

### Start

```bash
docker-compose up
```

and access to:

* http://localhost:3001 (app-1)
* http://localhost:3002 (app-2)
* http://localhost:3003 (app-3)

