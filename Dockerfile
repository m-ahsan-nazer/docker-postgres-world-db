# Init Example Database World on PostgreSQL
ARG POSTGRES_TAG=16.1
FROM postgres:$POSTGRES_TAG

ENV POSTGRES_USER world
ENV POSTGRES_PASSWORD world123
ENV POSTGRES_DB world-db

# Install Vim
RUN apt-get update \
    && apt-get install -y vim \
    && rm -rf /var/lib/apt/lists/*

# Install Python 3 and pip
RUN apt-get update \
    && apt-get install -y python3-pip \
    && rm -rf /var/lib/apt/lists/*

# for psycopg2 see https://www.pgcli.com/install
RUN apt-get update \
    && apt-get install -y libpq-dev python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install pgcli
RUN pip3 install --no-cache-dir --break-system-packages pgcli


# Copier les scripts SQL dans : 
ADD scripts/*.sql /docker-entrypoint-initdb.d/
ADD scripts/*.csv /docker-entrypoint-initdb.d/

# Copier les scripts d'init dans : 
#ADD scripts/*.sh /docker-entrypoint-initdb.d/

COPY docker-healthcheck /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-healthcheck


HEALTHCHECK CMD ["docker-healthcheck"]
