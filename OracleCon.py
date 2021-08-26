#!/usr/bin/python3
import sys
import os
import cx_Oracle

def query(oraConString, q="SELECT SYSTIMESTAMP FROM DUAL"):
    print("Connecting to %s"%(oraConString))
    #print("TNS_ADMIN: %s"%(os.environ["TNS_ADMIN"]))
    #cx_Oracle.init_oracle_client(config_dir="./tns")
    db = cx_Oracle.connect(dsn=oraConString, encoding="UTF-8")
    cursor = db.cursor()
    cursor.execute(q)
    for data in cursor:
        print(data[0])

def main():
    query(sys.argv[1])

if __name__ == "__main__":
    main()
