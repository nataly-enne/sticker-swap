# sticker_swap_server

> Api do sistema StickerSwap

# Requisitos

1. npm

2. mysql

Para instalar os rquisitos use:

```
npm i
```

# Mysql

Na primeira execução do mysql execute os scripts sql na pasta scripts, na ordem:

1. init-database.sql
2. fill-database.sql  

# Configuração

É preciso setar as váriaveis de ambiente na seguinte forma em um arquivo .env:

```
API_PORT=8081


MYSQL_HOSTNAME=mysql
MYSQL_USER=root
MYSQL_ROOT_PASSWORD=010203 
MYSQL_DB=stickerswap
MYSQL_PORT=3306

MONGO_PORT=27017
MONGO_USER=stickerswap
MONGO_PASSWORD=010203
MONGO_URI=mongodb://stickerswap:010203@mongo:27017/
MONGO_DB=stickerswap

SECRET=?
```

Substitua todas as ? (interrogações) pelas credencias que deseja-se usar.
Caso você altere o MYSQL_ROOT_PASSWORD, lembre da atualizar no scripts/init-database.sql

# Executar

```
node src/main.js
```

# Docker

Se você tem docker instalado ignore tudo acima (exceto a definição das váriaveis de ambiente) e execute com:

```
docker-compose up -d --build
```

