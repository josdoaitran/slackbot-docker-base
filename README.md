# slackbot_docker_base

## Setup local
- Install Docker
- Install python3
- Setup virtual python on the project:
```commandline
python3 -m venv .venv
source .venv/bin/activate
pip3 install -r requirements.txt
```

Publish here: https://hub.docker.com/repository/docker/josdoaitran/slack_bot_alpha

```agsl
# Build image on MacOSX to publish for architecture: AMD86
docker buildx build . --platform=linux/amd64 -t josdoaitran/slack_bot_alpha:3.1.1
docker image inspect josdoaitran/slack_bot_alpha:3.1.1
# Check Architecture 
"Architecture": "amd64"
Then, it can support: linux/arm64/v8
# If we run without --platform=linux/amd64
"Architecture": "linux/arm64/v8"
```

```agsl
# Build image on Windows or Linux x86 to publish for architecture: AMD86
docker buildx build . -t josdoaitran/slack_bot_alpha:3.1.1
docker image inspect josdoaitran/slack_bot_alpha:3.1.1
# Check Architecture
"Architecture": "amd64"
```

```
# Push
docker login
❯ docker tag josdoaitran/slack_bot_alpha:3.1.1 josdoaitran/slack_bot_alpha:3.1.1
❯ docker push josdoaitran/slack_bot_alpha:3.1.1
```