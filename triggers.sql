-- 1.	Cada vez que se inserte un registro en cada una de las tablas se debe validar lo siguiente: 
-- a.	No se deben insertar duplicados, si el registro que se va a insertar ya existe debe indicar por medio de un mensaje al usuario que ya existe.
-- b.	Si el registro es insertado con �xito debe indicar al usuario por medio de un mensaje que la informaci�n se ha insertado correctamente.
-- c.	En el caso de las tablas que poseen llaves for�neas, adem�s de los puntos a y b se debe validar que la informaci�n a insertar realmente exista 
--        en las tablas padres correspondientes, en caso contrario indicar al usuario por medio de un mensaje.

-- Los mensajes de salida por consola requiere activar la salida de consola con: SET SERVEROUTPUT ON
-- Trigger para Tabla Cliente:

CREATE OR REPLACE TRIGGER validar_cliente_trigger
BEFORE INSERT ON cliente
FOR EACH ROW
DECLARE
    v_count INTEGER;
BEGIN
    -- Verificar si el cliente ya existe
    SELECT COUNT(*)
    INTO v_count
    FROM cliente
    WHERE cedula = :NEW.cedula;
    
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El cliente con la c�dula ' || :NEW.cedula || ' ya existe.');
    END IF;
    
    -- Mensaje de inserci�n exitosa
    DBMS_OUTPUT.PUT_LINE('Cliente insertado correctamente: ' || :NEW.cedula);
END;
/


-- Trigger para Tabla Instructores:
CREATE OR REPLACE TRIGGER validar_instructores_trigger
BEFORE INSERT ON instructores
FOR EACH ROW
DECLARE
    v_count INTEGER;
BEGIN
    -- Verificar si el instructor ya existe
    SELECT COUNT(*)
    INTO v_count
    FROM instructores
    WHERE cod_instructor = :NEW.cod_instructor;
    
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El instructor con el c�digo ' || :NEW.cod_instructor || ' ya existe.');
    END IF;
    
    -- Mensaje de inserci�n exitosa
    DBMS_OUTPUT.PUT_LINE('Instructor insertado correctamente: ' || :NEW.cod_instructor);
END;
/

-- Trigger para Tabla Cursos:
CREATE OR REPLACE TRIGGER validar_cursos_trigger
BEFORE INSERT ON cursos
FOR EACH ROW
DECLARE
    v_count INTEGER;
BEGIN
    -- Verificar si el curso ya existe
    SELECT COUNT(*)
    INTO v_count
    FROM cursos
    WHERE id_curso = :NEW.id_curso;
    
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El curso con el ID ' || :NEW.id_curso || ' ya existe.');
    END IF;
    
    -- Mensaje de inserci�n exitosa
    DBMS_OUTPUT.PUT_LINE('Curso insertado correctamente: ' || :NEW.id_curso);
END;
/

-- Trigger para Tabla Maquinas:
CREATE OR REPLACE TRIGGER validar_maquinas_trigger
BEFORE INSERT ON maquinas
FOR EACH ROW
DECLARE
    v_count INTEGER;
BEGIN
    -- Verificar si la m�quina ya existe
    SELECT COUNT(*)
    INTO v_count
    FROM maquinas
    WHERE id_maquina = :NEW.id_maquina;
    
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'La m�quina con el ID ' || :NEW.id_maquina || ' ya existe.');
    END IF;
    
    -- Mensaje de inserci�n exitosa
    DBMS_OUTPUT.PUT_LINE('M�quina insertada correctamente: ' || :NEW.id_maquina);
END;
/

-- Trigger para Tabla Rutinas:
CREATE OR REPLACE TRIGGER validar_rutinas_trigger
BEFORE INSERT ON rutinas
FOR EACH ROW
DECLARE
    v_count INTEGER;
    v_fk_cliente INTEGER;
    v_fk_instructor INTEGER;
    v_fk_maquina INTEGER;
