ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

download-java:
	mvn dependency:copy-dependencies -DoutputDirectory=lib
build-java: download-java
	javac -classpath lib/ojdbc8-19.3.0.0.jar:oraclepki-19.3.0.0.jar:osdt_cert-19.3.0.0.jar:osdt_core-19.3.0.0.jar *java
run-java: 
	java -classpath lib/ojdbc8-19.3.0.0.jar:lib/oraclepki-19.3.0.0.jar:lib/osdt_cert-19.3.0.0.jar:lib/osdt_core-19.3.0.0.jar:.  -Doracle.net.tns_admin=$(ROOT_DIR)/tns -Doracle.net.wallet_location=$(ROOT_DIR)/tns/wallet OracleCon 'jdbc:oracle:thin:/@TESTWALLET'
build-python:
	virtualenv venv
	./venv/bin/pip install -r ./requirements.txt
run-python:
	TNS_ADMIN=$(ROOT_DIR)/tns/ ./venv/bin/python OracleCon.py TESTWALLET
run-sqlplus:
	sh sql.sh
all: build-java build-python
clean:
	rm *.class
	rm -fr venv
	rm -fr lib/*
