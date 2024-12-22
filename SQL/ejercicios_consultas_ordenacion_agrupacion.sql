
-- Ejercicio 1:  Selecciona el nombre de todos los álbumes y ordénalos alfabéticamente.
SELECT"Title" as Album_Name
FROM"Album" a
order by "Title" ASC

-- Ejercicio 2:  Encuentra el álbum con el mayor número de canciones.

SELECT "AlbumId",COUNT("TrackId") AS"Canciones_Albums"
FROM "Track" t 
GROUP BY "AlbumId" 
ORDER by "TrackId" 
LIMIT 1;

-- Ejercicio 3:  Calcula la duración promedio, desviación estándar y varianza por compositor.
select "Composer","Milliseconds"
from "Track" t 

select "Composer",
avg("Milliseconds") as Average,
stddev("Milliseconds") as Standard_Deviation,
variance("Milliseconds") AS Variance
from "Track" t 
where "Composer" is not null 
group by "Composer"
order by "Composer"

-- Ejercicio 4: Selecciona el título y el precio de las pistas, y limita los resultados a 10.

   select "Name" , "UnitPrice"
   from "Track" t 
   limit 10

-- Ejercicio 5: Lista los nombres de los empleados y ordénalos por el ID del empleado en orden descendente

select concat("FirstName", ' ', "LastName") as Nombre_Completo
from "Employee" e
order by "EmployeeId" desc

-- Ejercicio 6:  Muestra el número de géneros distintos disponibles en la base de datos.

select "Name", Count("GenreId") as Cantidad_Generos
from "Genre" g 
group by "Name"

-- Ejercicio 7: Selecciona el nombre del cliente y el país, limitando los resultados a 5, y ordena por el nombre del cliente.

select "FirstName" , "Country"
from "Customer" c 
order by "FirstName" asc 
limit 5

-- Ejercicio 8: Muestra la cantidad total de clientes agrupados por país.

select "Country", count("CustomerId") as Total_Clientes
from "Customer" c 
group by "Country" 
order by Total_Clientes desc;

-- Ejercicio 9: Obtén el total de importes de facturas para cada país y muestra solo aquellos con un total superior a 10,000.

select "BillingCountry" , Sum ("Total") as Suma_Total
from "Invoice" i 
group by "BillingCountry" 
having Sum ("Total") >10
order by Suma_Total

-- Ejercicio 10: Encuentra los países donde el número total de clientes es mayor a 5. Muestra el país y el número de clientes.
select "Country", count("CustomerId") as Total_Clientes
from "Customer" c 
group by "Country"
having count("CustomerId") >5
order by Total_Clientes

-- Ejercicio 11: Obtén la cantidad de pistas en cada tipo de medio (MediaType) que tienen una duración mayor a 250,000 milisegundos.
  
	SELECT 
    "MediaTypeId", 
    COUNT("TrackId") AS TrackCount
FROM 
    "Track"
WHERE 
    "Milliseconds" > 250000
GROUP BY 
    "MediaTypeId";


-- Ejercicio 12: Lista el país y el número total de clientes que han sido asistidos por un representante de ventas específico, cuyo ID sea menor a 5.
 	SELECT 
    "Country",
    COUNT("CustomerId") as Total_Customers
FROM 
    "Customer" c 
WHERE 
    "SupportRepId" < 5
GROUP BY 
    "Country";
   
-- Ejercicio 13: Muestra los códigos postales (BillingPostalCode) de los clientes que han hecho más de 5 compras.

  SELECT 
    "BillingPostalCode",
    COUNT("InvoiceId") AS PurchaseCount
FROM 
    "Invoice"
GROUP BY 
    "BillingPostalCode"
HAVING 
    COUNT("InvoiceId") > 5;


-- Ejercicio 14: Encuentra la cantidad total de pistas en cada tipo de medio (MediaTypeId) donde el precio de la pista (UnitPrice) es mayor a 0.99 y la duración de la pista (Milliseconds) es mayor a 200,000. Muestra el tipo de medio y el número total de pistas.
SELECT 
    "MediaTypeId", 
    COUNT("TrackId") AS TrackCount
FROM 
    "Track"
WHERE 
    "UnitPrice" > 0.99 
    AND "Milliseconds" > 200000
GROUP BY 
    "MediaTypeId"
HAVING 
    COUNT("TrackId") > 0;

-- Ejercicio 15: Lista el país y el estado de los clientes que tienen el soporte asignado a un representante con ID mayor a 3 y cuyo nombre de empresa (Company) no es nulo. Muestra el país, el estado y el número de clientes.

SELECT 
    "Country",
    "State", 
    COUNT("CustomerId") AS TotalCustomers
FROM 
    "Customer"
WHERE 
    "SupportRepId" > 3 
    AND "Company" IS NOT NULL
GROUP BY 
    "Country", 
    "State";

