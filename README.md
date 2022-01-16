[![CircleCI](https://circleci.com/gh/tomjoseph/project-ml-microservice-kubernetes.svg?style=svg)](https://circleci.com/gh/tomjoseph/project-ml-microservice-kubernetes)


## Project 04

Operationalize a Machine Learning Microservice API. 

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. 

This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`— that serves out predictions (inference) about housing prices through API calls. 

This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.


### Project Tasks
Project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:

* Test your project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

## Setup the Environment

python3 -m venv ~/.devops
source ~/.devops/bin/activate

Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`


### Files

```
#project-ml-microservice-kubernetes
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