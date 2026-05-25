--setando o banco de dados
use curso

--Usando operador =
SELECT * FROM senso
WHERE uf = 'SP'

-- MESMO EXEMPLO COLLATE

SELECT * FROM senso
WHERE uf = 'sp';

SELECT * FROM senso
WHERE nome_mun = 'Águas de Lindóia';

SELECT * FROM senso
WHERE nome_mun = 'Águas de Lindoia'; -- vazio

-- OUTRO EXEMPLO DE OPERADOR: AND

SELECT * FROM senso
WHERE nome_mun = 'Dourado'
AND uf = 'SP'

-- USANDO O OPERADOR: >
SELECT * FROM senso
WHERE populacao > 100000

SELECT * FROM senso
WHERE populacao > 1000000

-- USANDO OPERADOR: <
SELECT * FROM senso
WHERE populacao < 10000

-- USANDO OPERADOR: <=
SELECT * FROM senso
WHERE populacao <= 10000

-- USANDO OPERADOR: <=
SELECT * FROM senso
WHERE populacao <= 50000

-- USANDO OPERADOR: <>
SELECT * FROM senso
WHERE uf <> 'SP'
AND uf <> 'SC'

-- COMBINAÇÃO DE OPERADORES
SELECT * FROM senso
WHERE populacao <= 100000
	AND populacao >= 50000
	AND uf <> 'SP'
	AND nome_mun <> 'Vinhedo'