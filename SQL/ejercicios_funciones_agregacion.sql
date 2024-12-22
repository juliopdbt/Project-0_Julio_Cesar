
/* MIN y MAX */

-- Ejercicio 1: Encontrar la duración mínima de las pistas en milisegundos.
SELECT MIN("Milliseconds") AS"Duración_Minima"
FROM "Track"

-- Ejercicio 2: Encontrar la duración máxima de las pistas en milisegundos.
SELECT MAX("Milliseconds") AS"Duración_Maxima"
FROM "Track"

-- Ejercicio 3: Encontrar el precio mínimo de las pistas.
SELECT MIN("UnitPrice") As"Precio_Bajo"
FROM "Track" 

-- Ejercicio 4: Encontrar el precio máximo de las pistas.
SELECT MAX("UnitPrice") AS"Precio_Alto"
FROM "Track"

-- Ejercicio 5: Encontrar la fecha mínima de la factura.
SELECT MIN("InvoiceDate") AS"Factura_Reciente"
FROM "Invoice"   

-- Ejercicio 6: Encontrar la fecha máxima de la factura.
SELECT MAX("InvoiceDate") as "Factura_Antigüa"
FROM "Invoice"
   

/* COUNT y SUM */

-- Ejercicio 7: Contar el número total de pistas.
select COUNT(*)  AS"Numero_Total_Pistas"
FROM"Track"
-- Ejercicio 8: Contar el número de clientes en Brasil.

select COUNT (*)
from "Customer" c
where "Country" = 'Brazil';

-- Ejercicio 9: Sumar la duración total de todas las pistas en milisegundos.
   
select SUM("Milliseconds") as Suma_Total_Pistas
from "Track" t ;

-- Ejercicio 10: Contar el número de empleados con el título 'Sales Support Agent'.
    
select COUNT("EmployeeId")
from "Employee"
where "Title" = 'Sales Support Agent';

-- Ejercicio 11: Sumar el total de las cantidades en las facturas.

select SUM("Total") as Total_Cantidades
from "Invoice" i 


/* AVG, STDDEV, VARIANCE */

-- Ejercicio 12: Calcular la duración media de las pistas en milisegundos.
    select avg("Milliseconds")
    from "Track" t 

    select ROUND(avg("Milliseconds"),2)
    from "Track" t 
-- Ejercicio 13: Calcular el precio medio de las pistas.
    
    select avg("UnitPrice")
    from "Track" t 
    
-- Ejercicio 14: Calcular la desviación estándar de la duración de las pistas.
     select stddev ("Milliseconds")
    from "Track" t 

-- Ejercicio 15: Calcular la varianza de la duración de las pistas.

     select ROUND(variance ("Milliseconds"),2)
    from "Track" t 

-- Ejercicio 16: Calcular la desviación estándar del precio de las pistas.
  select stddev("UnitPrice") 
    from "Track" t 

/* CONCAT */

-- Ejercicio 17: Concatenar el nombre y el apellido de los clientes.

SELECT CONCAT("FirstName" , ' ', "LastName") AS Nombre_Cliente
FROM "Customer" c ;
