# Algoritmos de Ordenação

## Ex 1

Considere o vector `v = <6, 3, 4, 2, 5, 1>`. Indique o conteúdo de `v` no final de cada passo dos algoritmos

- insertion sort
- selection sort

## Ex 2

Considere o vector `v = <12, 2, 18, 15, 16, -1, 35, 30, 15>`.

Será possível o vector `<-1, 2, 12, 15, 18, 15, 16, 30, 35>` corresponder ao conteúdo de `v` num passo intermédio da aplicação dos algoritmos

- insertion sort
- selection sort, ou
- merge sort

Se não puder, indique as razões.

## Ex 3

Considere a aplicação do algoritmo bubblesort ao vector `v=<20, 11, 16, 9, 12, 14, 17, 19, 13, 15>`. Supondo que o algoritmo percorre o vector da esquerda para a direita em cada iteração, qual o conteúdo do vector após as duas primeiras iterações do algoritmo bubblesort?

## Ex 4

Considere a implementação clássica da função `int partition (Item v[], int l, int r)` usada no algoritmo quicksort tal como apresentada nas aulas teóricas. Esta função recebe o vector `v` e as posições `left` e `right` que definem, respectivamente, os índices limite esquerdo e direito do vector a considerar na função. Suponha que o procedimento partition é invocado com os seguintes argumentos: `v = <13, 6, 5, 14, 12, 4, 16, 18, 7, 9, 10>`, `left = 0`, `right = 10`.  Considerando a posição `a[r]` como pivot, indique qual o conteúdo do vector `v` após a execução da função `partition`.

## Ex 5

Considere o exercício anterior, mas onde os argumentos da função `partition` são os seguintes: `v =<20, 11, 16, 9, 12, 14, 17, 19, 13, 15>`, `left = 0` , `right = 9`. Qual o conteúdo do vector `v` após a execução do procedimento `partition`?

## Ex 6

Diga quais dos seguintes vectores corresponde a um amontoado (heap)?

- `<50, 25, 30, 27, 24, 21, 28>`
- `<50, 30, 25, 27, 24, 28, 21>`
- `<60, 50, 9, 40, 41, 10, 8>`
- `<40, 15, 18, 13, 11, 14, 16>`
- `<60, 30, 80, 10, 35, 70, 40>`

## Ex 7

A primeira operação do algoritmo heapsort é transformar o vector num amontoado. Considere que o vector de entrada do algoritmo é `<20, 11, 16, 9, 12, 14, 17, 19, 13, 15>`.

- Indique o conteúdo do vector após o passo de transformação num amontoado.
- Indique o conteúdo do vector após os dois maiores elementos terem sido ordenados (colocados na sua posição final), durante a operação de ordenação (heapsort).

## Ex 8

Qual o conteúdo do seguinte vector `<25, 19, 23, 15, 18, 16, 21, 12>` depois de os dois primeiros elementos (i.e. os dois maiores) terem sido ordenados, utilizando o algoritmo de ordenação heapsort?

## Ex 9

- (Radix LSD) Considere a aplicação do algoritmo radix sort LSD, em que cada passo os elementos são ordenados considerando um dígito, ao seguinte vector:

`<48372, 62309, 83861, 91874, 18913, 33829, 47812, 95954, 52377, 22394, 56108, 60991>`

Qual é o terceiro número da sequência, após o algoritmo ter considerado três digitos?

## Ex 10

- (Radix MSD) Considere o seguinte vector de números inteiros sem sinal de 6 bits:

`<32, 2, 34, 9, 6, 1, 20, 18, 10>`

Qual o conteúdo do vector após os primeiros dois passos do algoritmo de ordenação radix sort MSD, em que em cada passo os elementos são ordenados considerando 2 bits?

Nota: considere que o algoritmo é baseado numa versão estável do algoritmo counting sort. O algoritmo deve apenas processar os 6 bits menos significativos de cada número, independentemente dos números poderem ser guardados em palavras com maior número de bits.