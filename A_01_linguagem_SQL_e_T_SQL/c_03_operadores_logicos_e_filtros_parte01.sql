-- OPERADORES LÓGICO E FILTROS - PARTE 1
-- OPERADOR WHERE
USE crm
GO

SELECT * FROM cliente
WHERE codigo_pais = 'BR';

-- OPERADOR AN 
SELECT A.primeiro_nome,
	   A.ultimo_nome,
	   A.nascimento,
	   A.sexo,
	   A.etnia
FROM cliente A
WHERE sexo = 'Female'
AND etnia = 'Eskimo';

-- OPERADOR BETWEEN
SELECT A.primeiro_nome,
       A.ultimo_nome,
	   A.nascimento      
FROM cliente A
WHERE A.sexo = 'Female'
AND A.nascimento BETWEEN '1980-01-01' AND '1990-12-31';

-- OPERADOR IN
SELECT A.primeiro_nome,
       A.ultimo_nome,
	   A.id_profissao
FROM cliente A
WHERE A.id_profissao IN ('91', '191', '151');

-- OPERADOR NOT IN
SELECT A.primeiro_nome,
       A.ultimo_nome,
	   A.id_profissao
FROM cliente A
WHERE A.id_profissao NOT IN ('91', '191')
AND A.etnia IN ('Eskimo', 'Lumbee');

 