BEGIN
    -- Verificar si la rutina ya existe
    SELECT COUNT(*)
    INTO v_count
    FROM rutinas
    WHERE id_rutina = :NEW.id_rutina;
    
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'La rutina con el ID ' || :NEW.id_rutina || ' ya existe.');
    END IF;

    -- Verificar la existencia de la clave for�nea cliente
    SELECT COUNT(*)
    INTO v_fk_cliente
    FROM cliente
    WHERE cedula = :NEW.cliente;
    
    IF v_fk_cliente = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'El cliente con la c�dula ' || :NEW.cliente || ' no existe.');
    END IF;
    
    -- Verificar la existencia de la clave for�nea instructor
    SELECT COUNT(*)
    INTO v_fk_instructor
    FROM instructores
    WHERE cod_instructor = :NEW.instructor;
    
    IF v_fk_instructor = 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'El instructor con el c�digo ' || :NEW.instructor || ' no existe.');
    END IF;
    
    -- Verificar la existencia de la clave for�nea m�quina
    SELECT COUNT(*)
    INTO v_fk_maquina
    FROM maquinas
    WHERE id_maquina = :NEW.maquina;
    
    IF v_fk_maquina = 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'La m�quina con el ID ' || :NEW.maquina || ' no existe.');
    END IF;
    
    -- Mensaje de inserci�n exitosa
    DBMS_OUTPUT.PUT_LINE('Rutina insertada correctamente: ' || :NEW.id_rutina);
END;
/

-- Trigger para tabla Historial_curso:
CREATE OR REPLACE TRIGGER validar_historialcursos_trigger
BEFORE INSERT ON historial_curso
FOR EACH ROW
DECLARE
    v_count INTEGER;
    v_fk_cliente INTEGER;
    v_fk_instructor INTEGER;
    v_fk_curso INTEGER;
BEGIN
    -- Verificar si el historial ya existe
    SELECT COUNT(*)
    INTO v_count
    FROM historial_curso
    WHERE id_historial = :NEW.id_historial;
    
    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El historial con el ID ' || :NEW.id_historial || ' ya existe.');
    END IF;

    -- Verificar la existencia de la clave for�nea cliente
    SELECT COUNT(*)
    INTO v_fk_cliente
    FROM cliente
    WHERE cedula = :NEW.cliente;
    
    IF v_fk_cliente = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'El cliente con la c�dula ' || :NEW.cliente || ' no existe.');
    END IF;
    
    -- Verificar la existencia de la clave for�nea instructor
    SELECT COUNT(*)
    INTO v_fk_instructor
    FROM instructores
    WHERE cod_instructor = :NEW.instructor;
    
    IF v_fk_instructor = 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'El instructor con el c�digo ' || :NEW.instructor || ' no existe.');
    END IF;
    
    -- Verificar la existencia de la clave for�nea curso
    SELECT COUNT(*)
    INTO v_fk_curso
    FROM cursos
    WHERE id_curso = :NEW.curso;
    
    IF v_fk_curso = 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'El curso con el ID ' || :NEW.curso || ' no existe.');
    END IF;
    
    -- Mensaje de inserci�n exitosa
    DBMS_OUTPUT.PUT_LINE('Historial del curso insertado correctamente: ' || :NEW.id_historial);
END;
/


--2.	Cada vez que se actualice un campo de cada una de las tablas debe de validar lo siguiente: 
--a.	No se debe actualizar el campo de llave primaria o for�nea (en el caso de las tablas hijas).
--b.	Si la informaci�n que desea actualizar no existe, debe mostrar un mensaje al usuario que la informaci�n no se encuentra.
--c.	En caso de que la informaci�n sea actualizada correctamente, debe mostrar un mensaje al usuario indicando que la actualizaci�n se realiz� correctamente y la cantidad de registros actualizados.

