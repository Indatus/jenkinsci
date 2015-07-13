<img src="http://jenkins-ci.org/sites/default/files/jenkins_logo.png"/>


This image extends the [Official Jenkins Docker Image](https://github.com/jenkinsci/docker).
Refer to the README in the official repo for installation instructions.

## Usage

```
docker run -p 8080:8080 -p 50000:50000 indatus1/jenkins
```

## Added Features

* Set Jenkins timezone
* Docker
* Docker Compose
* Docker Machine

## Updates

1. Grab your jenkins container id.

    ```
    $ docker ps | grep jenkins.container.name
    e6e530c9d9ed        indatus1/jenkins        ...
    ```

2. Stop the jenkins container.

    `$ docker stop e6e530c9d9ed`

3. Start the new jenkins container with the volumes from the old container.

    `$ docker run -d --name jenkins.container.name --volumes-from e6e530c9d9ed indatus1/jenkins`

# Contributing

```
git clone git@github.com:Indatus/jenkinsci.git
cd jenkinsci
# or whatever docker-machine host you have runnint
eval "$(docker-machine env dev)"
docker build -t indatus1/jenkins ./
docker push indatus1/jenkins
```
