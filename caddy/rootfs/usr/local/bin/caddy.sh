#!/bin/ash

set -eu

case "${1:-}" in
    ''|-*) set -- run "${@}"                                                  ;;
    *)                                                                        ;;
esac

case "${1}" in
    reload|run|start|stop|validate)
        set -- "${@}"                                                          \
            ${X_CADDY_CONFIG:+--config="${X_CADDY_CONFIG}"}                    \
            ${X_CADDY_CONFIG_ADAPTER:+--adapter="${X_CADDY_CONFIG_ADAPTER}"}  ;;
    *) ;;
esac

if [ -z "${X_CADDY_LOG_JQ:-}" ] || [ "${X_CADDY_LOG_JQ:-}" = "0" ]; then
    exec /usr/bin/caddy "${@}"
fi

if [ -f /etc/caddy/log.jq ]; then
    exec /usr/bin/caddy "${@}" 2>&1 | jq -rf /etc/caddy/log.jq
else
    exec /usr/bin/caddy "${@}" 2>&1 | jq -rf /usr/local/share/caddy/log.jq
fi
