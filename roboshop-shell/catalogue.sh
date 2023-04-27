yum install nodejs -y

useradd roboshop
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
unzip -o /tmp/catalogue.zip
mv catalogue-main catalogue
cd catalogue
npm install

sed -i -e 's/MONGO_DNSNAME/catalogue.kingyamza.online/' systemd.service

mv /tmp/catalogue/systemd.service /etc/systemd/system/catalogue.service
systemctl daemon-relaod
systemctl enable catalogue
systemctl start catalogue