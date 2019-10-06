IMAGE_NAME = scnas
VERSION = v0

# build
BLDDIR= build
DFILE = $(BLDDIR)/Dockerfile
DTPL  = templates/Dockerfile.tmpl 

# compose
CFILE = docker-compose.yml
CTPL  = templates/docker-compose.yml.tmpl 

all:	$(DFILE) $(CFILE)
	sudo docker build -t $(IMAGE_NAME):$(VERSION) -f build/Dockerfile contents

$(DFILE): $(DTPL)
	tool/create_dfile $(DTPL) $(BLDDIR) $(IMAGE_NAME) $(VERSION) $(CFILE)

$(CFILE): $(CTPL)
	tool/create_cfile $(IMAGE_NAME) $(VERSION) $(CFILE)

run:
	sudo docker-compose up -d

list:
	sudo docker container list -a
	sudo docker image list

clean:
	rm -f $(CFILE) $(DFILE)
