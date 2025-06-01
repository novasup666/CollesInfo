#set page(
  paper: "a4",
  margin: (x:0.75in, y: 1in), 
  numbering: "1/1",
  header: align(left)[
    TD4   #h(1fr)  Samuel Fosse & Noé Vincent

  ],
  footer: context [
  Langages formels et calculabilité  #h(1fr)
  #counter(page).display(
    "1 de 1",
    both: true,
  )
]
)

#align(center, text(18pt)[Lemme de pompage ultime: Ehrenfeucht, Parikh et Rozenberg])

#set heading(numbering: "1.")

= Question 0

Informellement, la version du lemme 1 ne marche pas car on n'a aucun contrôle sur le mot du milieu qui va être répété: celui ci peut contenir autant de a que de b, et donc le répéter donne uniquement des mots dans le langage.

On peut uriliser le lemme 2 sur $a^N b^N$ par exemple, en posant $u = a ^N$ et $v_i = b$ pour $i$ allant de 1 à $N$.
= Question 1

- Justifions d'abord que (1) implique (2). D'après la dernière version du lemme de l'étoile, il existe $k in NN$, tel que pour tout mot $f in L$ et toute factorisation $f = u v_1 ... v_k w$ (avec les $v_i$ non vides), on a l'existence de $0 <= i < j <= k$ tels que:

$ forall n >= 0, u v_1 ... v_i (v_(i+1) ... v_j)^n v_(j+1) ... v_k w in L $.
 
 Comme $L$ est régulier, son complementaire $overline(L)$ l'est aussi, donc on dispose de $k' in NN$ tel que pour tout mot $f in overline(L)$ et toute factorisation $f = u v_1 ... v_(k') w$ (avec les $v_i$ non vides), on a l'existence de $0 <= i < j <= k'$ tels que: 
 
 $ forall n >= 0, u v_1 ... v_i (v_(i+1) ... v_j)^n v_(j+1) ... v_(k') w in overline(L) $

 Ainsi, en prenant $K = max(k, k')$, pour tout mot $f in Sigma^*$, avec $f = u v_1 ... v_K w$ (les $v_i$ étant non vides):

 - Soit $f in L$ et dans ce cas il existe $0<= i < j <= k <= K'$ tels que $forall n >= 0, u v_1 ... v_i (v_(i+1) ... v_j)^n v_(j+1) ... v_k w in L$. 
 - Sinon, $f in overline(L)$ et alors il existe $0<= i < j <= k' <= K'$ tels que $forall n >= 0, u v_1 ... v_i (v_(i+1) ... v_j)^n v_(j+1) ... v_k w in overline(L)$.
 Dans les deux cas, il existe $0<= i < j <= K'$ tels que $forall n >= 0, f in L <=> u v_1 ... v_i (v_(i+1) ... v_j)^n v_(j+1) ... v_k w in L$, ce qui conclut la démonstration.

- Pour montrer que (2) implique (3), il suffit de remplacer $n$ par $0$ dans la définition de $sigma_k$.
 
 



= Question 2
Soit L vérifiant $sigma_k^'$. Soit $x in Sigma^*$ , on considère $L' = x^(-1)L$. 

Soit $y in L'$, on a $f=x y in L$. 

Soit $y = u v_1... v_k w$ une décomposition quelconque de y dans laquelle les mots $v_i$ sont non vides. L vérifiant $sigma_k^'$, on a:
$ f = x y in L <=> x u v_1... v_k w in L $

Et donc il existe $i,j: 0<= i < j <= k$, tel que:
$ x u v_1 ... v_i v_(j+1) ... v_k w in L $
D'où :
$   u v_1 ... v_i v_(j+1) ... v_k w in x^(-1)L $


On a donc bel et bien $x^(-1)L$ qui vérifie $sigma_k^'$.

= Question 3
Pour des valeurs $p=1$ et $r=2$, ce théorême ressemble au lemme des tiroirs (ou des pigeonniers). En effet, on peut voir $f$ comme une fonction qui à chaque élément de $E$ associe un "tiroir", et le théorème indique qu'il y a au moins deux éléments de $E$ distincts qui ont la même image par $f$, c'est-à-dire qui sont dans le même "tiroir". On propose donc $N(1,m,2) = m+1$.


= Question 4

On suppose qu'une paire est un ensemble et donc différente d'un couple par l'exclusion du cas de paire d'élements égaux : 
$ x in X, (x,x) in X^2, {x,x}= {x} in.not cal(P)_2(X) $

En considérant le triplet $(p = 2, m = 2, r = k+1)$, le théorême de Ramsey donne l'existence de $M = N(2,2,k+1)$ tel que:

Pour tout:
- E un ensemble, $|E| >= M$.
- C un ensemble, $|C|  = 2$.
- F une fonction, $f: P_(2) -> C$.

il existe $F subset E$ tq:
- $|F| >= k+1$.
- $|f(P_2 (R))|<=1$.

Donc en particulier en posant :
 - $E = [1,M]$, qui est bien un ensemble de cardinal $>= M$.
 - $C = {0,1}$, qui est bien un ensemble de cardinal 2.
 - $f: {u,v} in cal(P)_2(E) |-> bb(1)_(P) (u,v) in C$.

On a l'existence de $F_P subset [1,M]$ tel que:
- $|F_P| >= k+1$
- $|f(P_2(F_P))| <= 1$
 
Ainsi pour $F subset E$, $|f(F)|<= 1$ correspond au fait que toutes les paires de $F$ appartiennent à P ou aucune n'y appartient: $f(F) = {1}$ ou $f(F)={0}$.

= Question 5

Soit $f = f_1 f_2 ... f_n in Sigma^*$ avec $n = |f| >= N$. On pose 
$ P = {(i,j) in [|1;n-1|]^2, i < j bar f_1 ... f_i f_(j+1) ... f_n in L_1 } $
Alors il existe un sous-ensemble $F_P$ de $[|1;N|]$ de taille au moins (k + 1) tel que toutes les paires dans cet ensemble sont soit toutes dans $P$, soit toutes en dehors de $P$. De fait, en considérant un $F'_P subset F_P$ de taille exactement $(k+1)$, on dispose d'un ensemble de cardinal $(k+1)$ dont les paires sont soit toutes dans $P$, soit toutes en dehors de $P$. 

Notons $(a_1, ..., a_(k+1))$ les éléments $F'_P$ dans l'ordre croissant, et posons: 

$ forall i < k+1\, v_i = f_(a_i + 1) ... f_(a_(i+1)) $
$ u = f_1 ... f_(a_1) $
$ w = f_(a_(k+1) + 1) ... f_n $

et considérons la décomposition $ f = u v_1 ... v_k w$. On remarque que les mots $v_i$ sont bien non-nuls. Par construction, soit toutes les paires dans $F'_P$ sont dans P et dans ce cas $ forall i,j: 0 <= i < j <= k, u v_1 ... v_i v_(j+1) ... v_n in L_1 $, soit $forall i,j: 0 <= i < j <= k, u v_1 ... v_i v_(j+1) ... v_n in.not L_1$. 

Montrons l'équivalence de l'énoncé. Soit $0 <= i < j <=k$.

- *Sens direct*: Soit f in $L_1$. Comme $L_1$ vérifie $sigma'_k$, on a l'éxistence de $0<= i' < j' <= k$ tel que $u v_1 ... v_i' v_(j'+1) ... v_n in L_1$. Ainsi une paire de $F'_P$ est dans $P$, et donc toutes les paires le sont. Donc $u v_1 ... v_i v_(j+1) ... v_n in L_1$.

- *Sens indirect*: Supposons que $u v_1 ... v_i v_(j+1) ... v_n in L_1$. Alors $forall 0 <= i' < j' <= k, u v_1 ... v_i' v_(j'+1) ... v_n in L_1$. En particulier, d'après $sigma'_k$, il existe $0 <= i' < j' <= k$ tel que si $u v_1 ... v_i' v_(j'+1) ... v_n in L_1$ alors $f in L_1$. Donc $f in L_1$.


