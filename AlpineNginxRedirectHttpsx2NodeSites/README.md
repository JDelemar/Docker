# Alpine + Nginx + Nodejs x 2

### Notes
This project produces 3 docker images and containers:
  - 1 nginx container 
  - 2 nodejs containers displaying two separate nodejs sites

You reach the nodejs containers through nginx 
Nginx redirects all http requests to https
The two node sites use nodemon so you can edit the files and nodemon will restart the perspective site 
  - Source files can be edited and saved
  - The package.json file in each site contains node package information
  - The node_modules directory in each site is virtual and will not contain files when the containers are exited

To test the project, run it with: docker-compose up 
Your /etc/hosts (Mac, Linux) or C:\Windows\System32\Drivers\etc\hosts file will need to point to the machine running the Docker containers in order to reach them from your browser. This allows the hostname to be used in your browser to reach the sites.
```sh
127.0.0.1      site1.local.com 
172.0.0.1      site2.local.com 
```
To reach the sites in your browser type:
  - Site 1 (you will be redirected to https with a self signed cert):
```sh
http://site1.local.com    
```
OR 
```sh
http://localhost
```
  - Site 2 (you will be redirected to https with a self signed cert):
```sh
http://site2.local.com 
```
On a Linux or Mac machine if you have curl installed type the following in terminal:
  - Site 1:
```sh
curl -H 'Host: site1.local.com' -k 'https://localhost'
```
  - Site 2:
```sh
curl -H 'Host: site2.local.com' -k 'https://localhost'
```

### Additional information
Run:
```sh
docker-compose up -d
```

Stop and remove containers:
```sh
docker-compose down
```

For trouble shooting purposes:
  - Join running nginx container
```sh
        docker exec -it testnginx bash
```
  - Add curl to container
```sh
        apk add curl
        apk add --update curl 
```
  - Check responses from sites
```sh
        curl -k "http:<site>[:<port>]"
```
  - Look at output from container
```sh
        docker logs <container name>
```
