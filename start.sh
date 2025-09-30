#!/bin/bash

# Start Wetty, listening on all interfaces, on the port provided by Render ($PORT, defaulting to 3000).
# --base / : Ensures Wetty works at the root of the URL.
# --host 0.0.0.0 : Makes the server accessible from outside the container.
# sudo ... : Command to start the shell as the specified user.
/usr/src/app/node_modules/.bin/wetty --port "${PORT:-3000}" --host 0.0.0.0 --base / -- sudo -u noejunior299 /bin/bash
