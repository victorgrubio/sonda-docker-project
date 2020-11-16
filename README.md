# VideoMOS
Mean Opinion Score estimator for Video content.

## Installation
#### Dependencies
	docker
	docker-compose

Download the zip from a release of this project and unzip it:
```
unzip latest.zip
```
### Install using DockerHub

> **WARNING** 
>
> If the *latest* version is selected, please consider it will possible have some bugs as it is a development version.
>
> If you find any bug, please report it to the development team.

List of versions available: [Releases](https://gitlab.com/AndresAAV/sonda-docker/-/releases) 

Go to the **releases** folder and select the version you want to install. In the correspondent version folder, run the next command:
```bash
./launch_videomos_release.sh NUM_SONDA
```
Where *NUM_SONDA* is an integer to select the PORTS to be runned. If empty, the default value is 1 and the ports are:

-   5001 for API
-   5000 for VideoQA
-   3000 for Website
-   27020 for MongoDB

If we increment the number, i.e. for NUM_SONDA=2, we will have:

-   5003 for API
-   5002 for VideoQA
-   3001 for Website
-   27021 for MongoDB

As observed, API and VIDEOQA increments in 2 * *NUM_SONDA* and Website in Mongo increments in *NUM_SONDA* values.

### Source code installation (Recommended for development)

Before creating the docker images, we need to compile the VideoQualityAnalysis module. To do so, go to the **video-quality-prediction** submodule and run:
```bash
./compile_videoqualityprediction.sh
```

To install the latest version using the source code and create the docker-compose images from scratch, go to the **bin** folder and run one of the next scripts:

- **only_start_docker_compose_dev.sh** to create the backend and the database.
- **start_docker_compose_dev.sh** to create the website alongside the backend and the databse.

Both scripts and the testing part is described in the README file at the bin folder.

## Documentation

This project contains a Wiki specifying the documentation for each different module. You can access it from [here](https://gitlab.com/AndresAAV/sonda-docker/-/wikis/home).

## Development

As this repo contains different submodules to scale properly, the next branching model is recommended to develop the Videomos Project.

**sonda-docker (this repo): dev**

### Submodules

|Data-manager|video-quality-prediction|videoqualityprobe_live| videoqualityprobe_vod|websonda|
|------------|--------|-----------|------------|-------------|
|dev| dev | dev | master | master |

### Git Workflow

To develop in this project, you should follow the git-flow branching model described [here](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow).

Each submodule follows this workflow. Feature branches should be created at submodule level.
