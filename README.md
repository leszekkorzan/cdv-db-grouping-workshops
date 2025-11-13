## Postgres grouping workshops

### Installation using Docker

1. clone repo (``git clone https://github.com/leszekkorzan/cdv-db-grouping-workshops.git``)
2. ``cd cdv-db-grouping-workshops``
3. ``docker compose up -d``
4. Check if running by ``docker ps``

### Setup using pgadmin backup

1. open pgadmin4
2. create new db
3. restore db using ``bk-pgadmin.sql`` backup dump