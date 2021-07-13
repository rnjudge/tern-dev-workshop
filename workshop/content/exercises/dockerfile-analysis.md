Tern can also perform analysis and generate an SBoM for Dockerfiles. Tern will build the image, analyze it with respect to the Dockerfile and discard the image. This might be useful to engineers who are developing a Dockerfile for their app or in a container build and release pipeline. Note that if the Dockerfile fails to build, Tern will only inventory the base image in the dockerfile. To analyze a Dockerfile, run:

```
$ tern report -d <path_to_dockerfile> -o dockerfile_output.txt
```
