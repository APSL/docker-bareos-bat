NAME = apsl/bareos-bat

build:
	docker build -t $(NAME) --rm .

pull:
	docker pull $(NAME)

run:
	docker run -it -d --rm \
       --name=bareos-bat \
       -e DISPLAY=$(DISPLAY) \
       -e QT_X11_NO_MITSHM=1 \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -v /etc/bareos:/etc/bareos \
       --net=host \
       $(NAME)

help:
	@printf "\n \
	Dockerized bareos-bat by APSL \n\n \
	build: Builds the image locally \n \
	pull: Pulls the image from Docker Hub \n \
	run: Runs bareos-bat containerized \n \
	help: Shows this help prompt \n\n"
