/*(T9)
Tarefa
Criar um relatório que exiba:

O nome do Colaborador;
O email corporativo do Colaborador; e
O telefone celular do Colaborador;
Adicione o comando no arquivo comandos_oracle.sql na sua pasta do Drive.


/***************************************************************************************/
/* CRIANDO A CONSULTA: */

SELECT colaborador.nome as "Colaborador", colaborador.email_corporativo as "E-mail(Corporativo)", tel_colab.numero as "Telefone Celular"
FROM brh.colaborador colaborador, brh.telefone_colaborador tel_colab
WHERE (colaborador.matricula = tel_colab.colaborador) AND (tel_colab.tipo = 'M')
ORDER BY colaborador.nome;

/***************************************************************************************/















