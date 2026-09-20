# Resolución de Consultas SQL - Base de Datos Chinook

Este repositorio contiene la resolución de 10 apartados de consultas SQL sobre la base de datos musical Chinook, montada en un servidor local mediante contenedores.

## Requisitos
* **Docker Desktop**: Para ejecutar el contenedor de la base de datos.
* **Visual Studio Code**: Como editor de código principal.
* **Extensión SQLTools** (y su driver para PostgreSQL): Para la conexión y ejecución de consultas desde VS Code.

## Detalles de la Base de Datos
* **Versión/Variante:** Se utilizó el script `Chinook_PostgreSql_SerialPKs.sql`. Esta variante está adaptada específicamente para PostgreSQL utilizando claves primarias autoincrementables (SERIAL).
* **Origen del script:** Material provisto para la práctica de laboratorio.

## Instrucciones de Configuración y Conexión

### 1. Levantar el servidor
Asegúrese de tener Docker en ejecución. En la raíz de este proyecto, abra una terminal y ejecute el siguiente comando para levantar el contenedor en segundo plano:
```bash
docker compose up -d