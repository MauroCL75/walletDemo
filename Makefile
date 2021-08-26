ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

build-java: 
	javac -classpath ojdbc8.jar:oraclepki.jar:osdt_cert.jar:osdt_core.jar *java
run-java: 
	java -classpath ojdbc8.jar:oraclepki.jar:osdt_cert.jar:osdt_core.jar:.  -Doracle.net.tns_admin=$(ROOT_DIR)/tns -Doracle.net.wallet_location=$(ROOT_DIR)/tns/wallet OracleCon 'jdbc:oracle:thin:/@TESTWALLET'
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
