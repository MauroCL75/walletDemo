# Oracle wallet demo

This is a demo of the oracle wallet. You will find here examples in java, python and sqlplus.
The wallet is a way to store encrypted login and password information. The wallet is generated and distributed by the DBA.
On the client side you must configure
* An sqlnet.ora file that tells where the wallet lives.
* A tnsname.ora file that tells the ip and service name of the database. The test database in this example is called TESTWALLET.
* A copy of the wallet directory that stores the credentials.

# Pre requirements
It assume that the oracle instant client, pip and java are installed. Ask your local DBA to create a wallet for you.
You can create the container to have anything you need.

# Configuration
Edit tns/tnsnames.ora to match your database ip and service. Generate the wallet files and copy them to tns/wallet.

# Java 
In order to use wallet you must add to this code the following jars:
* ojdbc8.jar
* oraclepki.jar
* osdt_cert.jar
* osdt_core.jar

You can find them [here](https://www.oracle.com/database/technologies/appdev/jdbc-ucp-19-9-c-downloads.html).
Invoking the wallet on java is done by using 'jdbc:oracle:thin:/@TESTWALLET'

# Environment variables
You can add a TNS_ADMIN file to tell where the tnsnames is.

# Invoking a wallet enabled configuration
In this case there is a single user on the wallet. In python you invoke the wallet config by using the dsn TESTWALLET. In sqlplus you must use /@TESTWALLET

# Build and run the container
`docker build -t walletcontainer .`

`docker run -it walletcontainer:latest /bin/bash`

# Builiding this
Run `make all`. This is done on the container build.

# Running this
On the container, execute

`make run-java`

`make run-python`

`make run-sqlplus`

Look at the Makefile to see how it was executed.
