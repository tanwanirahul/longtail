cd /var/opt/sandboxes/longtail
hg pull
hg up
mvn clean compile war:war
mvn net.alchim31.maven:yuicompressor-maven-plugin:compress
rm -rf /home/hashedin/apache-tomcat-7.0.22/webapps/*
cp target/longtail-0.0.1-SNAPSHOT.war /home/hashedin/apache-tomcat-7.0.22/webapps/ROOT.war
/home/hashedin/apache-tomcat-7.0.22/bin/startup.sh &

echo "Deployment Complete"
