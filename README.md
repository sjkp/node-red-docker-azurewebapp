# Node Red Docker Azure Web App

This repositoty contains a docker image of node red that can run on an Linux Azure Web App. 

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fsjkp%2Fnode-red-docker-azurewebapp%2Fmaster%2Fazuredeploy.json" target="_blank"><img src="http://azuredeploy.net/deploybutton.png"/></a>

To read more about check out this blog post http://wp.sjkp.dk/running-node-red-on-azure-web-app/

## Run locally and push to Azure Container Registery

To run the container locally you can clone this repo and run the following command to build the container

`docker build . `

Tag the container with a name e.g. 

`docker tag ff3a sjkpdk.azurecr.io/node-red-docker-azurewebapp`

Once the container is build you can run it using 


`docker run -it -p 1880:1880 -v <your-local-mount-dir>:/home/data --name mynodered sjkpdk.azurecr.io/node-red-docker-azurewebapp`


If you want to push the container to azure container registery you can do so with 

`docker push sjkpdk.azurecr.io/node-red-docker-azurewebapp:v1.0.0`

Replace `sjkpdk.azurecr.io` with the name of your registery. 


## Debugging
When running locally you can connect into the running node-red container using
`docker exec -it <container-id> /bin/bash`


