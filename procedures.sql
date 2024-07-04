
/*
   3.	Cada vez que elimine un registro de cada una de las tablas debe validar lo siguiente
   a.	No es permitido eliminar registros que est�n relacionados, por lo que debe indicar al usuario por 
        medio de mensaje, cual es la relaci�n existente por la cual el registro o registros no pueden ser eliminados.
   b.	Si la informaci�n que desee eliminar no se encuentra, debe indicar al usuario por medio de un mensaje
        de que no ha encontrado la informaci�n.
   c.	En caso de que se realice el borrado correctamente, indicar al usuario por medio de un mensaje que el
        registro se elimin� con �xito y la cantidad de registros eliminados.
*/

-- La eliminacion se hace con procedimientos.
-- Procedimientos para eliminar Rutinas:
-- Eliminar por ID:
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE eliminar_rutinas_id(p_id_rutina INT) IS
    v_count INT;
    NOEXISTE EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO v_count
        FROM rutinas
        WHERE id_rutina = p_id_rutina;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No existe ninguna rutina con ID ' || p_id_rutina || ' para eliminar.');
        RAISE NOEXISTE;
    ELSE
        DELETE FROM rutinas WHERE id_rutina = p_id_rutina;
        DBMS_OUTPUT.PUT_LINE('La rutina con ID ' || p_id_rutina || ' ha sido eliminada correctamente.');
    END IF;
EXCEPTION
    WHEN NOEXISTE
    THEN RAISE_APPLICATION_ERROR(-20004, 'No existe ninguna rutina con ID ' || p_id_rutina || ' para eliminar.');
END eliminar_rutinas_id;
/


-- Eliminar por cliente:
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE eliminar_rutinas_cliente(p_cliente INT) IS
    v_count INT;
    NOEXISTE EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO v_count
        FROM rutinas
        WHERE cliente = p_cliente;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No existe ninguna rutina asociada al cliente ' || p_cliente || ' para eliminar.');
        RAISE NOEXISTE;
    ELSE
        DELETE FROM rutinas WHERE cliente = p_cliente;
        DBMS_OUTPUT.PUT_LINE('La rutina asociada al cliente ' || p_cliente || ' ha sido eliminada correctamente. Se eliminaron ' || v_count || ' registros');
    END IF;
EXCEPTION
    WHEN NOEXISTE
    THEN RAISE_APPLICATION_ERROR(-20004, 'No existe ninguna rutina asociada al cliente ' || p_cliente || ' para eliminar.');
END eliminar_rutinas_cliente;
/


-- Eliminar por instructor:
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE eliminar_rutinas_instructor(p_instructor INT) IS
    v_count INT;
    NOEXISTE EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO v_count
        FROM rutinas
        WHERE instructor = p_instructor;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No existe ninguna rutina asociada al instructor ' || p_instructor || ' para eliminar.');
        RAISE NOEXISTE;
    ELSE
        DELETE FROM rutinas WHERE instructor = p_instructor;
        DBMS_OUTPUT.PUT_LINE('La rutina asociada al instructor ' || p_instructor || ' ha sido eliminada correctamente. Se eliminaron ' || v_count || ' registros');
    END IF;
EXCEPTION
    WHEN NOEXISTE
    THEN RAISE_APPLICATION_ERROR(-20004, 'No existe ninguna rutina asociada al instructor ' || p_instructor || ' para eliminar.');
END eliminar_rutinas_instructor;
/


-- Procedimientos para eliminar Historial de cursos:
-- Eliminar por ID:
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE eliminar_historial_id(p_id_historial INT) IS
    v_count INT;
    NOEXISTE EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO v_count
        FROM historial_curso
        WHERE id_historial = p_id_historial;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No existe ningun historial con ID ' || p_id_historial || ' para eliminar.');
        RAISE NOEXISTE;
    ELSE
        DELETE FROM historial_curso WHERE id_historial = p_id_historial;
        DBMS_OUTPUT.PUT_LINE('El historial de curso con ID ' || p_id_historial || ' ha sido eliminado correctamente.');
    END IF;
EXCEPTION
    WHEN NOEXISTE
    THEN RAISE_APPLICATION_ERROR(-20004, 'No existe ningun historial con ID ' || p_id_historial || ' para eliminar.');
