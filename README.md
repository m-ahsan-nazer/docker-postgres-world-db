# postgres-playground
Adds vim and pgcli. Check master branch for details of database name, user name, tables and passwords

1. `docker build -t postgres-playground .`
2. `docker run -d --name postgres-playground -p 5432:5432 postgres-playground:latest`
3. `docker exec -it my-postgres-playground bash`


