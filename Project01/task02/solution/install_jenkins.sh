#prerequisites
apt install default-jdk -y
sudo groupadd tomcat
useradd -s /bin/false -g tomcat -d /opt/tomcat/latest tomcat


echo "Downloading tomcat and extracting content to /opt/tomcat"
cd /tmp && \
curl -O https://www.apache.si/tomcat/tomcat-9/v9.0.38/bin/apache-tomcat-9.0.38.tar.gz

#Create a folder if not exists yet
[ ! -d "/opt/tomcat/tomcat-9.0.38" ] && mkdir -p /opt/tomcat/tomcat-9.0.38

tar xzvf apache-tomcat-*tar.gz -C /opt/tomcat/tomcat-9.0.38 --strip-components=1
cd /opt/tomcat

chown -R tomcat:tomcat /opt/tomcat && chmod -R g+r latest/conf && chmod g+x latest/conf

java_path=$(update-java-alternatives -l | awk {'print $3'})

echo "[Unit]
Description=Apache Tomcat Web Application Container
After=network.target

[Service]
Type=forking

Environment=JAVA_HOME=${java_path}
Environment=CATALINA_PID=/opt/tomcat/latest/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat/latest
Environment=CATALINA_BASE=/opt/tomcat/latest
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'
Environment='JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom'

ExecStart=/opt/tomcat/latest/bin/startup.sh
ExecStop=/opt/tomcat/latest/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target

" > /etc/systemd/system/tomcat.service


systemctl daemon-reload && systemctl start tomcat && ufw allow 8080 && systemctl enable tomcat

#It is possible to Configure Tomcat Web Management Interface tomcat, for more details : https://www.digitalocean.com/community/tutorials/install-tomcat-9-ubuntu-1804 (step 7)

cd latest/webapps/
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
#Tomcat should create a jenkins folder from our jenkins.war file
sleep 5 && ls jenkins

#Open web browner http://IP:8080/jenkins
#Wait some seconds and follow instruction
#Choose Install suggested plugins
