# RaspbianYouTrack
Run YouTrack in a Raspberry PI 4 container

This Docker image is based on the JetBrains Docker 'jetbrains/youtrack:<version>' and the image from Raerten at uniplug/youtrack.
  
This repository contains a UNOFFICIAL Docker image of JetBrains YouTrack.

- The Docker image is available at roly197/RaspbianYouTrack


# Usage
```sh
docker build -t youtrack .
```

# Start from Docker host
Create the local directories: 

```sh
mkdir /opt/youtrack /opt/youtrack/data /opt/youtrack/backup
```

Now start the container

```sh
docker run -d \
 --name="youtrack" \
 -v /opt/youtrack/data/:/opt/youtrack/data/ \
 -v /opt/youtrack/backup/:/opt/youtrack/backup/ \
 -p 80:8081 \
youtrack
```

# First time startup 
Get your wizard_token from the file system: 
```sh
cat /opt/youtrack/data/conf/internal/services/configurationWizard/wizard_token.txt
```
After startup (could take a minute), point your browser to the instance. 
The initial login page will present you with a 'Hang in there...' page; Now paste your token in the token field and finalize your installation.  
