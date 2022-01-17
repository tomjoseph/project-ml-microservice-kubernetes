[![CircleCI](https://circleci.com/gh/tomjoseph/project-ml-microservice-kubernetes.svg?style=svg)](https://circleci.com/gh/tomjoseph/project-ml-microservice-kubernetes)


# Introduction of the project
This project operationalize a Python flask app” that serves out predictions about housing prices through API calls. 

# Motivation behind the project
Provides a good learning experience on the DevOps pipeline for a real world app. 

# Tech Stack used in the project
Python
Git - Github
CircleCI
Flask Framework
Docker
Kubernetes 


# Files in the repository

```
project-ml-microservice-kubernetes
 |   app.py                                     - Main Python App File
 |   Dockerfile                                 - To build and run as docker image 
 |   Makefile                                   - For running Make    
 |   make_prediction.sh                         - Run ./make_prediction.sh to get the prediction for housing
 |   README.md                                  - Readme file.     
 |   requirements.txt                           - List App dependencies. Used by pip install
 |   run_docker.sh                              - Script to build and run as docker services
 |   run_kubernetes.sh                          - Script to run the uploaded docker image as Kubernetes services  
 |   upload_docker.sh                           - Upload app's docker image to docker hub
 |
 +---.circleci
 |       config.yml                             - Config for Circle CI build 
 |
 +---model_data
 |       boston_housing_prediction.joblib       - Predictions Model Data
 |       housing.csv
 |
 \---output_txt_files
         docker_out.txt                         - Output from ./run_kubernetes.sh 
         kubernetes_out.txt                     - Output from ./run_kubernetes.sh
         kube_pod_logs.txt                      - Output of logs from App pod. Shows it was executed.
```


# Setup steps

## Setup Python Environment Locally

- Run `make setup` to setup python env

python3 -m venv ~/.devops
source ~/.devops/bin/activate

Run `make install` to install the necessary dependencies


## Setup and Configure Kubernetes locally

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl 
 
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube

## Start Kubernetes 
minikube start

## Create Flask app in Container
To create the app as a container and run
Execute: ./run_docker.sh

This does the build image and run as docker:

- Build image and add a descriptive tag
docker build --tag=tj-app  .

- Run flask app
docker run -p 8000:80  tj-app

## Upload the container image to Docker Hub
./upload_docker.sh 

This tags and pushes the app's docker image to Docker Hub
- Push image to a docker repository
docker push $dockerpath

## Run via kubectl
./run_kubernetes.sh

This does the build image and run as docker:

- Run the Docker Hub container with kubernetes
kubectl run tj-app --image=tjoseph2020/tj-app --port=80

- Waits for kubernetes pods to be ready
kubectl wait --for=condition=ready pods/tj-app

- Forwards the container port to a host
kubectl port-forward tj-app 8000:80



# Different ways Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`


