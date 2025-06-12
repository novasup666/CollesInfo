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

#align(center, text(18pt)[Sujet IMT-4 ])
#grid(columns:2,[
= Lois de de Morgan
Les règles de la logique intuitionniste :],[#align(center,[#image("image-1.png",width: 55%)])
])


#align(center,[#image("image-3.png",width: 85%)])

1. Deriver le séquent suivant à l'aide des règles de la logique intuitionniste (ci-dessus).
  - $¬(A ∨ ¬A) ⊢ ¬A$
2. Montrer que la regle RAA, permet de dériver le séquent du Tiers-exclu : $tack A or not A $ 

$ (Gamma,not A tack bot) / (Gamma tack A) ("RAA") $
On ajoute à la logique intuitionniste l'axiome du Tiers-exclu:
$ ()/(tack A or not A)("TE") $
3. Montrer que $not (A and B) tack not A or not B$ est dérivable. 




#align(right,[_Penser à tourner la feuille..._])
#pagebreak()
= Langages



*Définition*: 
Soit $L$ un langage sur $Sigma$, on définit la racine carrée de L, $sqrt(L) = {u in Sigma^*|u.u in L}$


On définit l'automate $A_0$ suivant :
#align(center,[#image("image-4.png",width:70%)])
0. Donner $sqrt(cal(L)(A_0))$.
*Définition*: Soit $A  = (Q, Sigma, q_0,F,delta)$ #footnote([
*Rappel*: Fonction de transition $delta$.

Pour $q,q' in Q$ et $a in Sigma$, on rappelle que :
$ delta(q,a)=q' <=> q->^a q' $

De plus pour $w = w_1...w_n in Sigma^*$ un mot fini quelconque (dont $w_i$ sont les lettres):
$ delta^*(q,w) = q' <=> q(->^*)^w q' $$ <=> exists (q_1,q_(n-1)) in Q^n, q->^(w_1)q_1 ->^(w_2)q_2 ... q_(n-1)->^(w_n)q' $

]) un automate fini déterministe complet. On définit $forall q in Q$, les automates finis $A_q$ tels que:
- les états de $A_q$ sont les couples $(q_i,q_j) in Q^2$
- l'état initial de $A_q$ est $(q_0,q)$
- les états terminaux de $A_q$ sont les $(q,q_f), forall q_f in F$
- On a  pour tout les $A_q$, la même fonction de transition $delta_2 : ((q_i,q_j),a) -> (delta(q_i,a), delta(q_j,a))$
1. Caractériser simplement $ cal(L)(A_q)$ (quels sont les mots appartenant à $cal(L)(A_q)$ ?).
2. Montrer que la racine carré d'un langage rationnel est rationnelle.






