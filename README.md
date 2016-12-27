## docker CLI
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