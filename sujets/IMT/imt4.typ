#import "@preview/diagraph:0.3.3":*
#import "@preview/algorithmic:0.1.0"
#import algorithmic: algorithm


#set page(
  paper: "a4",
  margin: (x:0.75in, y: 1in), 
  numbering: "1/1",
  footer: context [
  IMT-4
  #h(1fr)
  #counter(page).display(
    "1 of 1",
    both: true,
  )
]
)

#set heading(numbering: "I.a.1 - ")

#grid(columns: (4fr,2fr),[
#align(center, text(18pt)[Sujet IMT-4 ])
= Lois de de Morgan
Les règles de la logique intuitionniste :
],[#image("image-1.png",width:85%)])

#align(center,[#image("image.png",width: 85%)])
1. Deriver les séquents suivants à l'aide des règles de la logique intuitionniste (ci-dessus).
  - $not A or not B tack not (A and B)$
  - $¬(A ∨ ¬A) ⊢ ¬A$
2. Montrer que la regle RAA, permet de dériver le séquent du Tiers-exclu : $tack A or not A $ 

$ (Gamma,not A tack bot) / (Gamma tack A) ("RAA") $
On ajoute à la logique intuitionniste l'axiome du Tiers-exclu:
$ ()/(tack A or not A)("TE") $
3. Montrer que $not (A and B) tack not A or not B$ est dérivable. 

= Langages

*Définition*: 
Soit $L$ un langage sur $Sigma$, on définit la racine carrée de L, $sqrt(L) = {u in Sigma^*|u.u in L}$

*Définition*: Soit $A  = (Q, Sigma, q_0,F,delta)$ un automate fini déterministe complet. On définit $forall q in Q$, les automates finis $A_q$ tels que:
- les états de $A_q$ sont les couples $(q_i,q_j) in Q^2$
- l'état initial de $A_q$ est $(q_0,q)$
- les états terminaux de $A_q$ sont les $(q,q_f), forall q_f in F$
- On a  pour tout les $A_q$, la même fonction de transition $delta_2 : ((q_i,q_j),a) -> (delta(q_i,a), delta(q_j,a))$
1. Caractériser simplement $ cal(L)(A_q)$
2. Montrer que la racine carré d'un langage rationnel est rationnelle.

*Définition*:
Soit $L$ un langage sur $Sigma$, on définit  $1/2L = {u in Sigma^*|exists v in Sigma^*, |v| = |u| "et" u.v in L}$

3. Montrer que $1/2L$ est rationnel si $L$ l'est aussi.




