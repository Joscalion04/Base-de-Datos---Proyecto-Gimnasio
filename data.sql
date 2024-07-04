-- Insercion de Datos en la Base de Datos

 --Tabla cliente 
insert into cliente (cedula, nombre, apellido_1, apellido_2, direccion, fecha_inscripcion, celular, tel_habitacion) values (200,'maria','ruiz','ruiz','barva','01011995',11111111,22222222);
insert into cliente (cedula, nombre, apellido_1, apellido_2, direccion, e_mail, fecha_inscripcion, celular, tel_habitacion) values (201,'juan','paz','arias','alajuela','juan@hotmail.com','01011995',22222222,11111111);
insert into cliente (cedula, nombre, apellido_1, apellido_2, fecha_inscripcion, celular, tel_habitacion) values (202,'pedro','perez','perez','20041998',33333333,33333335);
insert into cliente (cedula, nombre, apellido_1, apellido_2, direccion, e_mail, fecha_inscripcion, celular, tel_habitacion) values (203,'jose','castro','ruiz','santo domingo','jruiz@gmail.com','20061998',44444444,55555555);
insert into cliente (cedula, nombre, apellido_1, apellido_2, direccion, e_mail, fecha_inscripcion, celular, tel_habitacion) values (204,'martha','diaz','ruiz','pavas','mdiaz@yahoo.es','02012000',22222229,33333333);
insert into cliente (cedula, nombre, apellido_1, apellido_2, e_mail, fecha_inscripcion, celular, tel_habitacion) values (205,'xiomara','diaz','diaz','xdiaz@hotmail.com','03022000',55555555,11111119);
insert into cliente (cedula, nombre, apellido_1, apellido_2, direccion, fecha_inscripcion, celular, tel_habitacion) values (206,'pablo','arias','arias','san jose','20042001',55555556,11111112);
insert into cliente (cedula, nombre, apellido_1, apellido_2, direccion, e_mail, fecha_inscripcion, celular, tel_habitacion) values (207,'ana','arias','arias','san pedro','arias@gmail.com','25042001',55555556,11111115);
insert into cliente (cedula, nombre, apellido_1, apellido_2, direccion, fecha_inscripcion, celular, tel_habitacion) values (208,'carmen','paz','arias','san jose','20042002',55555556,11111115);
insert into cliente (cedula, nombre, apellido_1, apellido_2, fecha_inscripcion, celular, tel_habitacion) values (209,'miguel','orias','arias','20082002',55555557,11111114);

insert into cliente (cedula, nombre, apellido_1, apellido_2, direccion, fecha_inscripcion, celular, tel_habitacion) values (210,'julia','arias','cruz','san rafael','20042003',55555559,11111119);
insert into cliente (cedula, nombre, apellido_1, apellido_2, fecha_inscripcion, celular, tel_habitacion) values (211,'paula','castillo','reyes','15052003',66666666,77777777);
insert into cliente (cedula, nombre, apellido_1, apellido_2, direccion, e_mail, fecha_inscripcion, celular, tel_habitacion) values (212,'david','arias','arias','san jose','darias@gmail.com','20102005',88888888,99999999);
insert into cliente (cedula, nombre, apellido_1, apellido_2, direccion, e_mail, fecha_inscripcion, celular, tel_habitacion) values (213,'andres','aguilar','rios','guadalupe','aaguilar@yahoo.com','10122007',99999999,88888888);
insert into cliente (cedula, nombre, apellido_1, apellido_2, direccion, e_mail, fecha_inscripcion, celular, tel_habitacion) values (214,'maria jose','villalta','paz','heredia','mjvillalta@gmail.com','20042011',77777777,66666666);
insert into cliente (cedula, nombre, apellido_1, apellido_2, direccion, fecha_inscripcion, celular, tel_habitacion) values (215,'pablo jose','castillo','arias','san jose','20042011',33333333,66666666);

