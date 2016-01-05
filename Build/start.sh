#!/usr/bin/env bash

cd /var/dynamodb_wd

/opt/jdk/bin/java -Djava.library.path=. -jar DynamoDBLocal.jar -dbPath /var/dynamodb_local -inMemory -sharedDb -port 7777 &

cd /var/dynamodump/dynamodump

/usr/bin/python dynamodump.py -m restore -r local -s EventMatrixAuthentication-Staging --host localhost --port 7777 --accessKey a --secretKey a

/usr/bin/python dynamodump.py -m restore -r local -s itsqa-emp-director-client-5cfaceac027443a08c4251a65d184ea8 --host localhost --port 7777 --accessKey a --secretKey a

/usr/bin/python dynamodump.py -m restore -r local -s itsqa-emp-forms-client-5cfaceac027443a08c4251a65d184ea8 --host localhost --port 7777 --accessKey a --secretKey a

/usr/bin/python dynamodump.py -m restore -r local -s itsqa-emp-hub-client-5cfaceac027443a08c4251a65d184ea8 --host localhost --port 7777 --accessKey a --secretKey a

/usr/bin/python dynamodump.py -m restore -r local -s itsqa-emp-synthesis-client-5cfaceac027443a08c4251a65d184ea8 --host localhost --port 7777 --accessKey a --secretKey a

while true; do sleep 1000; done
