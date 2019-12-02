ARG BASE_IMAGE=senzing/senzing-base:1.2.1
FROM ${BASE_IMAGE}

ENV REFRESHED_AT=2019-07-23

LABEL Name="senzing/g2-configuration-initializer" \
      Maintainer="support@senzing.com" \
      Version="1.1.0"

HEALTHCHECK CMD ["/app/healthcheck.sh"]

# Run as "root" for system installation.

USER root

# Install packages via apt.

# Copy files from repository.

COPY ./g2-configuration-initializer.py /app/

# Make non-root container.

USER 1001

# Runtime execution.

ENV SENZING_DOCKER_LAUNCHED=true

WORKDIR /app
ENTRYPOINT ["/app/g2-configuration-initializer.py"]
