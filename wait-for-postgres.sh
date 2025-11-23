#!/bin/sh
# wait-for-postgres.sh
# usage: ./wait-for-postgres.sh <host> <cmd...>

host="$1"
shift
cmd="$@"

echo "Waiting for postgres at $host:5432 ..."

# nc が 0 を返すまでループ
while ! nc -z "$host" 5432; do
  echo "waiting"
  sleep 1
done

echo "Postgres is ready! Executing command..."
exec "$@"
