# TodoDeployment

## Introduction

This project is a sample project to demonstrate how to deploy a Todo application using Docker, Docker Compose, and Jenkins.

## Prerequisites

- You need to have the following software installed on your machine:
    - Git
    - Docker
    - Docker Compose

## Installation

1. Clone the repository `git clone https://github.com/moheladwy/TodoDeployment.git Todo-Deployment`.

2. Change directory to the project `cd Todo-Deployment`.

3. Run the following command to build the Docker image `chmod +x ./start-all.sh` to make the script executable.

4. Run the following command to start the application `./start-all.sh` and it will do the following:
```
    - run the docker compose file for watchtower to monitor all the containers and update them if there is a new image.
    - run the docker compose file for the portainer to your host docker environment.
    - run the docker compose file for the Jenkins to setup the Jenkins environment and pipeline.
    - run the docker compose file for the Todo API application and Traefik as a reverse proxy and load balancer 
    (remember to change the domain name in the traefik configuration file to your domain name and the image name in the docker-compose file to your Docker Hub repository).
```

5. Open your browser and navigate to `https://localhost:9443` to access the portainer and create a new user account then login.

6. Remove any existing containers that is created by the docker compose file by going to the containers tab and click on the container then click on remove.

7. Open your browser and navigate to `http://localhost:8090` to access the Jenkins:
```
    - It will ask you for the secret key to unlock jenkins:
      - you can get it by running the following command in the console of the jenkins-blueocean container that you can access by:
      - going to the portainer and click on the Jenkins container then click on the console button and press connect: 
      - run `cat /var/jenkins_home/secrets/initialAdminPassword`
    - Copy the secret key and paste it in the Jenkins unlock page.
    - Click on done and then install the suggested plugins.
    - Create a new admin user and click on save and finish.
    - Click on start using Jenkins.
    - Create a new pipeline and configure it to use the Jenkinsfile in the repository `https://github.com/moheladwy/TodoFullstack.git`.
    - Create a new credential to access you Docker Hub and add it to the Jenkins pipeline.
    - Change the Docker Hub repository in the Jenkinsfile to your Docker Hub repository.
    - Save the pipeline configuration.
    - Run the pipeline and it will build the Todo API Image and push it to the Docker Hub.
```
8. After the pipeline is finished, run the following command to start the Todo API application `docker-compose -f todo-compose.yml up -d`.

9. After the pipeline is finished, watchtower will update the Todo API container with the new image after it is pushed to the Docker Hub.

10. After the pipeline is finished, you can access the Todo API application by navigating to `https://localhost:8070/swagger/index.html` in your browser.

## License

This project is open source and available under the MIT License. You are free to use, modify, distribute, and learn from this code as you like.

## Author

 - Mohamed Al-Adawy.
 - You can see my other projects on my [GitHub Profile](https://github.com/moheladwy), or [My Website](https://al-adawy.netlify.app/).
 - You can contact me on my [LinkedIn Profile](https://www.linkedin.com/in/mohamedhusseineladwy/).