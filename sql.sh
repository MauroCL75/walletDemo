#!/bin/sh
here=`pwd`
echo /@$1
TNS_ADMIN="$here/tns" sqlplus /@$1 << EOF
       select systimestamp from dual;
       SELECT SYS_CONTEXT('USERENV', 'SESSION_USER') FROM DUAL;
EOF
