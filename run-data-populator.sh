cd /var/opt/sandboxes/longtail
cp pom.xml_db pom.xml
mvn exec:java -Dexec.mainClass=in.hashed.longtail.data.DataPopulator -e
hg revert pom.xml

echo "Executed Data Populator"