END eliminar_historial_id;
/


-- Eliminar por cliente:
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE eliminar_historial_cliente(p_cliente INT) IS
    v_count INT;
    NOEXISTE EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO v_count
        FROM historial_curso
        WHERE cliente = p_cliente;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No existe ningun historial asociado al cliente ' || p_cliente || ' para eliminar.');
        RAISE NOEXISTE;
    ELSE
        DELETE FROM historial_curso WHERE cliente = p_cliente;
        DBMS_OUTPUT.PUT_LINE('El historial de curso asociado al cliente ' || p_cliente || ' ha sido eliminado correctamente. Se eliminaron ' || v_count || ' registros');
    END IF;
EXCEPTION
    WHEN NOEXISTE
    THEN RAISE_APPLICATION_ERROR(-20004, 'No existe ningun historial asociado al cliente ' || p_cliente || ' para eliminar.');
END eliminar_historial_cliente;
/


-- Eliminar por instructor:
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE eliminar_historial_instructor(p_instructor INT) IS
    v_count INT;
    NOEXISTE EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO v_count
        FROM historial_curso
        WHERE instructor = p_instructor;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No existe ningun historial asociado al instructor ' || p_instructor || ' para eliminar.');
        RAISE NOEXISTE;
    ELSE
        DELETE FROM historial_curso WHERE instructor = p_instructor;
        DBMS_OUTPUT.PUT_LINE('El historial de curso asociado al instructor ' || p_instructor || ' ha sido eliminado correctamente. Se eliminaron ' || v_count || ' registros');
    END IF;
EXCEPTION
    WHEN NOEXISTE
    THEN RAISE_APPLICATION_ERROR(-20004, 'No existe ningun historial asociado al instructor ' || p_instructor || ' para eliminar.');
END eliminar_historial_instructor;
/


-- Procedimiento para eliminar Maquinas:
-- Eliminar por ID:
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE eliminar_maquinas(p_id_maquina INT) IS
    v_count INT;
    v_uso_count INT;
    NOEXISTE EXCEPTION;
    ENUSO EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO v_count
        FROM maquinas
        WHERE id_maquina = p_id_maquina;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No existe ninguna maquina con ID ' || p_id_maquina || ' para eliminar.');
        RAISE NOEXISTE;
    END IF;
    
    SELECT COUNT(*) INTO v_uso_count
        FROM rutinas 
        WHERE maquina = p_id_maquina;
        
    IF v_uso_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('No puede eliminar la maquina con ID ' || p_id_maquina || ' porque esta relacionada con otros ' || v_uso_count || ' registros de la tabla Rutinas.');
        RAISE ENUSO;
    END IF;
    
    DELETE FROM maquinas WHERE id_maquina = p_id_maquina;
    DBMS_OUTPUT.PUT_LINE('La maquina con ID ' || p_id_maquina || ' ha sido eliminada correctamente.');
EXCEPTION
    WHEN NOEXISTE THEN 
        RAISE_APPLICATION_ERROR(-20004, 'No existe ninguna maquina con ID ' || p_id_maquina || ' para eliminar.');
    WHEN ENUSO THEN
        RAISE_APPLICATION_ERROR(-20005, 'La maquina con ID ' || p_id_maquina || ' est� actualmente en uso y no puede ser eliminada.');
END eliminar_maquinas;
/


-- Procedimiento para eliminar Cursos:
-- Eliminar por ID:
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE eliminar_cursos(p_id_curso INT) IS
    v_count INT;
    v_uso_count INT;
    NOEXISTE EXCEPTION;
    ENUSO EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO v_count
        FROM cursos
        WHERE id_curso = p_id_curso;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No existe ningun curso con ID ' || p_id_curso || ' para eliminar.');
        RAISE NOEXISTE;
    END IF;
    
    SELECT COUNT(*) INTO v_uso_count
        FROM historial_curso 
        WHERE curso = p_id_curso;
        
    IF v_uso_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('No puede eliminar el curso con ID ' || p_id_curso || ' porque esta relacionada con otros ' || v_uso_count || ' registros de la tabla Historial de cursos.');
        RAISE ENUSO;
    END IF;
    
    DELETE FROM cursos WHERE id_curso = p_id_curso;
    DBMS_OUTPUT.PUT_LINE('El curso con ID ' || p_id_curso || ' ha sido eliminado correctamente.');
