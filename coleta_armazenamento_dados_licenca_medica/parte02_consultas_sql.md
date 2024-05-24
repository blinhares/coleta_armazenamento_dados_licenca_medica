# Criar Tabela temporaria de Idade
```SQL
CREATE temporary TABLE tb_idade
SELECT cod_colaborador, data_nascimento
, timestampdiff(YEAR, data_nascimento, NOW()) AS idade
from tb_colaborador;
```

# Q1 - Qual é a idade média dos colaboradores do sexo masculino que estão solteiros?
Grupo de escolhas da pergunta

```SQL
select avg(idade) from tb_idade
join tb_colaborador on tb_idade.cod_colaborador = tb_colaborador.cod_colaborador
join tb_estado_civil on tb_colaborador.cod_estado_civil = tb_estado_civil.cod_estado_civil
where sexo_colaborador = 'Masculino' and estado_civil = 'Solteiro(a)';
```

__RESPOSTA -> 44,29__


# Q2 - Qual é o motivo de licença que foi mais frequentemente solicitado por mulheres com mais de 35 anos?

```SQL
SELECT motivo_licenca,COUNT(1) FROM tb_idade
JOIN tb_processamento_licenca ON tb_idade.cod_colaborador = tb_processamento_licenca.cod_colaborador
JOIN tb_colaborador ON tb_colaborador.cod_colaborador = tb_idade.cod_colaborador
JOIN tb_motivo_licenca ON tb_motivo_licenca.cod_motivo_licenca = tb_processamento_licenca.cod_motivo_licenca
WHERE idade > 35 and sexo_colaborador = 'Feminino'
GROUP BY motivo_licenca 
ORDER BY COUNT(1) DESC;
```

__ RESPOSTA -> Comum__

# Q3 - Dentre a lista abaixo, escolha o médico que atendeu o maior número de colaboradores do estado de Minas Gerais.

```SQL
SELECT nome_medico, COUNT(1) FROM tb_processamento_licenca
JOIN tb_colaborador ON tb_colaborador.cod_colaborador = tb_processamento_licenca.cod_colaborador
JOIN tb_estado ON tb_estado.cod_estado = tb_colaborador.cod_estado
JOIN tb_medico ON tb_medico.cod_medico = tb_processamento_licenca.cod_medico
WHERE estado = 'Minas Gerais'
GROUP BY nome_medico
ORDER BY COUNT(1) DESC ;
```

__RESPOSTA -> Dr. Pedro__

# Q4 - Qual estado tem o maior número de pessoas com ensino Fundamental que têm a leitura como hobbie?

```SQL
SELECT estado, COUNT(1) FROM tb_processamento_licenca
JOIN tb_colaborador ON tb_colaborador.cod_colaborador = tb_processamento_licenca.cod_colaborador
JOIN tb_estado ON tb_estado.cod_estado = tb_colaborador.cod_estado
JOIN tb_medico ON tb_medico.cod_medico = tb_processamento_licenca.cod_medico
JOIN tb_hobbie ON tb_hobbie.cod_hobbie = tb_colaborador.cod_hobbie
WHERE hobbie = 'Leitura'
GROUP BY estado
ORDER BY COUNT(1) DESC
;
```

__RESPOSTA -> Santa Catarina__

# Q5 - Qual é o número de pessoas com ensino superior que são naturais ou pertencem ao estado de Pernambuco?

```SQL
SELECT COUNT(1) FROM tb_processamento_licenca
JOIN tb_colaborador ON tb_colaborador.cod_colaborador = tb_processamento_licenca.cod_colaborador
JOIN tb_estado ON tb_estado.cod_estado = tb_colaborador.cod_estado
JOIN tb_medico ON tb_medico.cod_medico = tb_processamento_licenca.cod_medico
JOIN tb_hobbie ON tb_hobbie.cod_hobbie = tb_colaborador.cod_hobbie
JOIN tb_escolaridade ON tb_escolaridade.cod_escolaridade = tb_colaborador.cod_escolaridade
WHERE escolaridade = 'Superior' and estado = 'Pernambuco'
ORDER BY COUNT(1) DESC
;
```

__RESPOSTA -> 10__

# Q6 - Calcule a média de filhos entre todas as pessoas atendidas pelo Dr. Lessa e assinale a alternativa CORRETA.

