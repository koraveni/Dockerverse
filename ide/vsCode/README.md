# Instructions

### First Time
* Execute `run-container.sh`  or `run-container.sh /path/to/work/dir`.
* This will pull the [image](https://hub.docker.com/r/dockerverse/vscode) if not available locally  and then start VSCode in a container with GUI forwarded to your local machine (host) display. 
* `/path/to/work/dir` on your local machine will be mirrored in `/home/developer/VSCodeProjects` inside the container
* If `/path/to/work/dir` is not provided it wil defalut to `$HOME` on your local machine
* Closing VSCode will close the container
* `run-container.sh` expects `env.sh` to be in same folder, before executing the script ensure they are.

### After First Time
* Execute `docker container start vscode` 
* This will restart VSCode your local(host) work directory should be at `/home/developer/VSCodeProjects` inside the container

# Description of Files
* `env.sh` : contains all the environemntal variables. To change version of VSCode update this
* `build-image.sh` : contains docker command to build image 
* `vsCode.Dockerfile` : dockerfile for `vscode` image
* `run-contianer.sh`: contains docker command to run container from the image. Volume binding and GUI forwarding are done here.

# Miscellaneous
* The password for both root user and vscode user are set to 'password' in the script
* Once intstalled, to change the in-built terminal in vscode to bash refer this [link](https://askubuntu.com/questions/1117868/change-default-terminal-back-to-bash-in-vs-code)
