#!/bin/sh
here=`pwd`
TNS_ADMIN="$here/tns" sqlplus '/@TESTWALLET' << EOF
       select systimestamp from dual;
       SELECT SYS_CONTEXT('USERENV', 'SESSION_USER') FROM DUAL;
EOF
