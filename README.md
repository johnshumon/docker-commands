## docker CLI

Acknowledgement: Taken [this guide](https://developers.redhat.com/promotions/docker-cheatsheet/) as a reference. 

List of commands those are used during docker execution.

#### Container Related Commands
    docker [CMD] [OPTS] [CONTAINER]
`Examples`

1. Run a container in interactive mode:

    Run a bash shell inside an image
    
    `$ docker run -it rhel7/rhel bash`
	

2. Run a container in detached mode:

    `$ docker run --name mywildfly -d -p 8080:8080 jboss/wildfly`
    
3. Run a detached container in a previously created container network:

    `$ docker network create mynetwork`
    
    `$ docker run --name mywildfly-net -d --net mynetwork \`
    
    `-p 8080:8080 jboss/wildfly`
4. Run a detached container mounting a local folder inside the container:

    `$ docker run --name mywildfly-volume -d \`
		
    `-v myfolder/:/opt/jboss/wildfly/standalone/deployments/ \`

    `-p 8080:8080 jboss/wildflyjboss/wildfly`
    
5. Follow the logs of a specific container:

    `$ docker logs -f mywildfly`

    `$ docker logs -f [container-name|container-id]`
    
6. List containers:
    
    List only active containers
    
    `$ docker ps`
	
    List all containers

    `$ docker ps -a`

7. Stop a container:

    `$ docker stop [container-name|container-id]`
	
	Stop a container (timeout = 1 second)
	
    `$ docker stop -t1`

8. Remove a container:

    `$ docker rm [container-name|container-id]`
	
    Force stop and remove a container

    `$ docker rm -f [container-name|container-id]`
	
    Remove all containers
    
    `$ docker rm -f $(docker ps-aq)`
    
    `$ docker rm -f $(docker ps -q -a)`
	
    Remove all stopped containers

    `$ docker rm $(docker ps -q -f “status=exited”)`

9. Execute a new process in an existing container:
    
    `$ docker exec -it mywildfly bash`
    
############################################################

#### Image Related Commands
    docker [CMD] [OPTS] [IMAGE]
`Examples`

1. Build an image using a Dockerfile:
	 
	Build an image
	 
    `$ docker build -t [username/]<image-name>[:tag] <dockerfile-path>`
    `$ docker build -t johnshumon/myimage:latest .`
	
    Build an image called myimage using the Dockerfile in the same folder where the command was executed
    
    `$ docker build -t myimage:latest .`
    
2. Check the history of an image:
    
    Check the history of the jboss/wildfly image
    
    `$ docker history jboss/wildfly`
	
    Check the history of an image
    
    `$ docker history [username/]<image-name>[:tag]`
    
3. List the images:
    
    `$ docker images`

4. Remove an image from the local registry:

    `$ docker rmi [username/]<image-name>[:tag]`
    `$ docker rmi johnshumon/myimage`
    `$ docker rmi -f johnshumon/myimage`
    
5. Tag an image:
    
    Creates an image called “myimage” with the tag “v1” for the image jboss/wildfly:latest

    `$ docker tag jboss/wildfly myimage:v1`
	
	Creates a new image with the latest tag
    
    `$ docker tag <image-name> <new-image-name>`
	
	Creates a new image specifying the “new tag” from an existing image and tag

    `$ docker tag <image-name>[:tag][username/] <new-image-name>.[:new-tag]`
    
6. Exporting and importing an image to an external file:
    
    Export the image to an external file
    
    `$ docker save -o <filename>.tar`
	
    Import an image from an external file
    
    `$ docker load -i <filename>.tar`
    
7. Push an image to a registry:

    `$ docker push [registry/][username/]<image-name>[:tag]`
    
############################################################

#### Network Related Commands
    docker network [CMD] [OPTS]
`Example`
    
1. List all networks

    `$docker network ls`

2. Inspect bridge network:

    `$docker network inspect bridge`
    
| Command | Description |
| --- | --- |
| `connect` | Connects a container to a network |
| `create` | Creates a new network with the specified name | 
| `disconnect` | Disconnects a container from a network |
| `inspect` | Displays detailed information on a network | 
| `ls` | Lists all the networks created by the user | 
| `rm` | Deletes one or more networks | 

