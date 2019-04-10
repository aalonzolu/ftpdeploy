# docker-ftpdeploy

Docker image for ftp deployment
### Usage
Inside the container `upload $HOST $USERNAME $PASSWORD ./ $TARGETFOLDER`

gitlab CI/CD (.gitlab-ci.yml)
```image: aalonzolu/ftpdeploy
stages:
  - deploy
deploy_dev:
  stage: deploy
  script:
    - upload $HOST $USERNAME $PASSWORD ./ $TARGETFOLDER```
