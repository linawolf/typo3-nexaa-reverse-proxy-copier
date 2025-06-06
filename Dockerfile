FROM alpine:latest

RUN apk add --no-cache gettext

COPY additional.php.template /app/additional.php.template
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
