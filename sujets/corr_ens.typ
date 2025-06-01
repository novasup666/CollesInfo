#import "@preview/diagraph:0.3.0":*
#import "@preview/algorithmic:0.1.0"
#import algorithmic: algorithm


#set page(
  paper: "a4",
  margin: (x:0.75in, y: 1in), 
  numbering: "1/1",
  footer: context [
  IMT-1
  #h(1fr)
  #counter(page).display(
    "1 of 1",
    both: true,
  )
]
)

#align(center, text(18pt)[Sujet IMT-1 ])
#set heading(numbering: "I.a.1 - ")

+ trivial
+ trivial
+ parfait: 3-clique (triangle), imp. minimal : 5-cycle
+ (Pas la seule preuve, des preuves par l'absurde peuvent passer)

  On note $G' = G[v\\ A]$

  On a que:



  $forall k in [|2,chi|]$ : 

  Si il existe une partition en $chi -k $ anticliques de $V\\A$.
  Alors on a une partition en $chi -k + 1$ anticliques de V. (en ajoutant A). Donc $forall k in [|2,chi|]$, on a:

  $ chi'> chi -k $

  Donc : 
  
  $ chi' > chi -2 $

  Donc $ chi' >= chi-1 $

  D'où:

  $ chi -1 <= chi' <= chi "         "(1) $
  
  $ omega ' <= omega "                     "(2) $

  
  G' étant parfait: $chi' = omega '$ et   G étant imparfait: 
  $ chi > omega$

  Par $(1)$, on a $ omega -1 < chi -1 <= chi' = omega ' <= chi $

  d'où : 
  $ omega -1 < omega' $

  Ainsi : 
   $ omega <= omega ' $

  Par $(2)$, on a  : $ omega = omega' $

+ $forall v in A_0$, on peut découper $G' = G[V\\{v}]$ en $omega = omega ' = chi'$ anticliques. (car G' parfait). Ce qui forme nos $alpha +1$ anticliques.

  Chaque sommet v de $A_0$ seront présent dans $A_0$ et dans $alpha -1$ autre cliques (une parmis celles formée par $G\\v'$ et ce pour les $alpha -1$ valeurs de $v'$ différentes de $v$). 

  Les sommets qui ne sont pas dans $A_0$ seront présent dans une clique parmis celles formées par $G\\v'$ et ce pour les $alpha$ valeurs de $v' in A_0$.

+ $C_i$ = clique maximale de $V\\ A_i$. trivialement $C_i inter A_i = emptyset$
  
  $C_i$ etant une clique il ne peut pas y avoir un $j$ tq $|A_j inter C_i|>2$ Or les $omega$ élements de $C_i$ sont tous présents dans $alpha$ anticliques différentes donc $forall j != i, |A_j inter C_i| = 1$.

+ indice : regarder la gueule de la matrice

+ et questions suivantes: si le candidat est arrivé là, il saura continuer.
