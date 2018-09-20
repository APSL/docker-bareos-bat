# docker-bareos-bat

A Dockerized version of bareos-bat. 

---

## Requirements

* [Docker](https://www.docker.com/)
* [Docker-compose](https://docs.docker.com/compose/) (optional)

If you don't have Docker installed, please follow this [guide](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

## Usage

* **Makefile** : 
    * **build** : Builds the image locally
        ```
        make build
        ```        
    * **pull** : Pulls the image from remote repository
        ```
        make pull
        ```
    * **run** : Run the containerized app
        ```
        make run
        ```

* **Docker-compose** :  

    If you want to run the app with Docker-Compose run this command at the repository directory : 
    ```
    docker-compose up
    ```

    If you want to build the image with Docker-compose, please uncomment the line #build at *docker-compose.yml* :  
    ```
    bareos-bat:
        #build: . 
        image: apsl/bareos-bat
    ```

## Configuration files
Place all your configuration files at : ```/etc/bareos/``` your local directory will be mounted to the container.

## Installation

To make the launch process quicker, we can create a script and launch it with a single command.

In this example, we are going to create an script into ``` ~/.local/bin``` directory.

Let's start!.

1. Go to ```~/.local/bin``` directory, if you don't have it you can create it.
2. Create a file with your favourite editor, for example, ```vim bbat``` and then put the following code into the file:  
    ```
    #!/bin/bash

    docker run -it -d --rm \
           --name=bareos-bat \
           -e DISPLAY=$DISPLAY \
           -e QT_X11_NO_MITSHM=1 \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v /etc/bareos:/etc/bareos \
           --net=host \
           apsl/bareos-bat
    ``` 
3. Give execution permissions to the file :  ``` chmod +x bbat ```
4. Check if you have the directory at the path. If ```echo $PATH``` returns the directory that we used, that's it. If not, we'll have to add it to the path.
5. Add the following line to your shell PATH :  
   ```
   export PATH=$PATH:$HOME/.local/bin
   ```
   The profile will change depending on the shell.
   * **zsh** : ``` ~/.zshrc ```
   * **bash** : ``` ~/.bashrc```

6. Refresh your shell
7. Run ```bbat```








