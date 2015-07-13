<img src="http://jenkins-ci.org/sites/default/files/jenkins_logo.png"/>

This images extends the [Official Jenkins Docker Image](https://github.com/jenkinsci/docker).
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

3. Pull the latest jenkins container

    ```
    docker pull indatus1/jenkins
    ```
4. Start the new jenkins container with the volumes from the old container.

    `$ docker run -d --name name_of_new_container --volumes-from name_of_previous_container indatus1/jenkins`

    ** NOTE: the example above presumes that the previously deployed jenkins container is named jenkins.domain.com.a and the new container will be named jenkins.domain.com.b
5. Remove the old container
    
    ```
    docker rm name_of_previous_container
    ```

