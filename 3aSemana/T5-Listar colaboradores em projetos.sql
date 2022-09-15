/*(T5)
Tarefa
Criar consulta que liste o nome do departamento, nome do projeto e quantos colaboradores daquele departamento fazem parte do projeto.

Regras de aceita��o
Ordene a consulta pelo nome do departamento e nome do projeto.
*/

SELECT dpto.nome AS DEPARTAMENTO, pjto.nome AS PROJETO, COUNT(*) "QTD. DE COLABORADORES"
FROM BRH.departamento dpto
INNER JOIN BRH.colaborador colab
    ON dpto.sigla = colab.departamento 
INNER JOIN BRH.atribuicao atrb
    ON colab.matricula = atrb.colaborador  
INNER JOIN BRH.projeto pjto
    ON atrb.projeto = pjto.id
GROUP BY dpto.nome, pjto.nome     
ORDER BY dpto.nome, pjto.nome; 




