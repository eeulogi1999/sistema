# CONTRUIR

```bash
docker-php-ext-install mysqli pdo_mysql curl gd2 exif fileinfo intl mbstring xsl openssl

docker build -t lcacel .
docker run -d -p 8090:80 --network netlink lcacel


--ejemplo



docker tag lcacel 192.168.18.40:5000/lcacel
docker push 192.168.18.40:5000/lcacel

ssh -i E:/escap.pem -p 2222 User@192.168.18.40
docker pull localhost:5000/lcacel

docker service create --name slcacel 
 --network netlink  
 --publish published=8094,target=80 
localhost:5000/lcacel

```
