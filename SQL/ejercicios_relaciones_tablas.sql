
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.

SELECT 
    "Track"."Name" AS "TrackName",
    "Album"."Title" AS "AlbumTitle"
    FROM 
    "Track"
    INNER JOIN 
    "Album" ON "Track"."AlbumId" = "Album"."AlbumId";


-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.

   SELECT 
    "Artist"."Name" AS "ArtistName",
    "Album"."Title" AS "AlbumTitle"
    FROM 
    "Artist"
    LEFT JOIN 
    "Album" ON "Artist"."ArtistId" = "Album"."ArtistId"
    ORDER BY 
    "Artist"."Name";


   
-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 

   SELECT 
    "Customer"."FirstName" || ' ' || "Customer"."LastName" AS "CustomerName",
    SUM("Invoice"."Total") AS "TotalSpent"
    FROM 
    "Invoice"
    RIGHT JOIN 
    "Customer" ON "Customer"."CustomerId" = "Invoice"."CustomerId"
    GROUP BY 
    "Customer"."CustomerId"
    ORDER BY 
    "TotalSpent" desc
   LIMIT 5;


-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
select 
    "E1"."FirstName" || ' ' || "E1"."LastName" AS "EmployeeName",
    "Customer"."FirstName" || ' ' || "Customer"."LastName" AS "CustomerName"
    FROM 
    "Employee" AS "E1"
    LEFT JOIN 
    "Customer" ON "E1"."EmployeeId" = "Customer"."SupportRepId";


-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.

   SELECT 
    "Invoice"."InvoiceId",
    "Track"."Name" AS "TrackName"
    FROM 
    "Invoice"
    CROSS JOIN 
    "InvoiceLine"
    JOIN 
    "Track" ON "InvoiceLine"."TrackId" = "Track"."TrackId";


-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.

   SELECT 
    "Artist"."Name" AS "ArtistName",
    "Genre"."Name" AS "GenreName"
    FROM 
    "Track"
    FULL JOIN 
    "Album" ON "Track"."AlbumId" = "Album"."AlbumId"
    FULL JOIN 
    "Artist" ON "Album"."ArtistId" = "Artist"."ArtistId"
    FULL JOIN 
    "Genre" ON "Track"."GenreId" = "Genre"."GenreId";

--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.

   SELECT 
    "Track"."Name" AS "TrackName",
    "MediaType"."Name" AS "MediaTypeName"
    FROM 
    "Track"
    LEFT JOIN 
    "MediaType" ON "Track"."MediaTypeId" = "MediaType"."MediaTypeId"
    GROUP BY 
    "Track"."Name", "MediaType"."Name";

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**

   SELECT 
    "Track"."Name" AS "TrackName",
    "Genre"."Name" AS "GenreName"
    FROM 
    "Track"
    LEFT JOIN 
    "Genre" ON "Track"."GenreId" = "Genre"."GenreId";

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.

   SELECT 
    "Customer"."FirstName" || ' ' || "Customer"."LastName" AS "CustomerName",
    "Invoice"."InvoiceId"
    FROM 
    "Customer"
    LEFT JOIN 
    "Invoice" ON "Customer"."CustomerId" = "Invoice"."CustomerId";

-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Inista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).

   SELECT 
    "Album"."Title" AS "AlbumTitle",
    "Artist"."Name" AS "ArtistName"
    FROM 
    "Album"
    LEFT JOIN 
    "Artist" ON "Album"."ArtistId" = "Artist"."ArtistId";

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 

   SELECT 
    "Genre"."Name" AS "GenreName",
    COUNT("Track"."TrackId") AS "TrackCount"
    FROM 
    "Genre"
    LEFT JOIN 
    "Track" ON "Genre"."GenreId" = "Track"."GenreId"
    GROUP BY 
    "Genre"."Name"
    ORDER BY 
    "TrackCount" DESC;


--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.

   SELECT 
    "Album"."Title" AS "AlbumTitle",
    SUM("Track"."Milliseconds") / 60000 AS "TotalDurationMinutes"
    FROM 
    "Album"
    JOIN 
    "Track" ON "Album"."AlbumId" = "Track"."AlbumId"
    GROUP BY 
    "Album"."Title";

   
-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.

   SELECT 
    "Customer"."FirstName" || ' ' || "Customer"."LastName" AS "CustomerName",
    SUM("Invoice"."Total") AS "TotalSpent"
    FROM 
    "Customer"
    JOIN 
    "Invoice" ON "Customer"."CustomerId" = "Invoice"."CustomerId"
    GROUP BY 
    "Customer"."CustomerId"
    ORDER BY 
    "TotalSpent" DESC;


-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.

   SELECT 
    "Employee"."FirstName" || ' ' || "Employee"."LastName" AS "EmployeeName",
    "Customer"."FirstName" || ' ' || "Customer"."LastName" AS "CustomerName"
    FROM 
    "Employee"
    LEFT JOIN 
    "Customer" ON "Employee"."EmployeeId" = "Customer"."SupportRepId";


