# Board n' go

[![Gateway](https://github.com/adxl/bng-gateway/actions/workflows/ci.yml/badge.svg)](https://github.com/adxl/bng-gateway/actions/workflows/ci.yml)
[![Auth API](https://github.com/adxl/bng-api-auth/actions/workflows/ci.yml/badge.svg)](https://github.com/adxl/bng-api-auth/actions/workflows/ci.yml)
[![Events API](https://github.com/adxl/bng-api-events/actions/workflows/ci.yml/badge.svg)](https://github.com/adxl/bng-api-events/actions/workflows/ci.yml)
[![Exams API](https://github.com/adxl/bng-api-exams/actions/workflows/ci.yml/badge.svg)](https://github.com/adxl/bng-api-exams/actions/workflows/ci.yml)
[![Gears API](https://github.com/adxl/bng-api-gears/actions/workflows/ci.yml/badge.svg)](https://github.com/adxl/bng-api-gears/actions/workflows/ci.yml)

## Setup

1 - Cloner le projet:

```bash
git clone --recurse-submodules git@github.com:adxl/board-n-go.git bng
```

2 - Initialiser les environnements:

```bash
./setup
```

3 - Lancer les services:

```bash
./runner start all
```

ou des services en particulier :

```bash
./runner start service_1 service_2 service_3 etc
```

_(valeurs possibles : `app`, `auth`, `events`, `exams`, `gears`)_

4 - Stopper les services:

```bash
./runner stop all
```

ou des services en particulier :

```bash
./runner stop service_1 service_2 service_3 etc
```

_(valeurs possibles : `app`, `auth`, `events`, `exams`, `gears`)_  
_Note: seule la commande `stop all` permet de stopper la gateway et supprime le network_

## How to use

En utilisant la version docker (par défaut),
les services sont accessible comme suit:

- Gateway : [http://localhost:9000]( http://localhost:9000 )
- Auth API : [http://localhost:9000/auth]( http://localhost:9000/auth)
- Events API : [http://localhost:9000/events]( http://localhost:9000/events)
- Exams API : [http://localhost:9000/exams]( http://localhost:9000/exams)
- Gears API : [http://localhost:9000/gears]( http://localhost:9000/gears)

Pour des raisons de sécurité, il est nécessaire de passer le
header `X-BNG-KEY=esgi`
