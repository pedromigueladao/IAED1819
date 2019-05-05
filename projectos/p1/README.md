# Enunciado do Projecto 1 - IAED 2018/19

## Data de entrega: 04 de Abril de 2019 (17h59m)

## LOG alterações

* (22Mar2019) Corrigidos os outputs dos ficheiros de teste. Datas foram normalizadas para a forma _ddmmaaaa_ e tempos para _hhmm_.
* (22Mar2019) Adicionada nota referente ao máximo de eventos por sala.
* (22Mar2019) Adicionado o comando `x`.
* (22Mar2019) Clarifica as mensagens de erros, e erros sobrepostos.

## 1. Introdução

O objectivo deste projeto é o desenvolvimento, em linguagem C, de um sistema de reserva de salas. A interacção com o programa deverá ocorrer através de um conjunto de linhas compostas por uma letra (comando) e um número de argumentos dependente do comando a executar. Os possíveis comandos são listados na Tabela seguinte e indicam as operações a executar.

| Comando | Acção |
|:---:|:---|
| __a__ | Adiciona um novo evento |
| __l__ | lista todos os eventos por ordem cronológica |
| __s__ | lista todos os eventos de uma dada sala por ordem cronológica |
| __r__ | apaga um evento |
| __i__ | altera a hora de início de um evento |
| __t__ | altera a duração de um evento |
| __m__ | muda a sala de um evento |
| __A__ | adiciona um participante a um evento |
| __R__ | remove um participante de um evento |
| __x__ | termina o programa |

## 2. Especificação do problema

O objectivo do projecto é ter um sistema de reserva de salas onde podem ser agendadas reuniões/eventos.

Existem várias salas de reuniões onde podem ser agendados eventos.

Cada evento tem:

* uma descrição (uma string com um máximo de 63 caracteres),
* um dia em que se vai realizar (no formato _ddmmaaaa_),
* um tempo de início (no formato _hhmm_)
* uma duração (em minutos),
* a sala em que se irá realizar (um inteiro entre 1 e 10),
* uma pessoa responsável pelo evento (uma string com um máximo de 63 caracteres), e
* uma lista de participantes para além do responsável (uma string em que os participantes são separados pelo caracter `':'` com um mínimo de 1 e um máximo de 3). Pode assumir que o nome de cada um dos participantes também terá um máximo de 63 caracteres.

Nunca poderão existir eventos sobrepostos numa mesma sala nem responsáveis/participantes que estejam em mais que um evento ao mesmo tempo.

O identificador de eventos é a sua _descrição_ que poderá assumir ser única. Nunca serão criados 2 eventos distintos com a mesma descrição.

Pode assumir que cada evento termina no dia em que começa, ie, não passa para o dia seguinte, e que a sua duração será em minutos (entre 1 e 1440=24horas). Se necessário pode assumir que nenhum evento foi agendado antes de `01012019`.

Pode assumir que existem no máximo 10 salas, numeradas de 1 a 10, e que nunca serão agendados mais que 100 eventos por sala ao mesmo tempo.

_Nota (22Mar2019): Não viola a hipótese acima a criação de 100 eventos para uma sala, seguida da remoção de um evento, seguida da criação de outro._

Pode assumir que todo o input fornecido respeitará os tipos indicados. Por exemplo, nunca será dada uma sala que seja uma string, um valor negativo, zero, nem um valor superior a 10.

Pode também assumir que as operações mais comuns serão as operações do tipo `a`, `l` e `s`.

## 3. Dados de Entrada

O programa deverá ler os dados de entrada a partir da linha de comandos e do terminal.

Durante a execução do programa as instruções devem ser lidas do terminal (standard input) na forma de um conjunto de linhas iniciadas por um carácter, que se passa a designar por comando, seguido de um número de informações dependente do comando a executar; o comando e cada uma das informações são separados pelo caracter `':'`.

Os comandos disponíveis são descritos de seguida. Cada comando indica uma determinada acção que se passa a caracterizar em termos de formato de entrada, formato de saída, e erros a retornar:

* __a__ - Adiciona um novo evento
  * Formato de entrada: `a descricao:data:inicio:duracao:sala:responsavel:participantes`
  * Formato de saída: NADA (excepto erro)
  * Erros:
    * `Impossivel agendar evento <descricao>. Sala<sala> ocupada.` no caso de a sala estar ocupada no período em causa;
    * `Impossivel agendar evento <descricao>. Participante <participante> tem um evento sobreposto.` se a sala estiver disponível mas o responsável ou um dos participantes já tiver um evento sobreposto. Se vários tiverem indisponibilidade deverá retornar todas as indisponibilidades pela ordem responsável, participante1, participante2, participante3.
