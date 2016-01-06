#!/usr/bin/env bash

cd /var/dynamodb_wd

/opt/jdk/bin/java -Djava.library.path=. -jar DynamoDBLocal.jar -inMemory -sharedDb -port 7777 &

cd /var/dynamodump/dynamodump

/usr/bin/python dynamodump.py -m restore -r local -s EventMatrixAuthentication-Staging --host localhost --port 7777 --accessKey a --secretKey a

/usr/bin/python dynamodump.py -m restore -r local -s itsqa-emp-director-client-b71289951f7f4c7c81874f0e580286d0 --host localhost --port 7777 --accessKey a --secretKey a

/usr/bin/python dynamodump.py -m restore -r local -s itsqa-emp-forms-client-b71289951f7f4c7c81874f0e580286d0 --host localhost --port 7777 --accessKey a --secretKey a

/usr/bin/python dynamodump.py -m restore -r local -s itsqa-emp-hub-client-b71289951f7f4c7c81874f0e580286d0 --host localhost --port 7777 --accessKey a --secretKey a

/usr/bin/python dynamodump.py -m restore -r local -s itsqa-emp-synthesis-client-b71289951f7f4c7c81874f0e580286d0 --host localhost --port 7777 --accessKey a --secretKey a

while true; do sleep 1000; done