--tabla instructores
insert into instructores (cod_instructor,nombre,apellido_1,apellido_2,direccion,tel_cel,tel_habitacion,fecha_contratacion)values(100, 'matio','jhoson','ruiz','san jose',11111111,22222222,'01011995');
insert into instructores (cod_instructor,nombre,apellido_1,apellido_2,direccion,e_mail,tel_cel,tel_habitacion,fecha_contratacion)values(101, 'juliana','blackz','arias','alajuela','jul@hotmail.com',22222222,11111111,'01011995');
insert into instructores (cod_instructor,nombre,apellido_1,apellido_2,tel_cel,tel_habitacion,fecha_contratacion)values(102, 'maria','perez','perez',33333333,33333335,'20041998');
insert into instructores (cod_instructor,nombre,apellido_1,apellido_2,direccion,e_mail,tel_cel,tel_habitacion,fecha_contratacion)values(103, 'cristian','castro','ruiz','alajuela','cruiz@gmail.com',44444444,55555555,'20-06-1998');
insert into instructores (cod_instructor,nombre,apellido_1,apellido_2,direccion,e_mail,tel_cel,tel_habitacion,fecha_contratacion)values(104, 'margarita','mata','ruiz','pavas','mmata@yahoo.es',11111112,22222228,'20012000');
insert into instructores (cod_instructor,nombre,apellido_1,apellido_2,e_mail,tel_cel,tel_habitacion,fecha_contratacion)values(105, 'shirley','ruiz','diaz','sruiz@hotmail.com',22222229,33333333,'03022000');
insert into instructores (cod_instructor,nombre,apellido_1,apellido_2,tel_cel,tel_habitacion,fecha_contratacion)values(106, 'cameron','rojas','rojas',88888889,77777777,'20072010');
insert into instructores (cod_instructor,nombre,apellido_1,apellido_2,e_mail,tel_cel,tel_habitacion,fecha_contratacion)values(107, 'patrick','ruiz','diaz','pactrick@hotmail.com',10101010,98989898,'15122011');
insert into instructores (cod_instructor,nombre,apellido_1,apellido_2,tel_cel,tel_habitacion,fecha_contratacion)values(110, 'sharlotte','castillo','paz',99999999,22222233,'03052010');

--tabla cursos
insert into cursos values (1,'yoga');
insert into cursos values (2,'defensa personal');
insert into cursos values (3,'kinboxing');
insert into cursos values (4,'spinnig');
insert into cursos values (5,'taebo');
insert into cursos values (6,'zumba');

--tabla maquinas
insert into maquinas values (50,'pesas','bueno');
insert into maquinas values (51,'mancuernas','excelente');
insert into maquinas values (52,'caminadora','regular');
insert into maquinas values (53,'bicicleta estacionaria','excelente');
insert into maquinas values (54,'bicicleta spinning','bueno');
insert into maquinas values (55,'press de banca','regular');
insert into maquinas values (56,'press de pecho','bueno');

--tabla historial_curso
insert into historial_curso values(1,200,110,6,'20022000',2);
insert into historial_curso values(2,200,101,1,'20022000',2);
insert into historial_curso values(3,205,105,2,'20022000',3);
insert into historial_curso values(4,206,102,3,'03052000',2);
insert into historial_curso values(5,201,101,4,'20072000',4);
insert into historial_curso values(6,208,110,3,'18082000',3);
insert into historial_curso values(7,208,110,1,'18082000',2);
insert into historial_curso values(8,201,110,6,'18082000',1);
insert into historial_curso values(9,210,102,1,'15042007',1);
insert into historial_curso values(10,210,101,4,'15042007',2);
insert into historial_curso values(11,210,105,3,'15042007',1);
insert into historial_curso values(12,212,105,1,'10052008',2);
insert into historial_curso values(13,213,105,2,'10052008',2);
insert into historial_curso values(14,210,105,3,'10052008',2);
insert into historial_curso values(15,201,105,4,'10052008',2);
insert into historial_curso values(16,202,105,5,'10052008',2);

--tabla rutinas
insert into rutinas values(1,209,110,50,'20022000',2);
insert into rutinas values(3,209,101,50,'20022000',2);
insert into rutinas values(5,205,105,55,'20022000',3);
insert into rutinas values(7,215,102,53,'03052000',2);
insert into rutinas values(9,215,101,55,'20072000',4);
insert into rutinas values(11,208,110,56,'18082000',3);
insert into rutinas values(13,208,110,52,'18082000',2);
insert into rutinas values(15,201,110,53,'18082000',1);
insert into rutinas values(17,210,102,55,'15042007',1);
insert into rutinas values(19,210,101,50,'15042007',2);
insert into rutinas values(21,210,107,50,'15042007',1);
insert into rutinas values(23,212,107,51,'10052008',2);
insert into rutinas values(25,213,107,52,'10052008',2);
insert into rutinas values(27,210,107,53,'10052008',2);
insert into rutinas values(29,201,107,54,'10052008',2);
insert into rutinas values(31,202,105,55,'10052008',2);