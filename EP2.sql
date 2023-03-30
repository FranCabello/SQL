#1

SELECT nomem, numen, extel
FROM empleados
WHERE numde = 121
ORDER BY nomem;

#2 

SELECT salar,nomem
FROM empleados
WHERE numhi = 0 AND salar BETWEEN 1200 AND 1500
ORDER BY salar DESC, nomem;

#3

SELECT nomem, salar, (60*numhi + salar) AS salartotal
FROM empleados
WHERE numhi >= 1
ORDER BY nomem;

#4

SELECT COUNT(*)
FROM empleados
WHERE numhi > 2;

#5

SELECT nomem, comis
FROM empleados
WHERE nomem = "Antonio";
# WHERE nomem LIKE "%Antonio%" para nombre compuesto

#6

SELECT nomem
FROM empleados
WHERE extel IN(250, 750)
ORDER BY nomem;

#7

SELECT nomem, salar
FROM empleados
WHERE (numhi = 0 AND salar > 1500) OR (numhi > 0 AND salar < 1000)
ORDER BY nomem;

#8
SELECT AVG(salar), MIN(salar), MAX(salar)
FROM empleados;

#9

SELECT *, COUNT(numem) 
FROM empleados, departamentos
WHERE departamentos.numde = empleados.numde;

#10

SELECT COUNT(numem)
FROM empleados
WHERe