* __l__ - lista todos os eventos por ordem cronológica do seu início. No caso de existirem vários eventos que se iniciem ao mesmo tempo, deverão ser listados pela ordem crescente do número da sala.
  * Formato de entrada: `l`
  * Formato de saída: Um par de linhas no formato abaixo, por cada evento existente,

        <descricao> <data> <inicio> <duracao> Sala<sala> <responsavel>
        * <participante1> <participante2> <participante3>

    Os participantes deverão ser listados pela ordem em que foram introduzidos.
  * Erros: Não aplicável
* __s__ - lista todos os eventos de uma dada sala por ordem cronológica
  * Formato de entrada: `s sala`
  * Formato de saída: Igual ao formato de saída do comando `l`
  * Erros: Não aplicável
* __r__ - apaga um evento
  * Formato de entrada: `r descricao`
  * Formato de saída: NADA (excepto erro)
  * Erros:
    * `Evento <descricao> inexistente.` no caso de o evento não existir
* __i__ - altera a hora de início de um evento
  * Formato de entrada: `i descricao:novo_inicio`
  * Formato de saída: NADA (excepto erro)
  * Erros:
    * `Evento <descricao> inexistente.` no caso de o evento não existir
    * Os mesmos que os erros para o comando `a` no caso de o evento existir
* __t__ - altera a duração de um evento
  * Formato de entrada: `t descricao:nova_duracao`
  * Formato de saída: NADA (excepto erro)
  * Erros:
    * `Evento <descricao> inexistente.` no caso de o evento não existir
    * Os mesmos que os erros para o comando `a` no caso de o evento existir
* __m__ - muda a sala de um evento
  * Formato de entrada: `m descricao:nova_sala`
  * Formato de saída: NADA (excepto erro)
  * Erros:
    * `Evento <descricao> inexistente.` no caso de o evento não existir
    * `Impossivel agendar evento <descricao>. Sala<sala> ocupada.` no caso de a sala estar ocupada no período em causa
* __A__ - adiciona um participante a um evento já existente. Se o participante já participar no evento, então não deverá fazer nenhuma acção
  * Formato de entrada: `A descricao:participante`
  * Formato de saída: NADA (excepto erro)
  * Erros:
    * `Evento <descricao> inexistente.` no caso de o evento não existir
    * `Impossivel adicionar participante. Evento <descricao> ja tem 3 participantes.` no caso de o evento já ter o máximo de 3 participantes
    * `Impossivel adicionar participante. Participante <participante> tem um evento sobreposto.` no caso de _ser possível adicionar participantes_ mas o participante já tiver um evento sobreposto
* __R__ - remove um participante de um evento já existente. Se o participante não participar no evento, então não deverá fazer nenhuma acção
  * Formato de entrada: `R descricao:participante`
  * Formato de saída: NADA (excepto erro)
  * Erros:
    * `Evento <descricao> inexistente.` no caso de o evento não existir
    * `Impossivel remover participante. Participante <participante> e o unico participante no evento <descricao>.` no caso de o participante ser o único participante do evento (para além do responsável).

## 4. Dados de Saída

O programa deverá escrever no standard output as respostas aos comandos apresentados no standard input. As respostas são igualmente linhas de texto formatadas conforme definido anteriormente neste enunciado. Tenha em atenção o número de espaços entre elementos do seu output, assim como os espaços no final de cada linha. Procure respeitar escrupulosamente as indicações dadas.

## 5. Exemplos (Input/Output)

Ver os exemplos de input e respectivos output na pasta `testes_enunciado/`.

## 6. Compilação do Programa

O compilador a utilizar é o `gcc` com as seguintes opções de compilação: `-Wall -Wextra -ansi -pedantic`. Para compilar o programa deve executar o seguinte comando:

    $ gcc -Wall -Wextra -ansi -pedantic -o proj1 *.c

o qual deve ter como resultado a geração do ficheiro executável `proj1`, caso não haja erros de compilação. __A execução deste comando não deverá escrever qualquer resultado no terminal. Caso a execução deste comando escreva algum resultado no terminal, considera-se que o programa não compilou com sucesso__. Por exemplo, durante a compilação do programa, o compilador não deverá escrever mensagens de aviso (warnings).

## 7. Execução do Programa

O programa deve ser executado da forma seguinte:

    $ ./proj1 < test.in > test.myout

Posteriormente poderá comparar o seu output (`*.myout`) com o output previsto (`*.out`) usando o comando `diff`

    $ diff test.out test.myout