EXCEPTION
    WHEN NOEXISTE THEN 
        RAISE_APPLICATION_ERROR(-20004, 'No existe ningun curso con ID ' || p_id_curso || ' para eliminar.');
    WHEN ENUSO THEN
        RAISE_APPLICATION_ERROR(-20005, 'El curso con ID ' || p_id_curso || ' est� actualmente asociado y no puede ser eliminado.');
END eliminar_cursos;
/


-- Procedimiento para eliminar Instructores:
-- Eliminar por ID:
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE eliminar_instructores(p_cod_instructor INT) IS
    v_count INT;
    v_uso_count_historial INT;
    v_uso_count_rutinas INT;
    NOEXISTE EXCEPTION;
    ENUSO EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO v_count
        FROM instructores
        WHERE cod_instructor = p_cod_instructor;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No existe ningun instructor con el codigo ' || p_cod_instructor || ' para eliminar.');
        RAISE NOEXISTE;
    END IF;
    
    SELECT COUNT(*) INTO v_uso_count_historial
        FROM historial_curso 
        WHERE instructor = p_cod_instructor;
    
    SELECT COUNT(*) INTO v_uso_count_rutinas
        FROM rutinas
        WHERE instructor = p_cod_instructor;
        
    IF v_uso_count_historial > 0 AND v_uso_count_rutinas > 0 THEN
        DBMS_OUTPUT.PUT_LINE('No puede eliminar el instructor con el codigo ' || p_cod_instructor || 
                             ' porque est� relacionado con ' || v_uso_count_historial || 
                             ' registros en la tabla Historial de Cursos y ' || v_uso_count_rutinas || 
                             ' registros en la tabla Rutinas.');
        RAISE ENUSO;
    ELSIF v_uso_count_historial > 0 THEN
        DBMS_OUTPUT.PUT_LINE('No puede eliminar el instructor con el codigo ' || p_cod_instructor || ' porque est� relacionado con ' || v_uso_count_historial || ' registros en la tabla Historial de Cursos.');
        RAISE ENUSO;
    ELSIF v_uso_count_rutinas > 0 THEN
        DBMS_OUTPUT.PUT_LINE('No puede eliminar el instructor con el codigo ' || p_cod_instructor || ' porque est� relacionado con ' || v_uso_count_rutinas || ' registros en la tabla Rutinas.');
        RAISE ENUSO;
    END IF;
    
    DELETE FROM instructores WHERE cod_instructor = p_cod_instructor;
    DBMS_OUTPUT.PUT_LINE('El instructor con el codigo ' || p_cod_instructor || ' ha sido eliminado correctamente.');
EXCEPTION
    WHEN NOEXISTE THEN 
        RAISE_APPLICATION_ERROR(-20004, 'No existe ningun instructor con el codigo ' || p_cod_instructor || ' para eliminar.');
    WHEN ENUSO THEN
        RAISE_APPLICATION_ERROR(-20005, 'El instructor con el codigo ' || p_cod_instructor || ' est� actualmente asociado y no puede ser eliminado.');
END eliminar_instructores;
/


