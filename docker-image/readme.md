*Save Docker Image*
docker save -o python.tar python:2.7.14-alpine3.7


*Load Docker Image*
docker load --input python.tar 
