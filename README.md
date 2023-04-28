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


```
docker login
❯ docker tag josdoaitran/slack_bot_alpha:1.2 josdoaitran/slack_bot_alpha:1.2
❯ docker push josdoaitran/slack_bot_alpha:1.2
```