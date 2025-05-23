#! /bin/sh
docker stop nakama
konsole --noclose -e docker compose -f /home/tiller-server/nakama/docker-compose.yml up