-- Procedimiento para eliminar Clientes:
-- Eliminar por ID:
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE eliminar_clientes(p_cedula INT) IS
    v_count INT;
    v_uso_count_historial INT;
    v_uso_count_rutinas INT;
    NOEXISTE EXCEPTION;
    ENUSO EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO v_count
        FROM cliente
        WHERE cedula = p_cedula;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No existe ningun cliente con la cedula ' || p_cedula || ' para eliminar.');
        RAISE NOEXISTE;
    END IF;
    
    SELECT COUNT(*) INTO v_uso_count_historial
        FROM historial_curso 
        WHERE cliente = p_cedula;
    
    SELECT COUNT(*) INTO v_uso_count_rutinas
        FROM rutinas
        WHERE cliente = p_cedula;
        
    IF v_uso_count_historial > 0 AND v_uso_count_rutinas > 0 THEN
        DBMS_OUTPUT.PUT_LINE('No puede eliminar el cliente con la cedula ' || p_cedula || 
                             ' porque est� relacionado con ' || v_uso_count_historial || 
                             ' registros en la tabla Historial de Cursos y ' || v_uso_count_rutinas || 
                             ' registros en la tabla Rutinas.');
        RAISE ENUSO;
    ELSIF v_uso_count_historial > 0 THEN
        DBMS_OUTPUT.PUT_LINE('No puede eliminar el cliente con la cedula ' || p_cedula || ' porque est� relacionado con ' || v_uso_count_historial || ' registros en la tabla Historial de Cursos.');
        RAISE ENUSO;
    ELSIF v_uso_count_rutinas > 0 THEN
        DBMS_OUTPUT.PUT_LINE('No puede eliminar el cliente con la cedula ' || p_cedula || ' porque est� relacionado con ' || v_uso_count_rutinas || ' registros en la tabla Rutinas.');
        RAISE ENUSO;
    END IF;
    
    DELETE FROM cliente WHERE cedula = p_cedula;
    DBMS_OUTPUT.PUT_LINE('El cliente con la cedula ' || p_cedula || ' ha sido eliminado correctamente.');
EXCEPTION
    WHEN NOEXISTE THEN 
        RAISE_APPLICATION_ERROR(-20004, 'No existe ningun cliente con la cedula ' || p_cedula || ' para eliminar.');
    WHEN ENUSO THEN
        RAISE_APPLICATION_ERROR(-20005, 'El cliente con la cedula ' || p_cedula || ' est� actualmente asociado y no puede ser eliminado.');
END eliminar_clientes;
/


-- 4.	Programe las siguientes consultas (procedimientos almacenados): Valor 10 pts
--a.	Permita mostrar por medio de la c�dula de cliente, toda la informaci�n del cliente, el nombre del curso y el id de la rutina, 
--as� como el nombre del o los instructores que lo est�n entrenando.

CREATE OR REPLACE PROCEDURE INFO_CLIENTE_POR_CEDULA(p_cedula IN CLIENTE.CEDULA%TYPE)
IS
    v_count NUMBER;
