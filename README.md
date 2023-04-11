# SFTP server
- ./runsftp.sh
```
useradd -u 1234  sftp -m
docker run -d -p 10022:22 -v /home/sftp:/home/sftp/upload --name sftpd  atmoz/sftp sftp:sftp:1234:1234:upload
```
容器内sftp服务与宿主机的用户要使用同样的uid,否则sftp服务无法访问挂载到宿主机的上目录。  
容器内的/home/sftp下不能上传文件，只能在其子目录下上传文件。所以:
``` 
put {file} upload/    ----OK
put {file} /          ----KO
```

# Client

```
sftp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null  -P 10022 sftp@localhost
```


