# Laravel Create Project Container
The docker image provide necessary environment to create laravel project if you planned to dockerize a web application and you don't want to install php or composer locally.

##How to create a laravel project
```
#!bash
docker run --rm \
       --name "laravel_create-project" \
       --mount type=bind,source="$(pwd)/[empty-project-folder]",target="/laravel" \
       ukrvaku/laravel-create-project:latest \
       composer create-project --prefer-dist laravel/laravel /laravel
```
Change **$(pwd)/[empty-project-folder]** to your project folder

**Note:** Project folder should exist and empty

Change permissions in your project folder accordingly to laravel requirements.
```
#!bash
sudo chmod -R 0777 $(pwd)/[empty-project-folder]/storage/
sudo chmod -R 0777 $(pwd)/[empty-project-folder]/bootstrap/cache/
sudo chmod +x $(pwd)/[empty-project-folder]/artisan   
```