--Procedure update cliente
CREATE OR REPLACE PROCEDURE update_cliente (
    p_cedula IN cliente.cedula%TYPE,
    p_nombre IN cliente.nombre%TYPE,
    p_apellido_1 IN cliente.apellido_1%TYPE,
    p_apellido_2 IN cliente.apellido_2%TYPE,
    p_direccion IN cliente.direccion%TYPE,
    p_e_mail IN cliente.e_mail%TYPE,
    p_fecha_inscripcion IN cliente.fecha_inscripcion%TYPE,
    p_celular IN cliente.celular%TYPE,
    p_tel_habitacion IN cliente.tel_habitacion%TYPE
) AS
    v_count INTEGER;
    rows_updated INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM cliente WHERE cedula = p_cedula;
    
    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No existe ningun cliente con la cedula ' || p_cedula);
        RETURN; 
    END IF;

    UPDATE cliente
    SET
        nombre = p_nombre,
        apellido_1 = p_apellido_1,
        apellido_2 = p_apellido_2,
        direccion = p_direccion,
        e_mail = p_e_mail,
        fecha_inscripcion = p_fecha_inscripcion,
        celular = p_celular,
        tel_habitacion = p_tel_habitacion
    WHERE cedula = p_cedula;

    rows_updated := SQL%ROWCOUNT;

    IF rows_updated = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se modifico ningun registro para el cliente con la cedula ' || p_cedula);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Se modificaron ' || rows_updated || ' fila(s) del cliente con la cedula ' || p_cedula);
    END IF;
END update_cliente;
/


--Procedure update instructor
CREATE OR REPLACE PROCEDURE update_instructor (
    p_cod_instructor IN instructores.cod_instructor%TYPE,
    p_nombre IN instructores.nombre%TYPE,
    p_apellido_1 IN instructores.apellido_1%TYPE,
    p_apellido_2 IN instructores.apellido_2%TYPE,
    p_direccion IN instructores.direccion%TYPE,
    p_e_mail IN instructores.e_mail%TYPE,
    p_tel_cel IN instructores.tel_cel%TYPE,
    p_tel_habitacion IN instructores.tel_habitacion%TYPE,
    p_fecha_contratacion IN instructores.fecha_contratacion%TYPE
) AS
    v_count INTEGER;
    rows_updated INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM instructores WHERE cod_instructor = p_cod_instructor;
    
    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No existe ningun instructor con el codigo ' || p_cod_instructor);
        RETURN;  
    END IF;

    UPDATE instructores
    SET
        nombre = p_nombre,
        apellido_1 = p_apellido_1,
        apellido_2 = p_apellido_2,
        direccion = p_direccion,
        e_mail = p_e_mail,
        tel_cel = p_tel_cel,
        tel_habitacion = p_tel_habitacion,
        fecha_contratacion = p_fecha_contratacion
    WHERE cod_instructor = p_cod_instructor;

    rows_updated := SQL%ROWCOUNT;

    IF rows_updated = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se modifico ningun registro para el instructor con el codigo ' || p_cod_instructor);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Se modificaron ' || rows_updated || ' fila(s) del instructor con el codigo ' || p_cod_instructor);
    END IF;
END update_instructor;
/


--Procedure update curso
CREATE OR REPLACE PROCEDURE update_curso (
    p_id_curso IN cursos.id_curso%TYPE,
    p_descripcion IN cursos.descripcion%TYPE
) AS
    v_count INTEGER;
    rows_updated INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM cursos WHERE id_curso = p_id_curso;
    
    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No existe ningun curso con ID ' || p_id_curso);
        RETURN; 
    END IF;

    UPDATE cursos
    SET descripcion = p_descripcion
    WHERE id_curso = p_id_curso;

    rows_updated := SQL%ROWCOUNT;

    IF rows_updated = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se modifico ningun registro');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Se modificaron ' ||rows_updated || ' fila(s) del curso con ID ' || p_id_curso);
    END IF;
END update_curso;
/