BEGIN
    -- Verificar si el cliente existe
    SELECT COUNT(*) INTO v_count FROM CLIENTE WHERE CEDULA = p_cedula;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Cliente con c�dula ' || p_cedula || ' no existe.');
    ELSE
        FOR rec IN (
            SELECT 
                c.cedula,
                c.nombre,
                c.apellido_1,
                c.apellido_2,
                c.direccion,
                c.e_mail,
                c.fecha_inscripcion,
                hc.curso AS id_curso,
                cu.descripcion AS nombre_curso,
                r.id_rutina,
                i.cod_instructor,
                i.nombre AS nombre_instructor
            FROM 
                CLIENTE c
                LEFT JOIN HISTORIAL_CURSO hc ON c.cedula = hc.cliente
                LEFT JOIN CURSOS cu ON hc.curso = cu.id_curso
                LEFT JOIN RUTINAS r ON c.cedula = r.cliente
                LEFT JOIN INSTRUCTORES i ON r.instructor = i.cod_instructor
            WHERE 
                c.cedula = p_cedula
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('C�dula: ' || rec.cedula);
            DBMS_OUTPUT.PUT_LINE('Nombre: ' || rec.nombre || ' ' || rec.apellido_1 || ' ' || rec.apellido_2);
            DBMS_OUTPUT.PUT_LINE('Direcci�n: ' || rec.direccion);
            DBMS_OUTPUT.PUT_LINE('Email: ' || rec.e_mail);
            DBMS_OUTPUT.PUT_LINE('Fecha de Inscripci�n: ' || TO_CHAR(rec.fecha_inscripcion, 'DD-MM-YYYY'));
            DBMS_OUTPUT.PUT_LINE('Curso ID: ' || NVL(TO_CHAR(rec.id_curso), 'N/A'));
            DBMS_OUTPUT.PUT_LINE('Nombre del Curso: ' || NVL(rec.nombre_curso, 'N/A'));
            DBMS_OUTPUT.PUT_LINE('Rutina ID: ' || NVL(TO_CHAR(rec.id_rutina), 'N/A'));
            DBMS_OUTPUT.PUT_LINE('Instructor ID: ' || NVL(TO_CHAR(rec.cod_instructor), 'N/A'));
            DBMS_OUTPUT.PUT_LINE('Nombre del Instructor: ' || NVL(rec.nombre_instructor, 'N/A'));
            DBMS_OUTPUT.PUT_LINE('-----------------------------------');
        END LOOP;
    END IF;
END;
/

--b.	Permita mostrar por medio del nombre del instructor, toda la informaci�n del instructor, 
-- el nombre del curso y el id la rutina, que tiene cargo y la cantidad de a�os que tiene de trabajar en 
-- el gimnasio (para este caso debe utilizar una funci�n).

-- Creaci�n de la funci�n para calcular a�os de antig�edad
CREATE OR REPLACE FUNCTION calcular_antiguedad(fecha_contratacion IN DATE) RETURN NUMBER
IS
    v_years NUMBER;
BEGIN
    -- Calcular la diferencia en a�os entre la fecha actual y la fecha de contrataci�n
    SELECT TRUNC(MONTHS_BETWEEN(SYSDATE, fecha_contratacion) / 12)
    INTO v_years
    FROM DUAL;

    RETURN v_years;
END;
/


-- Creaci�n del procedimiento INFO_INSTRUCTOR
CREATE OR REPLACE PROCEDURE INFO_INSTRUCTOR(p_nombre IN INSTRUCTORES.NOMBRE%TYPE)
IS
    v_years_worked NUMBER;
BEGIN
    -- Obtener la cantidad de a�os de antig�edad del instructor
    SELECT calcular_antiguedad(fecha_contratacion)
    INTO v_years_worked
    FROM INSTRUCTORES
    WHERE UPPER(NOMBRE) = UPPER(p_nombre);

    -- Mostrar la informaci�n del instructor y los cursos/rutinas que tiene a cargo
    FOR rec IN (
        SELECT 
            i.cod_instructor,
            i.nombre,
            i.apellido_1,
            i.apellido_2,
            i.direccion,
            i.e_mail,
            i.tel_cel,
            i.tel_habitacion,
            i.fecha_contratacion,
            c.descripcion AS nombre_curso,
            r.id_rutina
        FROM 
            INSTRUCTORES i
            LEFT JOIN RUTINAS r ON i.cod_instructor = r.instructor
            LEFT JOIN HISTORIAL_CURSO hc ON i.cod_instructor = hc.instructor
            LEFT JOIN CURSOS c ON hc.curso = c.id_curso
        WHERE 
            UPPER(i.NOMBRE) = UPPER(p_nombre)
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Nombre del Instructor: ' || rec.nombre || ' ' || rec.apellido_1 || ' ' || rec.apellido_2);
        DBMS_OUTPUT.PUT_LINE('Direcci�n: ' || rec.direccion);
        DBMS_OUTPUT.PUT_LINE('Email: ' || rec.e_mail);
        DBMS_OUTPUT.PUT_LINE('Tel�fono Celular: ' || rec.tel_cel);
        DBMS_OUTPUT.PUT_LINE('Tel�fono Habitaci�n: ' || rec.tel_habitacion);
        DBMS_OUTPUT.PUT_LINE('Fecha de Contrataci�n: ' || TO_CHAR(rec.fecha_contratacion, 'DD-MM-YYYY'));
        DBMS_OUTPUT.PUT_LINE('A�os de Antig�edad: ' || v_years_worked);
        DBMS_OUTPUT.PUT_LINE('Curso que tiene a cargo: ' || NVL(rec.nombre_curso, 'N/A'));
        DBMS_OUTPUT.PUT_LINE('ID de la Rutina que tiene a cargo: ' || NVL(TO_CHAR(rec.id_rutina), 'N/A'));
        DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    END LOOP;

    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontr� informaci�n para el instructor ' || p_nombre);
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontr� informaci�n para el instructor ' || p_nombre);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al procesar la solicitud para el instructor ' || p_nombre);
END;
/
