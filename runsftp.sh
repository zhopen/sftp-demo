useradd -u 1234  sftp -m
docker run -d -p 10022:22 -v /home/sftp:/home/sftp/upload --name sftpd  atmoz/sftp sftp:sftp:1234:1234:upload