= Question 6
Remarquons d'abord, que le résultat de la question 5 sur $L_1$ est  aussi valable pour $ L_2$.

Soit $L_n = {u in L, |u|<=n+N}$

Soit $P_n$:
$ L_(1,n) = L_(2,n) $


Montrons que $L_1 = L_2$ en montrant que $forall n in NN$, $P_n$ est vérifiée, par récurrence sur $n$.

*Initialisation*: 

On sait que les mots de taille au plus N de $L_1$ sont exactement les mots de taille au plus N de $L_2$. Ainsi, $P_0$ est vérifiée.

*Hérédité*:

Soit $n in NN $, on suppose $P_n$ vérifiée. Montrons que $P_(n+1)$ est vérifiée.

Soit $f in L_(1,n+1)\\L_(1,n)$, on a $ f in L_1 $ donc par Q5, on a l'existence d'une factorisation: $f = u v_1...v_k w$ avec $ k >= N$ telle que:
$ forall i,j: 0<=i<j<=k, u v_1...v_i v_(j+1)...v_k w in L_1 $

Ainsi,$ forall i,j: 0<=i<j<=k$:
$ |f| > |f_(i,j) = u v_1...v_i v_(j+1)...v_k w| $
On a donc, $forall i,j: 0<=i<j<=k, f_(i,j) in L_(1,n) = L_(2,n)$, par hypothèse de récurrence.

Cependant, le résultat de la question 5 s'applique aussi à $L_2$. Or 

$ forall i,j: 0<=i<j<=k, f_(i,j) in L_(2,n) subset L_2 $

D'où, $ f in L_2 $ De plus $|f|<=N+n+1$ donc $f in L_(2,n+1)$.

Ainsi, $L_(1,n+1) subset L_(2,n+1)$, par le raisonnement symétrique, on a que $L_(2,n+1) subset L_(1,n+1)$ donc:

$ L_(1,n+1) = L_(2,n+1) $

On a donc montré, par récurrence, que $forall n in NN, L_(1,n) = L_(2,n)$, ainsi, $ L_1 = L_2 $

= Question 7
Soit $k in NN$.

Sur un alphabet fini, le nombre de mots de longueur inferieure ou égale à N est fini.

Ainsi $cal(P)({u in Sigma^*, |u|<=N})$ est un ensemble fini. 

Or Q6 donne l'égalité entre les langages vérifiant $sigma _k^'$  et dont les ensembles de mots de taille inférieures à N sont les mêmes.

Le nombre de ces ensembles étant fini, les langages vérifiant $sigma_k^'$ sont en nombre fini.

= Question 8

D'après la question 2, tous les langages résiduels de $L_1$ sont dans $sigma_k$. D'après la question 7, il y a un nombre fini de langages vérifiant $sigma_k '$. Donc $L_1$ a un nombre fini de résiduels, puis, d'après le théorème de Myhill-Nerode, $L_1$ est rationnel. 