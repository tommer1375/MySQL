SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC;
SELECT apellido1, apellido2, nombre, telefono FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT apellido1, apellido2, nombre, fecha_nacimiento FROM persona WHERE tipo = 'alumno' AND DATE_FORMAT(fecha_nacimiento, '%Y') = '1999';
SELECT apellido1, apellido2, nombre, nif, telefono FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';
SELECT nombre FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT per.apellido1, per.apellido2, per.nombre, d.nombre AS nombre_departamento FROM persona per JOIN profesor prof ON per.id = prof.id_profesor JOIN departamento d ON prof.id_departamento = d.id WHERE per.tipo = 'profesor';
SELECT asig.nombre AS nombre_asignatura, c.anyo_inicio, c.anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura alum ON alum.id_alumno = p.id JOIN asignatura asig ON alum.id_asignatura = asig.id JOIN curso_escolar c ON c.id = alum.id_curso_escolar WHERE nif = '26902806M';
SELECT DISTINCT d.nombre FROM asignatura a JOIN grado g ON g.id = a.id_grado JOIN profesor p ON p.id_profesor = a.id_profesor JOIN departamento d on d.id = p.id_departamento WHERE a.id_profesor IS NOT NULL AND g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT DISTINCT p.apellido1, p.apellido2, p.nombre FROM persona p JOIN alumno_se_matricula_asignatura a ON p.id = a.id_alumno JOIN curso_escolar c ON c.id = a.id_curso_escolar WHERE p.tipo = 'alumno' AND c.anyo_inicio = 2018 ;

-- LEFT JOIN i RIGHT JOIN--
SELECT d.nombre AS nombre_dpto, per.apellido1, per.apellido2, per.nombre FROM persona per LEFT JOIN profesor prof ON per.id = prof.id_profesor LEFT JOIN departamento d ON prof.id_departamento = d.id WHERE per.tipo = 'Profesor' ORDER BY d.nombre, per.apellido1, per.apellido2, per.nombre;
SELECT d.nombre AS nombre_dpto, per.apellido1, per.apellido2, per.nombre FROM persona per LEFT JOIN profesor prof ON per.id = prof.id_profesor LEFT JOIN departamento d ON prof.id_departamento = d.id WHERE per.tipo = 'Profesor' AND d.nombre IS NULL ORDER BY d.nombre, per.apellido1, per.apellido2, per.nombre;
SELECT d.nombre FROM profesor p RIGHT JOIN departamento d ON d.id = p.id_departamento WHERE id_profesor IS NULL;
SELECT per.apellido1, per.apellido2, per.nombre, per.tipo, a.nombre AS nombre_asignatura FROM persona per LEFT JOIN asignatura a ON per.id = a.id_profesor WHERE per.tipo = 'Profesor' AND a.nombre IS NULL;
SELECT a.nombre AS nombre_asignatura FROM profesor prof RIGHT JOIN asignatura a ON prof.id_profesor = a.id_profesor WHERE prof.id_profesor IS NULL;
SELECT DISTINCT d.nombre FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;

-- Consultes resum --
SELECT COUNT(id) FROM persona WHERE tipo = 'Alumno';
SELECT COUNT(id) FROM persona WHERE tipo = 'Alumno' AND DATE_FORMAT(fecha_nacimiento, '%Y') = '1999';
SELECT d.nombre AS "Nombre del Departamento", COUNT(p.id_profesor) AS Número_de_Profesores FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento GROUP BY d.id HAVING COUNT(p.id_profesor) > 0 ORDER BY Número_de_Profesores DESC;
SELECT d.nombre AS "Nombre del Departamento", COUNT(p.id_profesor) AS Número_de_Profesores FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento GROUP BY d.id ORDER BY Número_de_Profesores DESC;
SELECT g.nombre, COUNT(a.id) AS numero_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY numero_asignaturas DESC;
SELECT g.nombre, COUNT(a.id) AS numero_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING COUNT(a.id) > 40 ORDER BY numero_asignaturas DESC;
SELECT g.nombre, a.tipo AS tipo_asignatura, SUM(a.creditos) AS suma_creditos FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo ORDER BY g.nombre, a.tipo;
SELECT c.anyo_inicio AS año_inicio_curso, COUNT(p.id) AS num_alumnos FROM persona p JOIN alumno_se_matricula_asignatura a ON p.id = a.id_alumno JOIN curso_escolar c ON c.id = a.id_curso_escolar WHERE p.tipo = 'Alumno' GROUP BY c.anyo_inicio ORDER BY c.anyo_inicio;
SELECT p.id AS id_profesor, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS num_asignaturas FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' GROUP BY p.id ORDER BY num_asignaturas DESC;
SELECT * FROM persona WHERE tipo = 'Alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
SELECT per.apellido1, per.apellido2, per.nombre, d.nombre AS nombre_dpto FROM persona per LEFT JOIN profesor prof ON per.id = prof.id_profesor LEFT JOIN asignatura a ON per.id = a.id_profesor LEFT JOIN departamento d ON prof.id_departamento = d.id WHERE per.tipo = 'Profesor' AND a.nombre IS NULL ORDER BY d.nombre;

