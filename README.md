Runs the DynamoDB local service as a docker container. Run without parameters to see help:

```
docker run -i -t tray/dynamodb-local
```

Example:

```
docker run -i -t -p 7777:7777 tray/dynamodb-local -inMemory -sharedDB -port 7777
```
