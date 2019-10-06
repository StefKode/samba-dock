all:
	sudo docker build -t scontx:v0 -f Dockerfile .

run:
	sudo docker-compose up -d

list:
	sudo docker container list -a
