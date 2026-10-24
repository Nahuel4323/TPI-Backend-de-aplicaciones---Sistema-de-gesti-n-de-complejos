# PostgreSQL de los microservicios

El servicio Docker Compose `app-db` ejecuta PostgreSQL 17, separado del de Keycloak.
Publica `127.0.0.1:5433` y persiste los datos en el volumen `app-db-data`.
No modifica el PostgreSQL instalado en la computadora ni importa sus datos.

| Base | Usuario propietario | Contrasena en el .env raiz |
| --- | --- | --- |
| users_db | users | USERS_DB_PASSWORD |
| spaces_db | spaces | SPACES_DB_PASSWORD |
| bookings_db | bookings | BOOKINGS_DB_PASSWORD |

El usuario `app_admin`, cuya clave es `APP_DB_ADMIN_PASSWORD`, se usa para
administrar este PostgreSQL. Los microservicios usan sus usuarios propios.

## Primera configuracion de un integrante

1. Instalar e iniciar Docker Desktop con contenedores Linux.
2. Desde la raiz, copiar `.env.example` a `.env` solo si no existe.
3. Completar las claves de Keycloak, `APP_DB_ADMIN_PASSWORD` y las tres claves de
   los servicios en ese archivo. Elegir valores locales; no subir el `.env` a Git.
4. En cada microservicio, copiar `.env.example` a `.env` si no existe y completar
   `DB_PASSWORD` con la clave correspondiente del `.env` raiz. Conservar el usuario
   y la URL JDBC de la plantilla. El gateway no necesita credenciales de PostgreSQL.
5. Desde la raiz ejecutar:

```powershell
docker compose config --quiet
docker compose up -d
docker compose ps
docker compose logs --tail 50 app-db
```

Para levantar solamente este PostgreSQL: `docker compose up -d app-db`.
Luego ejecutar los microservicios con JDK 25 desde sus carpetas usando
`.\mvnw.cmd spring-boot:run`.

`APP_DB_PORT` cambia el puerto publicado. Si se cambia, actualizar tambien `DB_URL`
en los `.env` de los tres microservicios. Estos se ejecutan en la computadora;
si en el futuro se ejecutan dentro de Docker, deberan usar el host `app-db` y puerto 5432.

## Creacion y persistencia

El script `init/01-create-databases.sh` crea usuarios, bases y permisos solo al
inicializar un volumen vacio. Las tablas de negocio se crean y actualizan a partir
de las clases `@Entity` al iniciar cada microservicio, con `ddl-auto=update` para
desarrollo local. Sin entidades todavia no habra tablas de negocio. Los cambios
complejos, como renombrar columnas, pueden requerir SQL o migraciones.

`docker compose stop` y `docker compose down` conservan los datos. No ejecutar
`docker compose down -v` para reiniciar el entorno: elimina los volumenes,
incluido el de Keycloak. Cada integrante conserva sus propios datos locales.

Editar las claves del `.env` despues de inicializar el volumen no cambia las claves
de PostgreSQL. Es necesario cambiar tambien la clave del usuario en la base y
actualizar el `.env` de su servicio. No borrar el volumen para cambiar una clave.

Si la inicializacion falla, revisar los logs antes de reiniciar: los scripts no
se vuelven a ejecutar sobre un directorio de datos ya inicializado.

pgAdmin es opcional. Para conectarse usar host `localhost`, puerto `5433`, la base
y las credenciales del servicio; para administracion usar `app_admin`.

Referencia: [imagen oficial PostgreSQL](https://hub.docker.com/_/postgres).
