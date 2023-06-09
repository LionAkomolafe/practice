yum install mongodb-org -y
systemctl enable mongod
systemctl start mongod

sed -i -e 's/127.0.0.0/0.0.0.0/' /etc/mongod.conf
systemctl restart mongod

curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"
cd /tmp
unzip -o mongodb.zip
cd mongodb-main
mongo < catalogue.js
mongo < users.js