### 7.1. Testes Auxiliares

Para testar o seu programa poderá executar os passos indicados acima ou usar os scripts `run.sh` e `runall.sh` distribuídos nesta pasta. Para isso __deverão ter a vossa solução nesta pasta__ e

1. Se quiserem executar apenas o `test.in` da pasta `pasta` deverão executar

        $ ./run.sh <vosso_ficheiro_c> pasta/test.in

2. Se quiserem executar os testes `test1.in` da pasta `pasta1` e o `test2.in` da pasta `pasta2` deverão executar

        $ ./run.sh <vosso_ficheiro_c> pasta1/test1.in pasta2/test2.in

3. Para executarem todos os testes de uma `pasta` deverão executar

        $ ./runall.sh <vosso_ficheiro_c> pasta

Estes scripts compilam o ficheiro indicado e comparam o resultado obtido com o resultado esperado. Se apenas indicar o tempo de execução é porque o comando `diff` não encontrou nenhuma diferença. Caso indique  mais informação, então é porque o resultado obtido e o resultado esperado diferem. Para obter a informação detalhada das diferenças poderá remover a opção `–q` da linha 13 do ficheiro `run.sh`.

#### 7.1.1 Projecto dividido em múltiplos ficheiros

Para testar implementações que usam vários ficheiros `.c`, e.g. `p1.c` e `p2.c`, podem usar o script `test.sh`. Para executarem todos os testes de uma `pasta` deverão executar

        $ ./test.sh pasta p1.c p2.c

ou

        $ ./test.sh pasta *.c

para incluir todos os ficheiros `.c`. Notem a __inversão dos argumentos__ face aos scripts `run.sh` e `runall.sh`.

## 8. Entrega do Projecto

A entrega do projecto deverá respeitar o procedimento seguinte:

* Na página da disciplina aceda ao sistema para entrega de projectos. O sistema será activado uma semana antes da data limite de entrega. Instruções acerca da forma de acesso ao sistema serão oportunamente fornecidas.

* Efectue o upload de um ficheiro arquivo com extensão `.zip` que inclua todos os ficheiros fonte que constituem o programa.
  * Se o seu código tiver apenas um ficheiro o zip conterá apenas esse ficheiro
  * Se o seu código estiver estruturado em vários ficheiros (`.c` e `.h`) não se esqueça de os juntar também ao pacote.

* Para criar um ficheiro arquivo com a extensão `.zip` deve executar o seguinte comando na directoria onde se encontram os ficheiros com extensão `.c` e `.h` (se for o caso), criados durante o desenvolvimento do projecto:

        $ zip proj1.zip *.c *.h

    Se só tiver um único ficheiro (e.g., `proj1.c`), bastará escrever:

        $ zip proj1.zip proj1.c

* Como resultado do processo de upload será informado se a resolução entregue apresenta a resposta esperada num conjunto de casos de teste.

* O sistema não permite submissões com menos de 10 minutos de intervalo para o mesmo grupo. Tenha especial atenção a este facto na altura da submissão final. Exemplos de casos de teste serão oportunamente fornecidos.

* Data limite de entrega do projecto: __04 de Abril de 2019 (17h59m)__. Até à data limite poderá efectuar o número de submissões que desejar, sendo utilizada para efeitos de avaliação a última submissão efectuada. Deverá portanto verificar cuidadosamente que a última submissão corresponde à versão do projecto que pretende que seja avaliada. Não existirão excepções a esta regra.

## 9. Avaliação do Projecto

### 9.1. Componentes da Avaliação

Na avaliação do projecto serão consideradas as seguintes componentes:

1. A primeira componente avalia o desempenho da funcionalidade do programa realizado. Esta componente é avaliada entre 0 e 16 valores.

2. A segunda componente avalia a qualidade do código entregue, nomeadamente os seguintes aspectos: comentários, indentação, estruturação, modularidade, abstracção, entre outros. Esta componente poderá variar entre -4 valores e +4 valores relativamente à classificação calculada no item anterior e será atribuída posteriormente.
Algumas guidelines sobre este tópico podem ser encontradas [aqui](guidelines.md).

### 9.2. Atribuição Automática da Classificação

* A classificação da primeira componente da avaliação do projecto é obtida através da execução automática de um conjunto de testes num computador com o sistema operativo GNU/Linux. Torna-se portanto essencial que o código compile correctamente e que respeite o formato de entrada e saída dos dados descrito anteriormente. Projectos que não obedeçam ao formato indicado no enunciado serão penalizados na avaliação automática, podendo, no limite, ter 0 (zero) valores se falharem todos os testes. Os testes considerados para efeitos de avaliação poderão incluir (ou não) os disponibilizados na página da disciplina, além de um conjunto de testes adicionais. A execução de cada programa em cada teste é limitada na quantidade de memória que pode utilizar, até um máximo de 64 MB, e no tempo total disponível para execução, sendo o tempo limite distinto para cada teste.

