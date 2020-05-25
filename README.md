# RaspbianYouTrack
Run YouTrack in a Raspberry PI 4 container

This Docker image is based on the JetBrains Docker 'jetbrains/youtrack:<version>' and the image from Raerten at uniplug/youtrack.
  
This repository contains a UNOFFICIAL Docker image of JetBrains YouTrack.

- The Docker image is available at RaspbianYouTrack


# Usage

docker build -t youtrack .

# Start from Docker host
Create the local directories: 

```sh
mkdir /opt/youtrack /opt/youtrack/data /opt/youtrack/data
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
