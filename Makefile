include vars.env

# build
BLDDIR= build
DFILE = $(BLDDIR)/Dockerfile
DTPL  = templates/Dockerfile.tmpl
SMBCF = contents/smb.conf.part

# compose
CFILE = docker-compose.yml
CTPL  = templates/docker-compose.yml.tmpl 

all:	files
	sudo docker build -t $(IMAGE_NAME):$(VERSION) -f build/Dockerfile contents

files:	$(DFILE) $(CFILE) $(SMBCF)

$(DFILE): $(DTPL) vars.env
	tool/create_dfile $(DTPL) $(BLDDIR) $(USER_NAME)

$(CFILE): $(CTPL) vars.env
	tool/create_cfile $(CTPL) $(IMAGE_NAME) $(VERSION) $(CFILE) $(VOL_SRC) $(VOL_DEST) $(HOSTNAME)

$(SMBCF): vars.env 
	tool/create_smb_config $(SMBCF) $(SMB_EXPORT) $(SMB_COMMENT) $(SMB_ROOT) $(USER_NAME)

run:
	sudo docker-compose up -d

list:
	sudo docker container list -a
	sudo docker image list

clean:
	rm -f $(CFILE) $(DFILE) $(SMBCF)
