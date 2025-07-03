FROM postgres:17.5-bookworm

# https://www.postgresql.org/docs/current/textsearch-dictionaries.html
# https://github.com/Tecktron/docker-PostgreSQL-Hunspell
RUN apt-get update && apt-get install -y \
    hunspell-en-us \
    && rm -rf /var/lib/apt/lists/*

# update the dictionary files.
RUN /usr/sbin/pg_updatedicts

# copy in maw-media specific xsyn rules
COPY maw_media_xsyn.rules /

RUN set -eux; \
    mv /maw_media_xsyn.rules "$(pg_config --sharedir)/tsearch_data/"
