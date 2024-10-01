#!/bin/bash
set -e

# Skip the script if the database is already initialized
if [ -f /var/lib/postgresql/data/PG_VERSION ]; then
  echo "Database is already initialized."
  exit 0
fi

# Wait for PostgreSQL to start
until pg_isready -U "$POSTGRES_USER"; do
  echo "Waiting for PostgreSQL to start..."
  sleep 2
done

psql -U postgres -c "CREATE ROLE yogi WITH LOGIN PASSWORD 'yogi';"

# Restore the database from the dump
pg_restore -U "$POSTGRES_USER" -d "$POSTGRES_DB" /docker-entrypoint-initdb.d/TemaccessToRemoteRp2.dump
