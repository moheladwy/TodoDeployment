#!/bin/bash
docker-compose -f watchtower-compose.yml up -d
docker-compose -f portainer-ce-compose.yml up -d
docker-compose -f todo-compose.yml up -d
