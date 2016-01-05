FROM tray/java:8-jre
MAINTAINER Forest W

#Create work space
RUN mkdir /var/dynamodb_wd

WORKDIR /var/dynamodb_wd

#Get package from amazon
RUN /usr/bin/curl -L http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest | /bin/tar xz

ENTRYPOINT ["/opt/jdk/bin/java", "-Djava.library.path=.", "-jar", "DynamoDBLocal.jar", "-dbPath", "/var/dynamodb_local"]

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME ["/var/dynamodb_local", "/var/dynamodb_wd"]

RUN apt-get update

RUN apt-get install -y git-core python-pip build-essential python-dev wget -y
RUN pip install boto
RUN pip install boto3

RUN mkdir /var/dynamodump

WORKDIR /var/dynamodump

RUN /usr/bin/wget http://raw.githubusercontent.com/bchew/dynamodump/master/dynamodump.py

RUN /usr/bin/python dynamodump.py -m backup -r us-east-1 -s itsqa-emp-director-client-5cfaceac027443a08c4251a65d184ea8 