```SQL
SELECT sexo_colaborador,AVG(qtd_filhos)  FROM tb_processamento_licenca
JOIN tb_colaborador ON tb_colaborador.cod_colaborador = tb_processamento_licenca.cod_colaborador
JOIN tb_estado ON tb_estado.cod_estado = tb_colaborador.cod_estado
JOIN tb_medico ON tb_medico.cod_medico = tb_processamento_licenca.cod_medico
JOIN tb_hobbie ON tb_hobbie.cod_hobbie = tb_colaborador.cod_hobbie
JOIN tb_escolaridade ON tb_escolaridade.cod_escolaridade = tb_colaborador.cod_escolaridade
WHERE nome_medico = 'Dr. Lessa'
GROUP BY sexo_colaborador;
```

__RESPOSTA -> A média de filhos entre os colaboradores do sexo masculino é superior à média das colaboradoras do sexo feminino.__

# Q7 - Qual colaborador possui o maior salário na base de dados?

```SQL
SELECT nome_colaborador,salario  FROM tb_processamento_licenca
JOIN tb_colaborador ON tb_colaborador.cod_colaborador = tb_processamento_licenca.cod_colaborador
JOIN tb_estado ON tb_estado.cod_estado = tb_colaborador.cod_estado
JOIN tb_medico ON tb_medico.cod_medico = tb_processamento_licenca.cod_medico
JOIN tb_hobbie ON tb_hobbie.cod_hobbie = tb_colaborador.cod_hobbie
JOIN tb_escolaridade ON tb_escolaridade.cod_escolaridade = tb_colaborador.cod_escolaridade
ORDER BY salario DESC;
```

__RESPOSTA -> Nathan Barros.__

# Q8 - Qual estado apresenta a maior média salarial entre os colaboradores?

```SQL
SELECT estado,AVG(salario)  FROM tb_processamento_licenca
JOIN tb_colaborador ON tb_colaborador.cod_colaborador = tb_processamento_licenca.cod_colaborador
JOIN tb_estado ON tb_estado.cod_estado = tb_colaborador.cod_estado
JOIN tb_medico ON tb_medico.cod_medico = tb_processamento_licenca.cod_medico
JOIN tb_hobbie ON tb_hobbie.cod_hobbie = tb_colaborador.cod_hobbie
JOIN tb_escolaridade ON tb_escolaridade.cod_escolaridade = tb_colaborador.cod_escolaridade
GROUP BY estado
ORDER BY AVG(salario) DESC;
```

__RESPOSTA -> Minas Gerais__

# Q9 - Qual licença teve a menor média de duração entre os colaboradores?

```SQL
SELECT motivo_licenca,AVG(duracao_licenca)  FROM tb_processamento_licenca
JOIN tb_colaborador ON tb_colaborador.cod_colaborador = tb_processamento_licenca.cod_colaborador
JOIN tb_estado ON tb_estado.cod_estado = tb_colaborador.cod_estado
JOIN tb_medico ON tb_medico.cod_medico = tb_processamento_licenca.cod_medico
JOIN tb_hobbie ON tb_hobbie.cod_hobbie = tb_colaborador.cod_hobbie
JOIN tb_escolaridade ON tb_escolaridade.cod_escolaridade = tb_colaborador.cod_escolaridade
JOIN tb_motivo_licenca ON tb_motivo_licenca.cod_motivo_licenca = tb_processamento_licenca.cod_motivo_licenca
GROUP BY motivo_licenca
ORDER BY AVG(duracao_licenca);
```

__RESPOSTA -> Acidente de TRABALHO__


# Q10 -Qual especialidade realizou o menor número de atendimentos?

```SQL
SELECT especialidade, COUNT(1)  FROM tb_processamento_licenca
JOIN tb_colaborador ON tb_colaborador.cod_colaborador = tb_processamento_licenca.cod_colaborador
JOIN tb_estado ON tb_estado.cod_estado = tb_colaborador.cod_estado
JOIN tb_medico ON tb_medico.cod_medico = tb_processamento_licenca.cod_medico
JOIN tb_hobbie ON tb_hobbie.cod_hobbie = tb_colaborador.cod_hobbie
JOIN tb_escolaridade ON tb_escolaridade.cod_escolaridade = tb_colaborador.cod_escolaridade
JOIN tb_motivo_licenca ON tb_motivo_licenca.cod_motivo_licenca = tb_processamento_licenca.cod_motivo_licenca
JOIN tb_especialidade ON tb_medico.cod_especialidade = tb_especialidade.cod_especialidade
GROUP BY especialidade
ORDER BY COUNT(1) 
```

__RESPOSTA -> Ginecologista obstetra__

