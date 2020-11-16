# CHANGELOG

## 1.6.4
---
### Data Manager
    Fixed bugs:

        Audio/video incremental alert error (unique alerts on no audio streams)

        Probe restart due to memory issues that not included the program number for MUX config

        * No content uniqueness alert issues -> Incremental if last document is equal       
<br>

    Added functionality to get program number from MUX URL. Now we are able to obtain all channels from MUX.
### Web

    Added find MUX programs button in settings. Information available from program is filled automatically.

### Video Quality Probe

    Fixed performance issues, reducing memory consumption and cpu by 20%.

    Threading size adjusted for future blockloss implementation

<br/>

## 1.6.3
---
### Web
	Fixed bug on historic dashboard to avoid showing old records

	VoD and playlist videos show HH:mm:SS format in dashboard, historic and journey

	Added support for MUX program number
       
    Login advertising the user if the credentials where wrong

    Removed MOS value to avoid confusions in historic 

### Video Quality Probe
	Now we can select a program from a multiplex to launch the probe

### Data Manager 
	Added support for MUX program number configuration and probe launch

	Now we send video_second information to the website in order to parametrize vod videos

    Managing vod alerts using video_seconds instead of timestamps to have a more precise approach

### Video Quality Prediction
    Reducing docker size by selecting only stacking mode and avoiding blocking pipelines
      
### Others
    Added persistance to mongodb using auto-folder creation
<br>

## 1.6.2
---
### Video Quality Prediction
    Added super exhaustive mode
   
    Updated database version for training (v14). Trained all pipelines with that version

### Data Manager
    Added support for super exhaustive mode

    Fixed bug of missing columns at csv file

    Improved the performance of historic queries by 70%. Journey retrieval reduced from 35 seconds to 10-11

### Video Quality Probe
    Included logger with ENV variable log level to improve performance and metrics on production

### Web
    Improved significantly the performance of the historic graph data retrieval after solving a bug related to constant graphic rendering

<br>

## 1.6.1
---
### Data Manager
    Fixed bugs with Playlist player and long pending requests due to EPG programs

### Video Quality Probe 
    Added async processing to improve performance

    Added support for future SUPER-EXHAUSTIVE Mode

### Deployment
    Unique webgrabplus container with shared volumes

### Others
    Move repo to meta git to avoid issues with submodules
<br>

## 1.6.0
---

### General
    Added EPG support using webgrabplus

<br><br><br>

## 1.5.4
---

### Data Manager
    Included user friendly name generation at CSV/JSON files
   
    Added user friendly nomenclature for datetimes 

### Websonda
    Parsed datetimes creating more user friendly dates

<br>

## 1.5.3
---
### Data Manager
    Fixed playlist player issues with Gunicorn workers

    Added alerts into csv generation

<br>

## 1.5.2
---
### Video Quality Probe
    Fixed stability issue by returning to VQProbe from version 1.5.0

<br>

## 1.5.1
---
### Data Manager
    Fixed bug in historic consult menu.

    Added alert for detecting no content available.

### Video Quality Analysis
    Fixed bug with OpenCV dependencies from 3.4.10 update. Prefixed 3.4.9 version

<br>

## 1.5.0
---
### Video Quality Analysis
    Added blurring analysis.

    Increased MOS database content in 5844 annotated sequences.

    Improved performance of VideoQA pipelines for Artificial Intelligence models.

    Ensemble models instead of single predictors.

    Added documentation for VideoQA and Data Manager modules.


### Video Quality Probe

    Measures now last 3 seconds to improve results from Video Quality Analysis.

    Fixed bitrate calculation issues.

    Improved performance on Vod and Live modes.


### Data Manager

    Fixed multiple bugs related to performance and document retrieval.

    API endpoints now structured using standard definitions explained in https://restfulapi.net/resource-naming
    
    Improved MongoDB performance.