--Procedure update maquina
CREATE OR REPLACE PROCEDURE update_maquina (
    p_id_maquina IN maquinas.id_maquina%TYPE,
    p_descripcion IN maquinas.descripcion%TYPE,
    p_estado IN maquinas.estado%TYPE
) AS
    v_count INTEGER;
    rows_updated INTEGER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM maquinas WHERE id_maquina = p_id_maquina;
    
    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No existe ninguna maquina con ID ' || p_id_maquina);
        RETURN; 
    END IF;

    UPDATE maquinas
    SET descripcion = p_descripcion,
        estado = p_estado
    WHERE id_maquina = p_id_maquina;

    rows_updated := SQL%ROWCOUNT;

    IF rows_updated = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se modifico ningun registro');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Se modificaron ' ||rows_updated || ' fila(s) de la maquina con ID ' || p_id_maquina);
    END IF;
END update_maquina;
/

-- procedure update rutinas (verifica el PK y los FK)
CREATE OR REPLACE PROCEDURE update_rutinas_procedure (
    old_id_rutina IN NUMBER,
    new_id_rutina IN NUMBER,
    old_cliente IN NUMBER,
    new_cliente IN NUMBER,
    old_instructor IN NUMBER,
    new_instructor IN NUMBER
) AS
BEGIN
    IF new_id_rutina <> old_id_rutina THEN
        raise_application_error(-20001, 'No se permite actualizar la llave primaria (id_rutina) en la tabla rutinas.');
    END IF;

    IF new_cliente <> old_cliente THEN
        raise_application_error(-20002, 'No se permite actualizar la llave for�nea (cliente) en la tabla rutinas.');
    END IF;

    IF new_instructor <> old_instructor THEN
        raise_application_error(-20003, 'No se permite actualizar la llave for�nea (instructor) en la tabla rutinas.');
    END IF;
END;
/

-- la idea del trigger es utilizar el procedure previamente creado
SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER update_rutinas_trigger
BEFORE UPDATE ON rutinas
FOR EACH ROW
BEGIN
    update_rutinas_procedure(:old.id_rutina, :new.id_rutina, :old.cliente, :new.cliente, :old.instructor, :new.instructor);
END;
/

--procedure update historial curso (Primary Key y Foreign Key)
CREATE OR REPLACE PROCEDURE update_historial_curso_procedure (
    old_id_historial IN NUMBER,
    new_id_historial IN NUMBER,
    old_cliente IN NUMBER,
    new_cliente IN NUMBER,
    old_instructor IN NUMBER,
    new_instructor IN NUMBER,
    old_curso IN NUMBER,
    new_curso IN NUMBER
) AS
BEGIN
    IF new_id_historial <> old_id_historial THEN
        raise_application_error(-20001, 'No se permite actualizar la llave primaria (id_historial) en la tabla historial_curso.');
    END IF;

    IF new_cliente <> old_cliente THEN
        raise_application_error(-20002, 'No se permite actualizar la llave for�nea (cliente) en la tabla historial_curso.');
    END IF;

    IF new_instructor <> old_instructor THEN
        raise_application_error(-20003, 'No se permite actualizar la llave for�nea (instructor) en la tabla historial_curso.');
    END IF;

    IF new_curso <> old_curso THEN
        raise_application_error(-20004, 'No se permite actualizar la llave for�nea (curso) en la tabla historial_curso.');
    END IF;
END;
/

-- trigger de historial curso, utiliza el procedure previamente creado
SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER update_historial_curso_trigger
BEFORE UPDATE ON historial_curso
FOR EACH ROW
BEGIN
    update_historial_curso_procedure(:old.id_historial, :new.id_historial, :old.cliente, :new.cliente, :old.instructor, :new.instructor, :old.curso, :new.curso);
END;
/

-- trigger update cursos
SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER update_cursos_trigger
BEFORE UPDATE OF id_curso ON cursos
FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    IF UPDATING THEN
        raise_application_error(-20001, 'No se permite actualizar la llave primaria (id_curso) en la tabla cursos.');
    END IF;
END;
/

-- trigger update maquinas
SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER update_maquinas_trigger
BEFORE UPDATE OF id_maquina ON maquinas
FOR EACH ROW
BEGIN
    IF :new.id_maquina <> :old.id_maquina THEN
        raise_application_error(-20001, 'No se permite actualizar la llave primaria (id_maquina) en la tabla maquinas.');
    END IF;
END;
/

