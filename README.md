## About the project

That is a copy of the same project available at the youtube channel "freeCodeCamp". Dispite the fact that you can find many other implementations, in this one you can follow all the commit (based on each "chapter" and "steps") and how each file was created as a complement of the video tutorial.

And as you can see, it's not following 100% every steps taken by Julio Casal [https://juliocasal.com], but hope it can help you in any doubt.

You can always (and is highly recommended) you follow along the tutorial creating exactly the same steps of each chapter.

All this project was created using a linux (Ubuntu 20.04 and Pop!_OS 21.04) as the base OS environment to develop and test. 

video:
https://www.youtube.com/watch?v=ZXdFisA_hOY&t=20691s

## docker-compose file

The docker-compose file was created to easier the tests when we start the chapter "Persisting Entities with MongoDB"

## How to install Docker and Docker-compose

Absolutely simple! You can follow the steps on the websites below:

### On Digital Ocean (I absolutely ❤️ DO!)
For Docker
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04

For Docker-Compose
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04

### To create your local image

-> $docker build -t catalog:v1 .

### Run local mongoDb docker instance and create a Docker network like in the tutorial

create a docker network
-> $docker network create dotnet5tutorial

to check the recently network created:
-> $docker network ls

to create a local instance of mongodb and link the created network
-> $docker run -d --rm --name mongo -p 27017:27017 -v mongodbdata:/data/db -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=localP4ssw0rd --network=dotnet5tutorial mongo

to run the container, pulling the image locally [ don't forget to create the project container ]
-> $docker run -it --rm -p 8080:80 -e MongoDbSettings:Host=mongo -e MongoDbSettings:Password=localP4ssw0rd --network=dotnet5tutorial catalog:v1

### Pull you image into Docker Hub

You need to have an account in docker hub! Go to https://hub.docker.com/

-> $docker login

Check the images you have with this command:
-> $docker images

If you created the image, you can see the catalog in the list and now we need to retag it.
-> $docker tag catalog:v1 orogerio/catalog:v1

Now, it's time to push it to docker!
-> docker push orogerio/catalog:v1