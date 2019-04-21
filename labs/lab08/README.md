# Ponteiros e Alocação Dinâmica de Memória

## ex01

Implemente um programa em C que leia uma palavra do standard input e que imprima todos os sufixos dessa palavra.
Deverá imprimir um sufizo por linha começando do mais comprido para o menos comprido.

Por exemplo, para o input `abc` o output deve ser:

    abc
    bc
    c

Poderá supor que a palavra nunca terá mais de 80 caracteres.

*Dica:* Sugere-se utilização de aritmética de ponteiros, para poder avançar com um ponteiro `p` representando os diferentes sufixos e passar esse ponteiro `p` como parÂmetro para a função `printf`.

## ex02

Desenvolva em C um conjunto de funções que permita manipular uma pilha (_stack_) com realocação automática. A pilha será representada com a seguinte estrutura:

    typedef struct {
        int *v;     /* contents of the stack */
        int cap;    /* capacity of v, i.e. how many elements can fit in v */
        int sz;     /* number of elements currently stored in v */
    } stack;

As funções a desenvolver são as seguintes:

    void init(stack * s);           /* initializes stack s as empty and with initial capacity 4 */
    void push(stack * s, int e);    /* pushes integer e on top of the stack  (reallocate v if necessary) */
    int pop(stack * s);             /* removes top element from the stack and return it
                                        (not necessary to reallocate v) */
    int is_empty(stack * s);        /* returns 1 iff s represents the empty stack, returns 0 otherwise */
    void destroy(stack * s);        /* frees the memory associated with the stack */

*Nota:* Não há testes automáticos para este exercício.

*Nota:* Poderá começar por considerar uma implementação sem a realocação automática.

## ex03

Implemente em C um programa que leia uma linha do standard input e verifica se os parênteses estão bem formatados, considerando os pares de parênteses `()`, `[]`, `{}`.

Por exemplo, a string `"{[a]b(c)}()[]"` é uma string bem formatada, enquanto a string `"(()"` não o é.
Se o input for bem formatado, o programa deverá imprimir `"yes"`, e no caso contrário deverá imprimir `"no"`.

*Dica:* Podem aproveitar o `ex02` para resolver este exercício. Quando encontrarem um parêntesis s abrir, coloque-o no stack; quando encontrar um parêntesis a fechar verifica se o topo é um "match" e retira-o da pilha.
No final a stack deverá ficar vazio.

*Dica:* Não é necessário guardar o input; é suficiente usar o stack.
