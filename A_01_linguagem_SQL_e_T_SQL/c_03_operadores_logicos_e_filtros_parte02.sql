
--
USE crm;
GO

-- LIKE LOCALIZA VALORES QUE CONTENHAM "or" EM QUALQUER LUGAR
SELECT A.primeiro_nome,
       A.ultimo_nome
FROM cliente A
WHERE A.primeiro_nome LIKE '%or%';

-- LIKE ENCONTRAR QUAISQUER VALORES QUE TENHAM "r" NA SEGUNDA POSIÇÃO
SELECT A.primeiro_nome,
       A.ultimo_nome
FROM cliente A
WHERE A.primeiro_nome LIKE '_r%';

-- LIKE LOCALIZAR VALORES QUE COMEÇAM COM "a" E PÓSSUEM PELO MENOS 3 CARACTERES DE COMPRIMENTO
SELECT A.primeiro_nome,
       A.ultimo_nome
FROM cliente A
WHERE A.primeiro_nome LIKE 'a_%_%';

-- LIKE LOCALIZA VALORES QUE COMEÇAM COM "a" E TERMINA COM "o"
SELECT A.primeiro_nome,
       A.ultimo_nome
FROM cliente A
WHERE A.primeiro_nome LIKE 'a%o';

-- LIKE LOCALIZA VALORES QUE COMEÇAM COM "a"
SELECT A.primeiro_nome,
       A.ultimo_nome
FROM cliente A
WHERE A.primeiro_nome LIKE 'a%';

SELECT A.primeiro_nome,
       A.ultimo_nome
FROM cliente A
WHERE A.primeiro_nome NOT LIKE 'a%';

-- OPERADOR LIKE CORINGA []
SELECT A.primeiro_nome,
       A.ultimo_nome
FROM cliente A
WHERE A.primeiro_nome LIKE '[CS]he%';

SELECT A.primeiro_nome,
       A.ultimo_nome
FROM cliente A
WHERE A.primeiro_nome LIKE 'he[CS]%';


-- OPERADOR NOT
USE curso;

SELECT *
FROM senso
WHERE nome_mun LIKE 'A%'
AND UF = 'SP'
AND NOT populacao > 10000;

-- OPERADOR OR
SELECT *
FROM senso
WHERE populacao < 50000
AND (UF = 'AM' OR UF = 'PR');

USE AdventureWorks2017;

-- OPERADOR IS NULL
SELECT LASTNAME,
       FIRSTNAME,
       MIDDLENAME
FROM person.person
WHERE MiddleName IS NULL;

SELECT LASTNAME,
       FIRSTNAME,
       MIDDLENAME
FROM person.person
WHERE MiddleName IS NOT NULL;

-- OPERADOR EXISTS
SELECT A.FirstName,
       A.LastName
FROM Person.Person AS A
WHERE EXISTS 
            (SELECT *
             FROM HumanResources.Employee AS B
             WHERE A.BusinessEntityID = B.BusinessEntityID
             AND A.LastName = 'Johnson');

-- MESMO EXEMPLO UTILIZANDO IN

SELECT A.FirstName,
       A.LastName
FROM Person.Person AS A
WHERE A.LastName IN
            (SELECT A.LastName
             FROM HumanResources.Employee AS B
             WHERE A.BusinessEntityID = B.BusinessEntityID
             AND A.LastName = 'Johnson');

-- O EXEMPLO A SEGUIR MOSTRA DUAS CONSULTAS PARA LOCALIZAR LOJAS CUJO NOME SEJA IGUAL AO DE UM FORNECEDOR.
-- A PRIMEIRA CONUSLTA USA EXISTS E A SEGUNDA CONSULTA USA = '' ANY
SELECT DISTINCT S. NAME
FROM Sales.Store AS S
WHERE EXISTS
            (SELECT *
             FROM Purchasing.Vendor AS V
             WHERE S.Name = V.Name);

--MESMO EXEMPLO UTILIZANDO ANY

SELECT DISTINCT S. NAME
FROM Sales.Store AS S
WHERE S.Name = ANY
            (SELECT V.Name
             FROM Purchasing.Vendor AS V);

-- OPERADOR IS NOT NULL
SELECT LastName,
       FirstName,
       MiddleName
FROM Person.Person
WHERE MiddleName IS NOT NULL;

-- OPERADORS HAVING
USE curso;

SELECT A.UF,
       COUNT(A.cod_mun) AS QTD_CIDADES
FROM senso A
GROUP BY A.uf HAVING COUNT(A.cod_mun) > 100
ORDER BY 2 DESC;


SELECT A.UF,
       COUNT(A.cod_mun) AS QTD_CIDADES
FROM senso A
GROUP BY A.uf HAVING COUNT(A.cod_mun) < 100
ORDER BY 2 DESC;

SELECT A.uf,
       SUM(A.populacao) AS POPULACAO
FROM senso A
GROUP BY A.UF HAVING SUM(A.populacao) < 1000000
ORDER BY 2 DESC;