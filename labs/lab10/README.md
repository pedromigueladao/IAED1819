# Estruturas Auto-referenciadas

## ex01

Implemente em C um programa que leia uma sequência de strings sem espaços terminada por a string `"x"` e imprima a mesma sequência, mas invertida. O programa deve ser implementado usando listas ligadas. Podem assumir que cada string tem no máximo 1023 caracteres. Entretanto, deve-se só alocar memória suficiente para as strings dadas.

A lista será representada pela seguinte estrutura:

    typedef struct stru_node {
        struct stru_node *next;
        char *v;
    } node;

e deverá ser manipulada pelas seguintes funções:

    /* remove the first element of the list and return the new head */
    node * pop(node * head);
    /* add string e as the first element of the list and return the new head */
    node * push(node * head, const char * e);
    /* frees all memory associated with the list and returns NULL */
    node * destroy(node * head);
    /* print the elements of the integers in the list, one per line */
    void print(node * head);

## ex02

Implemente em C um programa que leia uma linha de caracteres e guarda os caracteres numa lista __duplamente__ ligada.
Imprime `"yes"` se a linha for um palíndromo e imprima `"no"` no caso contrário.

A lista será representada pela seguinte estrutura:

    typedef struct str_node  {
        struct str_node * next, * previous;
        char c;
    } node;

    typedef struct  {
        struct str_node *  head, * last;
    } list;

e deverá ser manipulada pelas seguintes funções:

    list* mk_list(); /* cria nova lista vazia */
    void free_list(list* l); /* liberta toda a memoria associada a lista */
    void add_last(list* l, char c); /* adiciona o char c como o ultimo elemento da lista */
    void remove(list * l, char c); /* remove a primeira ocorrência de c na lista */
    int is_paly(const list * ls); /* calcula se a dada lista e um palindromo */

## ex03

Partindo da implementação da lista ligada no Exercício 3 do Lab 9, implemente as seguintes
funções para gerir uma tabela de dispersão com encadeamento externo:

    void ht_init(node **tab, unsigned long int m); /* inicializa a tabela */
    void ht_reset(node **tab, unsigned long int m); /* apaga todos os elementos da tabela */
    void ht_add(node **tab, unsigned long int m, char *s); /* adiciona a string s à tabela */
    void ht_delete(node **tab, unsigned long int m, char *s); /* apaga a string s da tabela */
    int ht_exists(node **tab, unsigned long int m, char *s); /* retorna diferente de 0 se s estiver na tabela*/

Considere a função de dispersão:

    static unsigned long djb2(char * str) {
        unsigned long hash = 5381;
        int c;
        while ((c = *str++))
            hash = ((hash << 5) + hash) + c; /* hash * 33 + c */
        return hash;
    }

Note que esta função retorna um `unsigned long` e não uma posição na tabela.

