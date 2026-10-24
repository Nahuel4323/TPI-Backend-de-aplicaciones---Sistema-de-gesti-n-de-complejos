#!/bin/bash
set -e

# psql escapa las contrasenas como literales SQL mediante :'variable'.
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" \
  --set=users_password="$USERS_DB_PASSWORD" \
  --set=spaces_password="$SPACES_DB_PASSWORD" \
  --set=bookings_password="$BOOKINGS_DB_PASSWORD" <<'SQL'
CREATE ROLE users LOGIN PASSWORD :'users_password';
CREATE ROLE spaces LOGIN PASSWORD :'spaces_password';
CREATE ROLE bookings LOGIN PASSWORD :'bookings_password';

CREATE DATABASE users_db OWNER users;
CREATE DATABASE spaces_db OWNER spaces;
CREATE DATABASE bookings_db OWNER bookings;

REVOKE CONNECT ON DATABASE users_db FROM PUBLIC;
REVOKE CONNECT ON DATABASE spaces_db FROM PUBLIC;
REVOKE CONNECT ON DATABASE bookings_db FROM PUBLIC;
GRANT CONNECT ON DATABASE users_db TO users;
GRANT CONNECT ON DATABASE spaces_db TO spaces;
GRANT CONNECT ON DATABASE bookings_db TO bookings;
SQL
