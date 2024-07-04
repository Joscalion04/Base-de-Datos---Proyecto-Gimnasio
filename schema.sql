--- Base de Datos Gimnasio  ---

create table cliente(
   cedula int not null,
   nombre varchar(30) not null,
   apellido_1 varchar(30) not null,
   apellido_2 varchar(30) not null,
   direccion varchar(50),
   e_mail varchar(30),
   fecha_inscripcion date not null,
   constraint pkcliente primary key (cedula)
);

create table instructores(
    cod_instructor int not null,
    nombre varchar(30) not null,
    apellido_1 varchar(30) not null,
    apellido_2 varchar(30) not null,
    direccion varchar(50),
    e_mail varchar(30),
    tel_cel int not null,
    tel_habitacion int not null,
    fecha_contratacion date not null,
    constraint pkinstructores primary key (cod_instructor)
);

create table cursos(
    id_curso int not null,
    descripcion varchar(50) not null,
    constraint pkcursos primary key (id_curso)
);

create table maquinas(
    id_maquina int not null,
    descripcion varchar(50) not null,
    constraint pkmaquinas primary key (id_maquina)
);

create table rutinas(
    id_rutina int not null,
    cliente int not null,
    instructor int not null,
    maquina int not null,
    fecha date not null,
    horas int not null,
    constraint pkrutinas primary key (id_rutina)
);

create table historial_curso(
    id_historial int not null,
    cliente int not null,
    instructor int not null,
    curso int not null,
    fecha date not null,
    horas int not null,
    constraint pkhistorial_curso primary key (id_historial),
    constraint fk1historial_curso foreign key (cliente) references cliente (cedula),
    constraint fk2historial_curso foreign key (instructor) references instructores (cod_instructor),
    constraint fk3historial_curso foreign key (curso) references cursos (id_curso)
);

--c. Agregar a la tabla cliente los campos: Celular int y Tel_habitacion int, ambos deben ser Not Null.
alter table cliente add celular int not null;

alter table cliente add tel_habitacion int not null;

--d. Agregar a la tabla Maquinas la columna Estado , varchar (15).
alter table maquinas add estado varchar(15);

/*e. Validar en las tablas Cliente e Instructores que si el campo e-mail no tiene datos se debe
almacenar lo siguiente *@*.com y si el campo direcci?n de ambas tablas no tiene datos
se debe almacenar N/A.*/
alter table cliente modify direccion default 'n/a';
alter table instructores modify direccion default 'n/a';

alter table cliente modify e_mail default '*@*.com';

alter table instructores modify e_mail  default '*@*.com';


/*f. Establecer los campos Cedula_Cliente, Cod_Instructor , Cod_Maquina , como llaves
for?neas en la tabla Rutinas.*/
alter table rutinas add constraint fkrutina_cliente foreign key (cliente) references cliente (cedula);
alter table rutinas add constraint fk2rutina_instructor foreign key (instructor) references instructores (cod_instructor);