IMAGE_NAME = scnas
VERSION = v0

all:	sub_bld
	sudo docker build -t $(IMAGE_NAME):$(VERSION) -f build/Dockerfile contents

sub_bld:
	tool/create_files templates/Dockerfile.tmpl build/ templates/docker-compose.yml.tmpl $(IMAGE_NAME) $(VERSION) docker-compose.yml
run:
	sudo docker-compose up -d

list:
	sudo docker container list -a
	sudo docker image list

clean:
	rm -f docker-compose.yml
	rm -f build/Dockerfile
