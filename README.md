
# TPI Backend — Gestión de Complejos Deportivos

Trabajo Práctico Integrador de la materia **Backend de Aplicaciones** de Ingeniería en Sistemas de Información — UTN Facultad Regional Córdoba.

## Descripción del proyecto

El proyecto consiste en desarrollar un sistema backend basado en una arquitectura de microservicios para gestionar complejos deportivos, sus canchas y las reservas realizadas por los clientes.

El sistema permitirá administrar la disponibilidad de las canchas, registrar reservas, gestionar pagos de señas, aplicar bonificaciones y realizar reprogramaciones ante condiciones climáticas desfavorables o tareas de mantenimiento.

## Arquitectura

El sistema estará compuesto por tres microservicios principales:

### 1. msvc-users
Responsable de gestionar los perfiles de clientes y administradores, así como su vinculación con Keycloak.

### 2. msvc-spaces
Responsable de gestionar los complejos deportivos, canchas, deportes, horarios, tarifas y ocupaciones.

También controlará la disponibilidad de los turnos, evitando reservas superpuestas.

### 3. msvc-bookings
Responsable de gestionar el ciclo de vida de las reservas:

- Solicitud y retención de turnos.
- Registro de pagos y confirmación.
- Cancelaciones.
- Evaluación de condiciones climáticas.
- Reprogramaciones.
- Bonificaciones por reservas frecuentes.

### Componentes adicionales

- **API Gateway:** punto de entrada al backend, enrutamiento y control de acceso.
- **Keycloak:** autenticación, autorización y administración de identidades.
- **Common Library:** librería JAR reutilizable entre microservicios.
- **API climática externa:** consulta de pronósticos para evaluar reservas.

## Tecnologías

- Java
- Spring Boot
- Spring Security
- Spring Cloud Gateway
- Spring Data JPA / Hibernate
- Spring RestClient
- Keycloak
- PostgreSQL
- Maven
- Docker y Docker Compose
- Swagger / OpenAPI
- Git y GitHub

## Estructura del repositorio

Se utilizará un único repositorio para todos los microservicios (monorepo).

```text
backend-complejos-deportivos/
├── api-gateway/
├── msvc-users/
├── msvc-spaces/
├── msvc-bookings/
├── common-lib/
├── docs/
├── docker-compose.yml
├── .gitignore
└── README.md
```

*La estructura se incorporará progresivamente durante el desarrollo.*

## Metodología de trabajo

El equipo utilizará una metodología basada en **Kanban**, organizando las historias de usuario, tareas, responsables y estados de desarrollo mediante Notion.

### Estrategia de ramas

Se utilizará una estrategia de trabajo basada en **ramas individuales permanentes**, donde cada integrante tendrá su propia rama de desarrollo.

- `main`: rama principal que contendrá las funcionalidades terminadas, revisadas e integradas.
- `dev/nombre-integrante`: rama personal donde cada integrante desarrollará las funcionalidades que tenga asignadas.

Las ramas personales se mantendrán durante todo el proyecto, evitando la necesidad de crear y eliminar ramas por cada funcionalidad.

### Reglas de trabajo en las ramas

Cada integrante trabajará sobre **una única funcionalidad a la vez** en su rama personal.

1. Antes de comenzar una funcionalidad, deberá sincronizar su rama con la última versión de `main`.
2. Desarrollará la funcionalidad asignada, realizando los commits necesarios.
3. Una vez finalizada y probada, creará un Pull Request para integrar los cambios en `main`.
4. La funcionalidad deberá ser revisada y aprobada por otro integrante antes de realizar el merge.
5. **No comenzará otra funcionalidad hasta que la anterior haya sido integrada en `main`.**
6. Después de cada integración, actualizará su rama personal con los últimos cambios de `main` antes de comenzar una nueva tarea.

Las ramas personales serán permanentes durante todo el proyecto y no se eliminarán después de cada integración.

### Organización de las funcionalidades

Las historias de usuario estarán registradas en el tablero Kanban de Notion.

Cada funcionalidad tendrá un responsable asignado, quien se encargará de su implementación, pruebas y documentación.

Los estados utilizados serán:

- **Pendiente:** funcionalidad todavía no iniciada.
- **Lista para empezar:** funcionalidad disponible para comenzar.
- **En curso:** funcionalidad en desarrollo.
- **En revisión:** funcionalidad terminada, pendiente de revisión e integración.
- **Terminada:** funcionalidad integrada y verificada.

### Flujo de trabajo

1. Seleccionar una historia de usuario del tablero Kanban y asignar un responsable.
2. Actualizar la rama personal con los últimos cambios de `main` antes de comenzar una nueva funcionalidad.
3. Implementar la funcionalidad en la rama personal, realizando commits descriptivos a medida que se avanza.
4. Probar los cambios y verificar que se cumplan los criterios de aceptación de la historia.
5. Subir los cambios a GitHub y crear un Pull Request hacia `main`.
6. Solicitar la revisión de otro integrante del equipo.
7. Una vez aprobados los cambios, integrar la funcionalidad en `main` y actualizar su estado en Notion.
8. Sincronizar nuevamente la rama personal con `main` antes de comenzar otra funcionalidad.

**Importante:** cada Pull Request deberá incluir únicamente los cambios correspondientes a la funcionalidad que se está integrando. Las ramas personales no se eliminarán después de realizar un merge.

### Convención de commits

Se utilizarán mensajes descriptivos siguiendo la convención *Conventional Commits*.

Ejemplos:

```text
feat(users): agregar registro de clientes
fix(bookings): corregir validacion de disponibilidad
docs: actualizar documentacion de endpoints
chore: configurar proyecto Spring Boot
test(users): agregar pruebas de registro
refactor(spaces): mejorar validacion de horarios
```

### Integración y sincronización

Antes de comenzar una nueva funcionalidad, cada integrante deberá incorporar a su rama personal los últimos cambios disponibles en `main`.

Esto permitirá trabajar sobre una versión actualizada del proyecto y reducir los posibles conflictos durante la integración.

Los cambios se incorporarán a `main` exclusivamente mediante Pull Requests revisados por otro integrante del equipo.


## Documentación

La documentación del proyecto incluirá:

- Modelo de dominio y reglas de negocio.
- Diagramas de bases de datos.
- Diagramas de arquitectura C4 (C1 y C2).
- Documentación de APIs mediante Swagger/OpenAPI.
- Instrucciones de instalación y ejecución.

## Estado del proyecto

**En etapa inicial de configuración.**

Actualmente se está definiendo la estructura del repositorio, la organización del equipo y las configuraciones necesarias para comenzar con el desarrollo de los microservicios.

## Organización

**Universidad:** Universidad Tecnológica Nacional — Facultad Regional Córdoba

**Carrera:** Ingeniería en Sistemas de Información

**Materia:** Backend de Aplicaciones

**Proyecto:** Trabajo Práctico Integrador
