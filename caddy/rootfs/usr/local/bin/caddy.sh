#!/bin/ash

set -eu

if [ -z "${CADDYSH_LOG_JQ:-}" ] || [ "${CADDYSH_LOG_JQ:-}" = "0" ]; then
    exec /usr/bin/caddy "${@}"
fi

if [ -f /etc/caddy/log.jq ]; then
    exec /usr/bin/caddy "${@}" 2>&1 | jq -rf /etc/caddy/log.jq
else
    exec /usr/bin/caddy "${@}" 2>&1 | jq -rf /usr/local/share/caddy/log.jq
fi
