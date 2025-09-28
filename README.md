# Stock Data API Deployment on Azure

This project demonstrates deploying a Python Flask API to Azure Kubernetes Service using Terraform for infrastructure as code and Azure DevOps for CI/CD.

## Features
- Flask API fetching stock data via Alpha Vantage
- Dockerized application
- Infrastructure provisioned with Terraform (AKS + ACR)
- Kubernetes manifests for deployment
- Automated CI/CD pipeline with Azure DevOps

## Project Initialisation  

Ensure that Docker is running in the background. 
To check if Docker is running, in the cmd run: 
```docker pd```

Ensure that you are logged in Azure Services with: 
```az login``` OR 
```az acr login --name stockapiacr123```

Verify the docker image in the ACR 
```az acr repository show-tags --name stockapiacr123 --repository stock-api```

To initialise and apply changes in TF files, run: 
```
cd terraform
terraform init
terraform apply
```

To restart or apply changes in the Kubernetes file, run: 
```
kubectl rollout restart deployment stock-api 
kubectl apply -f k8s/deployment.yaml
```

## Project Deployment 

To run the project, in the CMD, apply the following
- ```kubectl get svc stock-api-service``` - To retrieve the <EXTERNAL_API>

- Fetch a stock symbol for a company registered in NASDAQ, for e.g. AAPL, MSFT, ORCL, TSLA, and insert it in the <SYMBOL> section.
- NOTE: You can only fetch the data for a single company.
- ```Invoke-WebRequest http://<EXTERNAL_API>/stocks/<SYMBOL>```

- Utilise an API Tester Tool such as Postman or Imsomnia
- Create a ```GET``` request to send the following API URL: http://<EXTERNAL_API>/stocks/MSF
- Retrieve results from the API result body, ideally in JSON

## Project Troubleshoot 

In case of errors - check the following: 

```kubectl get pods``` for ACR status 

```kubectl logs -l app=stock-api``` for checking the logs




