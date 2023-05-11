# Board n' go

## Setup

1 - Cloner le projet:  

```bash
git clone --recurse-submodules git@github.com:adxl/board-n-go.git bng
```

2 - Lancer les services:  

```bash
./runner start all
```

ou des services en particulier :

```bash
./runner start service_1 service_2 service_3 etc
```

_(valeurs possibles : `auth`, `events`, `exams`, `gears`)_

3 - Stopper les services:  

```bash
./runner stop all
```

ou des services en particulier :

```bash
./runner stop service_1 service_2 service_3 etc
```

_(valeurs possibles : `auth`, `events`, `exams`, `gears`)_  
_Note: seule la commande `stop all` permet de stopper la gateway et supprime le network_



