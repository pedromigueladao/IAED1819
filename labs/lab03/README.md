# ex01

(Quadrado de Números) Escreva um programa que desenhe um quadrado de números como o que se segue utilizando a função `void quadrado(int N);`. O valor de `N`, dado pelo utilizador, deverá ser obrigatoriamente maior ou igual 2. O tab (carácter `'\t'`) deve ser usado como o separador. O quadrado apresentado é o exemplo para `N = 5`.

```
1       2       3       4      5
2       3       4       5      6
3       4       5       6      7
4       5       6       7      8
5       6       7       8      9
```

*Dica:* `echo 5 | ./ex01` pode ser usado para rapidamente testar o programa.

# ex02

(Pirâmide de Números) Escreva um programa que desenhe uma pirâmide de números utilizando a função `void piramide(int N);`. O valor de `N`, dado pelo utilizador, deverá ser obrigatoriamente superior ou igual 2. O espaço (carácter `' '`) deve ser usado como o separador.
A pirâmide apresentada é o exemplo para `N = 5`.

```
        1
      1 2 1
    1 2 3 2 1
  1 2 3 4 3 2 1
1 2 3 4 5 4 3 2 1
```

# ex03

(Cruz diagonal) Escreva um programa que desenhe uma cruz nas diagonais utilizando a função `void cruz(int N);`.  O asterisco (carácter `'*'`) deve ser usado para desenhar a cruz; hífen (carácter `'-'`) deve ser usado como o separador. As cruzes apresentadas são os exemplos para `N = 3` e `N=8`.

```
* - *
- * -
* - *
```

```
* - - - - - - *
- * - - - - * -
- - * - - * - -
- - - * * - - -
- - - * * - - -
- - * - - * - -
- * - - - - * -
* - - - - - - *
```

# ex04

(Números) Escreva um programa que leia uma sequência de números separados por espaços e novas linhas,
e imprima a mesma sequência, mas os números no output não deverão conter 0 no início, por exemplo, `007` deverá imprimir `7`.

A excepção é o número 0, que se deverá imprimir como 0.
A sequência no input termina com `EOF`.

*Dica:* a função `int getchar()` pode ser usada para ler um carácter.