* Note-se que o facto de um projecto passar com sucesso o conjunto de testes disponibilizado na página da disciplina não implica que esse projecto esteja totalmente correcto. Apenas indica que passou alguns testes com sucesso, mas este conjunto de testes não é exaustivo. É da responsabilidade dos alunos garantir que o código produzido está correcto.

* Em caso algum será disponibilizado qualquer tipo de informação sobre os casos de teste utilizados pelo sistema de avaliação automática. A totalidade de ficheiros de teste usados na avaliação do projecto serão disponibilizados na página da disciplina após a data de entrega.

## 10. Revisão do Projecto

### Data: entre as 00h00 do dia 05Maio2019 e as 16h59m do dia 06Maio2019

Serão aceites __pequenas correcções__ ao projecto que cumpram as seguintes regras:

* um máximo de 10 linhas alteradas (ou adicionadas);
* um número ilimitado de linhas removidas;
* alterações de formatação de output ilimitadas (`printf`s e similares);

As revisões deverão ser submetidas no sistema Mooshak no período __entre as 00h00 do dia 05Maio2019, e as 16h59m do dia 06Maio2019. Após uma submissão, a próxima só poderá ser feita passadas 12 hrs.__

O corpo docente reserva-se no direito de não aceitar as revisões que, apesar de cumprirem as regras acima, contrariem o espírito de *pequenas correcções*. Exemplos que violam o espírito de *pequenas correcções* são o desenvolvimento de funcionalidades que não tenham sido feitas na submissão original e/ou alterações significativas que sejam codificadas numa só linha.

A pontuação obtida através destas correcções será uma percentagem do valor que seria obtido aquando da submissão original e poderá ser vista [aqui](grelha-revisao.pdf).

Abaixo podem encontrar alguns testes simples que facilitam o despiste de erros comuns que detectámos.
Sugerimos que testem as vossas correcções localmente antes de as submeterem no Mooshak.

### Testes Revisão

Na pasta `testes_revisao` podem encontrar alguns testes para despistar erros comuns:

* `teste00_max_tamanhos.in` - verifica que os tamanhos máximos das strings
* `teste01_participantes.in` - Cria eventos com 1, 2, e 3 participantes
* `teste02_outputs.in` - Testa a correcta formatação dos outputs (hora e dia)
* `teste03_adiciona_ordenado.in` - Adiciona eventos ordenados numa mesma sala (no mesmo dia). Comando `s`.
* `teste04_adiciona_invertido.in` - Adiciona eventos por ordem inversa numa mesma sala (no mesmo dia). Comando `s`.
* `teste05_adiciona_invertido_dias_diferentes.in` - Adiciona eventos por ordem inversa numa mesma sala (em dias diferentes). Comando `s`.
* `teste06_adiciona_ordenado_salas_diferentes.in` - Adiciona eventos ordenados em salas diferentes (no mesmo dia). Comando `l`.
* `teste07_adiciona_invertido_diferentes_salas.in` - Adiciona eventos desordenadamente em dias e salas diferentes. Comando `l`.

Sugerimos que sigam os seguintes passos:

1. Corrijam o código de forma incremental.
2. Garantam que o vosso código compila sem erros. Se necessário removam funcionalidades comentando código.
3. Garantam que estão a ler o input e a escrever o output correctamente, em particular garantam que as strings não ficam com espaços extra, `\n` no final, que a formatação está correcta, etc. (testes revisao 00-02)
4. Garantam que o comando `a` funciona correctamente supondo que não há eventos sobrepostos nem outros erros (testes revisao 00-03, e testes públicos 00-01)
5. Garantam que o comando `s` funciona correctamente (testes revisao 03-05, e testes públicos 00-01)
6. Garantam que o comando `l` funciona correctamente (testes revisao 06-07, e testes públicos 23)
7. Garantam que o comando `a` funciona correctamente nos casos de erro (testes pulicos 02-04)
8. Garantam que cada um dos outros comandos funciona isoladamente `r` (testes públicos 05-06), `i` (testes públicos 07-11), `t` (testes públicos 12-15), `m` (testes públicos 16-18), `A` (testes públicos  19-20), `R` (testes públicos 21-22)
9. Testem o programa em toda a sua generalidade (testes públicos 24-43)