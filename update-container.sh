#!/bin/bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "$0")" && pwd)
cd "$SCRIPT_DIR"

SERVICES=$(docker compose config --services)


if [ -z "$SERVICES" ]; then
	echo "Error: no services found in docker-compose.yaml"
	exit 1
fi

echo "Select a service to update:"
select_service() {
	INDEX=1
	for SERVICE in $SERVICES; do
		echo "$INDEX) $SERVICE"
		INDEX=$((INDEX + 1))
	done

	while :; do
		printf "#? "
		read -r SELECTION
		INDEX=1
		for SERVICE in $SERVICES; do
			if [ "$SELECTION" = "$INDEX" ]; then
				SERVICE_NAME=$SERVICE
				return 0
			fi
			INDEX=$((INDEX + 1))
		done
		echo "Invalid selection. Choose a number from 1 to $((INDEX - 1))."
	done
}

select_service

echo "Update service: $SERVICE_NAME"

echo "Updating blog brain notes..."
make -C "$SCRIPT_DIR/blog-brain" update-note

docker compose build --no-cache "$SERVICE_NAME"

docker compose pull "$SERVICE_NAME"
docker compose up -d --force-recreate "$SERVICE_NAME"

echo "Update complete for $SERVICE_NAME."
