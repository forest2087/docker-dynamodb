Runs the DynamoDB local service as a docker container. Run without parameters to see help:

```
docker run -i -t forest2087/docker-dynamodb
```

Example:

```
docker run -e AWS_ACCESS_KEY_ID=$aws_access_key -e AWS_SECRET_KEY=$aws_secret_key -i -t -p 7777:7777 forest2087/docker-dynamodb -inMemory -sharedDb -port 7777
```

or: 

```
docker run -i -t -p 7777:7777 forest2087/docker-dynamodb 
```
