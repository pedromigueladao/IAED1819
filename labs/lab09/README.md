# Estruturas Auto-referenciadas

## ex01

Implemente em C um programa que leia uma sequência de inteiros terminada por `0` e imprima a mesma sequência, mas invertida. O programa deve ser implementado usando listas ligada. A lista será representada pela seguinte estrutura:

    typedef struct stru_node {
        struct stru_node *next;
        int v;
    } node;

e deverá ser manipulada pelas seguintes funções:

    /* remove the first element of the list and return the new head */
    node * pop(node * head);
    /* add integer e as the first element of the list and return the new head */
    node * push(node * head, int e);
    /* frees all memory associated with the list and returns NULL */
    node * destroy(node * head);
    /* print the elements of the integers in the list, one per line */
    void print(node * head);

## ex02

Implemente em C um programa que leia uma linha de caracteres e imprime `"yes"` se a linha for um palíndromo e imprima `"no"` no caso contrário.

*Dica:* Reutilize a lista ligada do `ex01`. Adicionalmente implemente as funções:

    int is_eq(node *h1 node *h2);   /* compara duas listas */
    node * rev(node * head)         /* devolve uma nova lista que corresponda a lista dada invertida */

## ex03

Implemente em C um programa que leia uma sequência de strings terminada pela string `"x"` e que imprime a mesma sequência mas invertida. Pode assumir que cada uma das strings não tem mais de 1000 caracteres.

*Dica:* Reutilize a solução do `ex01`. Não se esqueça de alocar e libertar a memória correctamente para as strings guardadas na lista. A lista deverá se representada por a estrutura seguinte.

    typedef struct stru_node {
        struct stru_node *next;
        char* s;
    } node;
