# CONTRUIR

```bash
docker-php-ext-install mysqli pdo_mysql curl gd2 exif fileinfo intl mbstring xsl openssl

docker build -t phpserver .
docker run -d --name cphpserver -v .:/var/www/html/sistema -p 80:80 phpserver

docker service create
  --name sphpserver
  --network netlink
  --mount type=bind,source=C:/laragon/www/sistema,target=/var/www/html/sistema
  --publish 80:80
 phpserver

--ejemplo



docker tag phpserver 192.168.18.40:5000/phpserver
docker push 192.168.18.40:5000/phpserver

ssh -i E:/escap.pem -p 2222 User@192.168.18.40
docker pull localhost:5000/phpserver

docker service rm sphpserver
docker service create
  --name sphpserver
  --network netlink
  --mount type=bind,source=D:/apps/php,target=/var/www/html
  --publish published=8094,target=80 
  --label traefik.enable=true
  --label 'traefik.http.routers.sphpserver.rule=Host(`"last.companycacel.com"`)'
  --label traefik.http.routers.sphpserver.entrypoints=websecure
  --label traefik.http.routers.sphpserver.tls=true
  --label traefik.http.routers.sphpserver.tls.certresolver=le
  --label traefik.http.services.sphpserver.loadbalancer.server.port=8094
 localhost:5000/phpserver


git clone https://github.com/eeulogi1999/sistema.git

```
