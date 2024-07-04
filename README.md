# Base de Datos Proyecto Gimnasio
Este repositorio contiene el script SQL para la creación y gestión de una base de datos diseñada específicamente para un gimnasio. La base de datos almacena información sobre clientes, instructores, cursos, máquinas y las actividades diarias realizadas en el gimnasio. Este repositorio fue creado con objetivo de indole educativo.

## Notas de Interes del Repositorio
- Este repositorio de SQL fue realizado en Oracle DataBase Express Edition 23, por ende los scripts SQL estan realizados para funcionar con tal configuracion.


## Contenido del Repositorio

- **Estructura de Tablas**:
  - **Cliente**: Datos personales de los clientes.
  - **Instructores**: Información de los instructores.
  - **Cursos**: Registro de cursos ofrecidos.
  - **Maquinas**: Detalles de las máquinas disponibles.
  - **Rutinas**: Rutinas asignadas a los clientes.
  - **Historial_curso**: Historial de los cursos tomados por los clientes.

- **Relaciones entre Tablas**:
  - Claves foráneas que conectan clientes, instructores, máquinas y cursos para mantener la integridad de los datos.

- **Scripts de Modificación**:
  - Adición de columnas.
  - Definición de valores predeterminados para ciertos campos.

- **Datos de Ejemplo**:
  - Inserción de datos ficticios en todas las tablas para ilustrar el funcionamiento del sistema.

## Funcionalidades Clave

- **Estructura Flexible**: La base de datos está diseñada para ser fácilmente modificable y extensible.
- **Integridad de Datos**: Las relaciones entre tablas aseguran la coherencia y exactitud de los datos.
- **Datos Predeterminados**: Campos con valores predeterminados para asegurar la consistencia de la información.
- **Inserción de Datos de Ejemplo**: Ejemplos prácticos que ilustran cómo se puede utilizar la base de datos en un entorno real.

## Cómo Utilizar

1. **Crear la Base de Datos**:
   - Ejecutar el script SQL para crear las tablas y definir las relaciones entre ellas.

2. **Modificar la Estructura**:
   - Utilizar los scripts de modificación para ajustar la estructura de las tablas según sea necesario.

3. **Insertar Datos**:
   - Ejecutar los scripts de inserción para poblar las tablas con datos de ejemplo.
     
4. **Compilacion de Triggers para Validacion**:
   - Compilar los scripts de los disparadores(triggers) de validacion de las tablas
     
6. **Compilacion de Procedimientos Almacenados**:
    - Compilar los scripts de los procedimientos almacenados para los procesos detallados.

## Indole Educativa

Este proyecto está bajo el indole educativo de la Universidad Nacional como proyecto universiario.

---

