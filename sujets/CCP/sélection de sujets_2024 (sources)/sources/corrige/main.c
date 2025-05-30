#include<stdbool.h>
#include<stdint.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

/* 
   La directive #define est hors programme. Nous l'utilisons ici pour
   définir des valeurs pour des variables qui serviront à déclarer des tableaux de taile variable
   La taille est fixée à la compilation
*/
#define N 37  // taille maximale d'une chaine de caractere dans le programme

// structure pour la definition d'une liste chainee
struct liste_s {
    char chaine[N];
    struct liste_s * suivant;
}; 


uint64_t fact(int n) {
    uint64_t r = 1;
    for(int i = 2; i <= n; i = i + 1){
        r = r * i;
    }
    return r;
}

// Fonction pour calculer le nombre de catalan n
// ENTREE : n - le nombre pour lequel on veut calculer
// SORTIE : le nombre de catalan cherche
uint64_t catalan1(int n) {
    return fact(2*n)/fact(n+1)/fact(n);
}

// Fonction pour calculer le nombre de catalan n (avec une simplification de la formule)
// ENTREE : n - le nombre pour lequel on veut calculer
// SORTIE : le nombre de catalan cherche
uint64_t catalan2(int n) {
    uint64_t r = 1; 
    for (int i = n + 2; i <= 2*n; i = i + 1){
        r = r * i;
    }
    return r / fact(n);
}

// Fonction verifier que la chaine passee en parametre contient un mot bien parenthese
// ENTREE : mot - le mot a tester
// SORTIE : true si le mot est bien parenthese, false sinon
bool verification(char * mot) {
    int i = 0;
    bool fin = false;
    int compteur = 0;
    bool resultat = false;
    while (!fin && (mot[i] != '\0')) {
        if (mot[i]=='(') {
            compteur++;
        }
        else if (mot[i] == ')') {
            compteur = compteur - 1;
        }
        if (compteur<0) {
            fin = true;
        }
        i = i + 1;
    } 
    if (compteur == 0) {
        resultat = true;
    }    
    return resultat;
}


// Fonction pour afficher les chaines de parentheses bien formees 
// Vous pouvez utiliser char chaine[101] si vous préférez
// ENTREE : s - la chaine de caracteres courante
// ENTREE : o - le nombre de parentheses ouvertes
// ENTREE : f - le nombre de parentheses fermees
// ENTREE : n - le nombre de couples de parentheses voulu
// ENTREE : r - le nombre de mots bien parentheses
void dyck(char s[N], int o, int f, int n, uint64_t* r, struct liste_s ** liste) {
    if (f == n) {
        if (liste != NULL) {
            struct liste_s * c = malloc(sizeof(struct liste_s));
            strcpy(c->chaine, s);
            c->suivant = *liste;
            *liste = c;
        } 
        else {  
            printf("%s\n", s);
        }
        (*r) = (*r) + 1;
        return;
    }
    if (o<n) {
        // printf("on ajoute (\n");
        char res[N];
        strcpy(res, s);
        strcat(res, "(");
        dyck(res, o+1, f, n, r, liste);
    } 
    if (f<o) {
        // printf("on ajoute )\n");
        char res[N];
        strcpy(res, s);
        strcat(res, ")");
        dyck(res, o, f+1, n, r, liste);
    }
}

// point d'entree du programme
int main(void) {
    printf("--- Premiers nombres de Catalan avec factorielle :\n");
    for(int i = 0; i< 30; i = i + 1){
        printf("C(%d)=%lu\n", i, catalan1(i));
    }
    printf("--- Premiers nombres de Catalan avec une simplification :\n");
    for(int i = 0; i< 30; i = i + 1){
        printf("C(%d)=%lu\n", i, catalan2(i));
    }
    printf("Quelques verifications de mots : \n");
    printf("'((()())())' est bien parenthesee : %d\n", verification("((()())())"));
    printf("')(()())()(' est bien parenthesee : %d\n", verification(")(()())()("));
    printf("'((())())))' est bien parenthesee : %d\n", verification("((())())))"));
    uint64_t nbmots = 0;
    char chaine[N] = ""; 
    int  n = 5;
    printf("--- Affichage des mots bien parentheses a %d couples de parentheses\n", n);
    dyck(chaine, 0, 0, n, &nbmots, NULL);
    printf("Nombre :%lu\n", nbmots);
    return 0;
}
