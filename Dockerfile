FROM alpine:latest

# Copy your PHP file into the image
COPY additional.php /app/additional.php

# On container start, copy it to the mounted volume
CMD sh -c 'mkdir -p /config/system && \
            if [ ! -f /config/system/additional.php ]; then \
              cp /app/additional.php /config/system/additional.php && \
              echo "File copied."; \
            else \
              echo "File already exists, skipping."; \
            fi'
