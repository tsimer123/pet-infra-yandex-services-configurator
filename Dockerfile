FROM ghcr.io/runatlantis/atlantis:v0.20.1

COPY ./hacks/auto-backend*.sh /hacks/
COPY ./policies /policies
