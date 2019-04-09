## ex01

Implementa um programa em C que leia uma palavra do standard input e imprima todos os sufixos da palavra, um por linha do mais compido para o menos comprido.  Por exemplo, para "abc" o output deve ser:

    abc
    bc
    c

Podem supor que a palavra não tenha mais que 80 caracteres.

*Dica:* Sugere se utilização de aritmética de ponteiros, para poder avançar com um ponteiro `p`  representado os sufixos e passar o `p` para `printf`.

## ex02
Desenvolve funções para manipular um stack com realocação automática. O stack será representado com a estrutura seguinte:

    typedef struct {
        int *v;  /* contents of the stack */
        int cap; /* capacity of v, i.e. how many elements v  can fit */
        int sz; /* number of elements currently stored in v */
    } stack;

As funções são as seguintes:

    void init(stack * s); /* initialize stack s as empty and with initial capacity 4 */
    void push(stack * s, int e); /* push e on top of the stack  (reallocate v if necessary) */
    int pop(stack * s); /* remove top element from stack and remove it (not necessary to reallocate v) */
    int is_empty(stack * s); /* return 1 iff s represents the empty stack, return 0 otherwise */
    void destroy(stack * s); /* frees memory associated with the stack */

*Nota:* Não há testes automáticos.

*Nota:* Podem considerar primeiro uma implementação sem a realocação automática.

## ex03

Implementa um programa que leia uma linha do standard input e decide se os parênteses são bem formatados;
considerando  os pares de parenteses `()`, `[]`, `{}`. Por exemplo, a string `"{[a]b(c)}()[]"` é bem formatada, a string `"(()"` não é.
Se o input é bem formatado, o programa imprima `"yes"` e no caso contrário `"no"`.

*Dica:* Podem aproveitar do ex02. Quando um parêntese abra, coloque-o no stack, quando fecha verifica se o topo é um "match" e tira.
No final stack tem que ficar vazio.

*Dica:* O input não é preciso guardar, é suficiente usar o stack.
