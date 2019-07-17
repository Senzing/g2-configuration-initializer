ARG BASE_IMAGE=senzing/senzing-base:1.0.3
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2019-07-17

LABEL Name="senzing/g2-configuration-initializer" \
      Maintainer="support@senzing.com" \
      Version="1.0.0"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Copy files from repository.

COPY ./g2-configuration-initializer.py /app/

# Runtime execution.

ENV SENZING_DOCKER_LAUNCHED=true

WORKDIR /app
ENTRYPOINT ["/app/docker-entrypoint.sh", "/app/g2-configuration-initializer.py"]
CMD [""]
