#import "@preview/diagraph:0.3.0": *
#import "@preview/algorithmic:0.1.0"
#import algorithmic: algorithm

#import "@preview/theorion:0.3.3": *
#import cosmos.fancy: *
// #import cosmos.rainbow: *
// #import cosmos.clouds: *
#show: show-theorion
#set text(lang: "fr")
#set page(
  header: align(left)[
    ENS1   #h(1fr)  S. Fosse et Pablo España Gutierrez

  ],
  footer: context [
  Oraux Blancs
  #h(1fr)
  #counter(page).display(
    "1 of 1",
    both: true,
  )
]
)

#set par(
  justify: true
)

#set text(
  font: "Linux Libertine",
)

#let named_equations(content, name) = {
  let numbering_func(it) = [(#name)];
  math.equation(block: true, numbering: numbering_func, content)
}

#v(0.5em)
#align(center, text(18pt)[Lemme de pompage ultime: Ehrenfeucht, Parikh et Rozenberg])
#v(0.5em)

On propose deux versions du lemme de l'étoile pour les langages réguliers. Soit $L$ un langage régulier. Alors $L$ vérifie les deux lemmes suivants:

#lemma[Il existe $N>=0$ tel que, pour tout mot $x in L $ avec $|x|>= N$, il existe une décomposition $x = u_1u_2u_3$ avec $u_2 != epsilon $ telle que $forall n in NN ,  u_1 u_2 ^n u_ 3 in L$] <lem:et1>

#lemma[ Il existe $N>=0$ tel que, pour tout mot $x in L $, pour toute décomposition $x = u v_1v_2 dots v_N w$ avec $forall 1<=i<=N, |v_i| >= 1$, il existe $0 <= j <k <= N$ tel que pour tout $n>=0$: $ u v_1 dots v_j (v_(j+1) dots v_k)^n  dots v_N w in L $ ] <lem:et2>



*Q0)* #h(0.25em) Soit $L = {u in {a,b}^* bar u "a le même nombre de " $a$ " que de b"}$. Montrez que $L$ vérifie le lemme 1 mais pas le lemme 2. 
#v(-0.6em)
_On ne s'attend pas à des preuves lourdement formelles pour cette question_

#v(1em)
On dit qu'un langage $L$ vérifie la propriété $sigma_k$
(respectivement $sigma_k '$) si pour tout mot $f in Sigma^*$
et toute factorisation $f = u v_1 dots v_k w$ dans laquelle 
chaque mot $v_i$ est non vide, il existe deux indices $i,j$ avec
$0 <= i < j <= k$ tels que :



#named_equations($
 forall n>= 0 #v(1em) [f in L <=> u v_1 dots v_i (v_(i+1) dots v_j)^n v_(j+1) dots v_k w in L] $, [$sigma_k$])

 #named_equations($
 f in L <=> u v_1 dots v_i v_(j+1)  dots v_k w in L $, [$sigma_k '$])

Nous allons montrer le résultat suivant, attribuée à Ehrenfeucht, Parikh et Rozenberg.

#proposition[Il existe une équivalence entre:
- (1) $L$ est régulier
- (2) Il existe $k>0$ tel que $L$ vérifie $sigma_k$
- (3) Il existe $k>0$ tel que $L$ vérifie $sigma_k '$]

*Q1)* #h(0.25em) Sans reprouver la dernière version du lemme de l’étoile, justifier rapidement que (1) implique (2) (penser
au langage complémentaire) et que (2) implique (3).

*Q2)*#h(0.25em) On note, pour tout mot $v in Sigma^*$, $v^(-1)L = {u bar u.v in L}$. Montrer que si $L$ vérifie $sigma_k '$, alors, pour tout mot $ v in Sigma^*$, $v^(-1)L$ vérifie aussi $sigma_ k '$.

On cherche à montrer que pour tout entier non nul $k$, il existe un nombre fini de langages vérifiant $sigma_k '$. Soient $L_1$ et $L_2$ deux tels langages. Pour ce faire, nous invoquons le théorème de Ramsey qui sera admis ici. On note $P_p (E)$ les parties à $p$ élèments de E. 

#theorem(title: "Théorème de Ramsey")[Pour tout triplet d’entiers $(p, m, r)$, il existe un entier $N (p, m, r)$, tel que pour tout :

- ensemble $E$ tel que $|E| ≥ N (p, m, r)$,

-  ensemble $C$ tel que $|C| = m$,
-  fonction $f : P_p (E) → C$,

il existe $F ⊂ E$ tel que :

- $|F | ≥ r$,
- $|f (P_p (F ))| ≤ 1$.]

*Q3)*#h(0.25em) À quoi vous fait penser ce théorème pour les valeurs $p = 1$ et $r = 2$ (avec $m$ quelconque) ? Donner une telle valeur $N (1, m, 2)$ minimale.

*Q4)*#h(0.25em) Montrer qu’il existe un entier que l’on notera $N$ tel que pour tout ensemble $P$ de paires de $[|1,N|]$, il
existe un sous-ensemble $F_P$ de $[|1,N|]$ de cardinal au moins $k + 1$ dont ses paires sont soit toutes dans $P$ , soit toutes hors de $P$.

*Q5)*#h(0.25em) En utilisant la question précédente, montrer que pour tout mot $f$ de taille au moins $N$, il existe une factorisation $f = u v_1 dots v_k w$, où tous les mots $v_i$ sont non vides, telle que pour tous $0 <= i < j <= k$:

$ f in L_1 <=> u v_1 dots v_i v_(j+1) dots v_k w in L_1 $

*Q6)*#h(0.25em) Montrer par récurrence sur la taille des mots que, si les mots de taille au plus $N$ de $L_1$ sont exactement les mots de taille au plus $N$ de $L_2$, alors $L_1 = L_2$.

*Q7)*#h(0.25em) En déduire que, pour un $k$ donné, il existe un nombre fini de langages vérifiant $sigma_k '$.

*Q8)*#h(0.25em) Conclure que $L$ est régulier et achever la preuve du lemme de pompage ultime, à l'aide du théorème suivant:

#theorem(title: "Théorème de Myhill-Nerode")[On note, pour un langage $L$, l'ensemble de ses résiduels $E = {u^(-1)L bar u in Sigma^*}$. Alors:

$ L "est régulier" <=> |E| < infinity $ ]

*Q9)*#h(0.25em) Démontrer le sens direct du théorème de Myhill-Nerode.

*Q10)* #h(0.25em) Démontrer le sens indirect.