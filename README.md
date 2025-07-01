# maw-media-postgres

This project contains the custom postgres image build for maw-media.  In particular, this sets up a few things:

- hunspell en_us dictionary
- custom thesaurus

## Thanks

Thanks to a number of resources that made me reconsider using Postgres Full Text Search rather than OpenSearch
(or Solr like I've played with in the past).  This is compelling as my search needs are pretty small at the moment
and managing security / data freshness / etc all through postgres is a huge win.

Here are some of the key resources I came across:

- https://www.youtube.com/watch?v=szfUbzsKvtE
- https://www.youtube.com/watch?v=2kGn1_aWU7o&list=PLH8y1BNPAKjINrqfH-KIs1uuU8g95tNem
- https://www.postgresql.org/docs/current/textsearch-dictionaries.html
- https://github.com/Tecktron/docker-PostgreSQL-Hunspell
