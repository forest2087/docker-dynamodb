FROM tray/java:8-jre
MAINTAINER Forest W

#Create work space
RUN mkdir /var/dynamodb_wd

WORKDIR /var/dynamodb_wd

#Get package from amazon
RUN /usr/bin/curl -L http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest | /bin/tar xz

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME ["/var/dynamodb_local", "/var/dynamodb_wd"]

#RUN apt-get update

RUN apt-get install -y git-core python-pip build-essential python-dev wget -y
RUN pip install boto
RUN pip install boto3

RUN mkdir /var/dynamodump

WORKDIR /var/dynamodump

RUN curl -L https://github.com/forest2087/docker-dynalite/raw/master/dynamodump.tar.gz | tar xz

ADD Build/start.sh   /sbin/start.sh
RUN chmod +x /sbin/start.sh
ENTRYPOINT ["/sbin/start.sh"]