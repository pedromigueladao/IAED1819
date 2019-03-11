# PARTE I - Manipulação de vectores/tabelas

*Nota prévia:* Quando trabalhamos com vectores em C, é comum fazer erros que levam a [Segmentation Faults](https://en.wikipedia.org/wiki/Segmentation_fault). Se obtiver tal erro nos exercícios abaixo provavelmente terá uma gralha nos limites dos seus ciclos, ou seja, deverá estar a tentar aceder a um elemento de um vector que não existe.

---
## ex01

(Gráfico horizontal) Escreva um programa que peça ao utilizador um número inteiro positivo `n < VECMAX`, onde `VECMAX=100`. Depois, leia `n` números inteiros positivos. No final o programa deverá escrever uma representação gráfica dos valores lidos como o que se segue. O gráfico apresentado é o exemplo para `n = 3` e valores `1 3 4`.

```
*
***
****
```

## ex02

(Gráfico vertical suspenso) Escreva um programa que peça ao utilizador um número inteiro positivo `n < VECMAX`, onde `VECMAX=100`. Depois, leia `n` números inteiros positivos. No final o programa deverá escrever uma representação gráfica dos valores lidos como o que se segue. O gráfico apresentado é o exemplo para `n = 3` e valores `1 3 4`.

```
***
 **
 **
  *
```

## ex03

(Gráfico vertical crescente) Escreva um programa que peça ao utilizador um número inteiro positivo `n < VECMAX`, onde `VECMAX=100`. Depois, leia `n` números inteiros positivos. No final o programa deverá escrever uma representação gráfica dos valores lidos como o que se segue. O gráfico apresentado é o exemplo para `n = 3` e valores `1 3 4`.

```
  *
 **
 **
***
```

# PARTE II - Manipulação de strings

Considere que nos exercícios seguintes, todas as strings têm no máximo `MAX = 80` caracteres (incluindo o carácter de fim de string).

## ex04

(Manipulação de Strings: Palíndromo) Escreva um programa que leia uma palavra do terminal e verifica se a palavra é um palíndromo ou não. Uma palavra é um palíndromo se se escrever da mesma maneira da esquerda para a direita e vice-versa (por exemplo, "AMA" é um palíndromo). Se a palavra é um palíndromo, o programa deverá imprimir o valor `yes`, e `no`, se não é.

*Dica:* Podem usar `scanf("%s", s)` para ler uma palavra. Reparem que a string `s` não pede `&` no `scanf`.

## ex05

(Manipulação de Strings: Leitura e Escrita de Linhas de Texto) Escreva uma programa que leia caracteres do teclado, carácter a carácter, até encontrar o carácter `\n` ou EOF e escreve a linha lida no terminal. Implemente a função `int leLinha(char s[])` que lê a linha para a string `s` e devolve o número de caracteres lidos.

*Dica:* __Depois__ de resolver este exercício, experimente utilizar o comando `fgets`.

## ex06

(Manipulação de Strings: Maiúsculas) Escreva um programa que leia uma linha do terminal (use a função do exercício anterior) e que escreve no terminal o mesmo texto, mas com as letras minúsculas substituídas pelas respectivas letras maiúsculas. Implemente a função `void maiusculas(char s[])`.

*Nota:* Recorde que a string `s` é alterada pela função `maiusculas`.

## ex07

(Manipulação de Strings: Apaga Carácter) Escreva um programa que leia uma linha e um carácter e escreve no terminal a mesma linha onde todas as ocorrências do carácter foram removidas. Implemente a função `void apagaCaracter(char s[], char c)`.

*Nota:* a string `s` é alterada pela função `apagaCaracter`.

## ex08

(Maior) Escreva um programa que leia dois números inteiros em representação decimal e imprime o maior desses dois números. Podem assumir que os dois números têm o mesmo número de algarismos.

*Nota:* Os números podem ser demasiado grandes para ser guardados numa variável do tipo `long long`, por exemplo `9988888888888888888887` e `9988888888888888888888`.
