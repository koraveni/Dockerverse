# Instructions

### First Time
* Execute `run-container.sh`  or `run-container.sh /path/to/work/dir`.
* This will pull the [image](https://hub.docker.com/r/dockerverse/intellij-idea) if not available locally  and then start Intellij in a container with GUI forwarded to your local machine (host) display. 
* `/path/to/work/dir` on your local machine will be mirrored in `/home/developer/IdeaProjects` inside the container
* If `/path/to/work/dir` is not provided it wil defalut to `$HOME` on your local machine
* Closing Intellij will close the container
* `run-container.sh` expects `env.sh` to be in same folder, before executing the script ensure they are.

### After First Time
* Execute `docker container start intellij` 
* This will restart Intellij your local(host) work directory should be at `/home/developer/IdeaProjects` inside the container

# Description of Files
* `env.sh` : contains all the environemntal variables. To change version of Intellij, Java etc update this
* `build-image.sh` : contains docker command to build image 
* `intellijIDEA.Dockerfile` : dockerfile for `intellij-idea` image
* `run-contianer.sh`: contains docker command to run container from the image. Volume binding and GUI forwarding are done here.
