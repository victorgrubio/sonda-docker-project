# VideoMOS Update Guide

> **WARNING**
> 
> Please stop the current analysis procedures before updating the VideoMOS systems.

If you want to update your VideoMOS installation, please remove the containers you desire to update.
As you may know, the complete deployment of one VideoMOS analysis system requires sonda, websonda and mongo containers to work.


Let's define different examples to learn how to update our system.

## Use case 1
> ### Update analysis probe (sonda) container
### Remove containers from previous versions
To illustrate this, let's say we perform an update for the SONDA docker only. To do so, we check our current running containers using:
```
docker container ls --all
```
The Videomos containers have the following structure:
```
PORT_NAME, where NAME can take the next values: sonda, mongo, websonda
```
Therefore, if we want to update our sondas, we should remove all containers with the *_sonda* ending, using:
```
docker rm -f PORT1_sonda PORT2_sonda ... PORTN_sonda
```
> **REMINDER**
>
> Please stop the current analysis procedures before updating the VideoMOS systems.

### Create containers with new versions
After the containers have been removed, we should create the containers for the newer version.
To do so, we should just execute the command
``` ./launch_videomos_release.sh NUM_SONDA ``` from the new release directory, i.e. 1.5.1.
**NUM_SONDA** parameter, as referred in previous documents, selects the sonda id and defines the ports it will be using.

After the docker container is created, you can access the website address to restart the analysis procedures.

## Use case 2
> ### Update analysis probe (sonda) and website (websonda) containers 


### Remove containers from previous versions
First, we check our current running containers using:
```
docker container ls --all
```
The Videomos containers have the following structure:
```
PORT_NAME, where NAME can take the next values: sonda, mongo, websonda
```
Therefore, if we want to update our sondas, we should remove all containers with the *_sonda* and *_websonda* endings, using:
```
docker rm -f PORT1_sonda PORT2_sonda ... PORTN_sonda
docker rm -f PORT1_websonda PORT2_websonda ... PORTN_websonda
```

> **REMINDER**
>
> Please stop the current analysis procedures before updating the VideoMOS systems.

### Create containers with new versions
After the containers have been removed, we should create the containers for the newer version.
To do so, we should just execute the command
``` ./launch_videomos_release.sh NUM_SONDA ``` from the new release directory, i.e. 1.5.1.
**NUM_SONDA** parameter, as referred in previous documents, selects the sonda id and defines the ports it will be using.

After the docker container is created, you can access the website address to restart the analysis procedures.


## Use case 3
> ### Update analysis complete system (mongoDB, sonda and websonda) 

> **DANGER**
>
> If mongodb containers are removed, all information stored from previous analysis will be lost. To avoid this, please export the DB from the website using the *Import/Export* menu. After the update is performed, you can import the content using the same menu for the new database version.

### Remove containers from previous versions
First, we check our current running containers using:
```
docker container ls --all
```
The Videomos containers have the following structure:
```
PORT_NAME, where NAME can take the next values: sonda, mongo, websonda
```
Therefore, if we want to update our sondas, we should remove all VideoMOS containers  using:
```
docker rm -f PORT1_sonda PORT2_sonda ... PORTN_sonda
docker rm -f PORT1_websonda PORT2_websonda ... PORTN_websonda
docker rm -f PORT1_mongo PORT2_mongo ... PORTN_mongo
```
> **REMINDER**
>
> Please stop the current analysis procedures before updating the VideoMOS systems.

### Create containers with new versions
After the containers have been removed, we should create the containers for the newer version.
To do so, we should just execute the command
``` ./launch_videomos_release.sh NUM_SONDA ``` from the new release directory, i.e. 1.5.1.
**NUM_SONDA** parameter, as referred in previous documents, selects the sonda id and defines the ports it will be using.

After the docker container is created, you can access the website address to restart the analysis procedures.
