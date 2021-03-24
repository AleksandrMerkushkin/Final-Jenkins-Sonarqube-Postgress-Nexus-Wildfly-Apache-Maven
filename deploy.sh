cd /var/lib/jenkins/workspace/Job-2/target/
chmod 755 mywebapp.war
cp /var/lib/jenkins/workspace/Job-2/target/mywebapp.war /opt/wildfly/standalone/deployments/mywebapp.war
cp /var/lib/jenkins/workspace/Job-2/target/mywebapp.war /var/lib/jenkins/workspace/Job-2/reserve.war

#chmod +x deploy.sh
#chown jenkins:wildfly /opt/wildfly/standalone/tmp/
#chown jenkins:vagrant /home/
#chown jenkins:vagrant /home/vagrant/
#chown jenkins:vagrant /home/vagrant/reserve
