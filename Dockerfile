########################################
### Dockerfile instruction arguments ###
########################################

#Command        #Description

FROM            Sets the base image for subsequent
MAINTAINER      Sets the author field of the generated images
RUN             Execute commands in a new layer on top of the current image and commit the results
CMD             Allowed only once (if many then last one takes effect)
LABEL           Adds metadata to an image
EXPOSE          Informs container runtime that the container listens on the specified network ports at runtime
ENV             Sets an environment variable
ADD             Copy new files, directories, or remote file URLs from into the filesystem of the container
COPY            Copy new files or directories into the filesystem of the container
ENTRYPOINT      Allows you to configure a container that will run as an executable
VOLUME          Creates a mount point and marks it as holding externally mounted volumes from native host or other containers
USER            Sets the username or UID to use when running the image
WORKDIR         Sets the working directory for any RUN, CMD, ENTRYPOINT, COPY, and ADD commands
ARG             Defines a variable that users can pass at build-time to the builder using --build-arg
ONBUILD         Adds an instruction to be executed later, when the image is used as the base for another build
STOPSIGNAL      Sets the system call signal that will be sent to the container to exit

### Example Dockerfile
### A simple mock-server with containerpilot

FROM mhart/alpine-node:6.3.0
MAINTAINER Abu Shumon <johnshumon@gmail.com>

# get containerpilot release
ENV CONTAINERPILOT_VERSION 2.4.4

#install containerpilot
RUN apk add --no-cache curl
RUN export CP_SHA1=6194ee482dae95844046266dcec2150655ef80e9 \
    && curl -Lso /tmp/containerpilot.tar.gz \
         "https://github.com/joyent/containerpilot/releases/download/${CONTAINERPILOT_VERSION}/containerpilot-${CONTAINERPILOT_VERSION}.tar.gz" \
    && echo "${CP_SHA1}  /tmp/containerpilot.tar.gz" | sha1sum -c \
    && tar zxf /tmp/containerpilot.tar.gz -C /bin \
    && rm /tmp/containerpilot.tar.gz
# add ContainerPilot configuration
COPY containerpilot.json /etc/containerpilot.json
ENV CONTAINERPILOT=file:///etc/containerpilot.json

RUN mkdir -p /usr/src/app/mock-server
WORKDIR /usr/src/app/mock-server

COPY package.json .
RUN npm install --production

COPY server.js .
COPY api/ ./api

EXPOSE 8095
CMD ["/bin/containerpilot", "npm", "start"]