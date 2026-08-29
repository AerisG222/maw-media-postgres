# maw-media-postgres

Retired.  maw-media now runs the official `postgres:18-trixie` image directly.

This repo existed to bake three files into a custom postgres image so that
postgres full text search could use a hunspell dictionary and a custom xsyn
rules file - postgres only reads text search dictionaries from
`$SHAREDIR/tsearch_data`, and that was the obvious way to get them there.
Mounting the same three files into the stock image does the job just as well,
without a build to maintain and without lagging behind upstream postgres
releases.

Everything moved into the maw-media repo:

- `src/db-postgres/tsearch_data/` - `en_us.dict`, `en_us.affix` and
  `maw_media_xsyn.rules`
- `src/db-postgres/gen-tsearch-data.sh` - regenerates the hunspell dictionaries
  from the `hunspell-en-us` package by running `pg_updatedicts` inside the stock
  image
- `deploy/templates/kube.yml.j2` - mounts the three files into the pod

The one thing to know if you do this elsewhere: mount the files individually
rather than mounting the directory.  A directory mount hides the stock contents
of `tsearch_data`, which includes the `english.stop` that
`StopWords = english` depends on.

The old `aerisg222/maw-media-postgres` images are still on Docker Hub and are no
longer built or pushed.

## Thanks

Thanks to a number of resources that made me reconsider using Postgres Full Text Search rather than OpenSearch
(or Solr like I've played with in the past).  This is compelling as my search needs are pretty small at the moment
and managing security / data freshness / etc all through postgres is a huge win.

Here are some of the key resources I came across:

- https://www.youtube.com/watch?v=szfUbzsKvtE
- https://www.youtube.com/watch?v=2kGn1_aWU7o&list=PLH8y1BNPAKjINrqfH-KIs1uuU8g95tNem
- https://www.postgresql.org/docs/current/textsearch-dictionaries.html
- https://github.com/Tecktron/docker-PostgreSQL-Hunspell
