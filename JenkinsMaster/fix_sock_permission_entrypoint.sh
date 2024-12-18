#!/bin/bash

# Ensure /var/run/docker.sock has the required permissions
if [ -e /var/run/docker.sock ]; then
    chmod 666 /var/run/docker.sock
else
    echo "Warning: /var/run/docker.sock not found. Ensure you have mounted the Docker socket."
fi

# Pass control to the original Jenkins entrypoint
exec /usr/bin/tini -- /usr/local/bin/jenkins.sh "$@"