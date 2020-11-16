# Development Executable Scripts
In this folder we have the different executable scripts to run for building the sonda-docker project in docker.

## only_start_sonda_docker_dev.sh
Creates the docker for backend and mongodb. This is useful to test the API without using the web interface.

To run this script, execute the following command:
```
./only_start_sonda_docker.dev NUM_SONDA
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

## start_docker_compose_dev.sh
Creates the docker for the complete project: website, backend and mongodb.

To run this script, execute the following command:
```
./start_docker_compose.dev NUM_SONDA
```
Where the *NUM_SONDA* behaviour is equal to the *only_start_sonda_docker_dev.sh* section.

## test_sonda_docker_compose_dev.sh
Creates the docker for testing the backend part with the tests defined in data_manager.

To run this script, execute the following command:
```
./test_start_docker_compose.dev NUM_SONDA
```
Where the default value of *NUM_SONDA* is 50 to avoid any possible conflict with running versions.