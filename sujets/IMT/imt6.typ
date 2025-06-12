#import "@preview/diagraph:0.3.3":*
#import "@preview/algorithmic:0.1.0"
#import algorithmic: algorithm


#set page(
  paper: "a4",
  margin: (x:0.75in, y: 1in), 
  numbering: "1/1",
  footer: context [
  IMT-6
  #h(1fr)
  #counter(page).display(
    "1 of 1",
    both: true,
  )
]
)

#set heading(numbering: "I.a.1 - ")



#grid(columns: (1fr,1fr),

[ 


#align(center, text(18pt)[Sujet IMT-6 ])



= Automates



On considère l'automate $cal(A)$ ci-contre.

1. Déterminiser et compléter l'automate.
2. Donner une expression régulière dénotant $cal(L)(cal(A))^C$.


],[ #align(center,[#raw-render(```
digraph G {
  rankdir=LR
q_0
q_2
q_1
q_3 [shape = "doublecircle"]
q_0 -> q_1 [label = "epsilon"]
q_0 -> q_2 [label = "a"] 
q_2 -> q_1 [label = "a"]
q_1 -> q_2 [label = "a"]
q_2 -> q_3 [label = "b"]
q_1 -> q_3 [label = "b"]
q_3 -> q_2 [label = "epsilon"]
}
```,
math-mode: "math"
)])

])



= Décidabilité
*Définition*: _PCP_ 
- Soit $ Sigma$ un alphabet tel que $|Sigma|>=2$
- Soit $N in NN$
- Soit $alpha_1,...,alpha_N$ et $beta_1,...,beta_N$ de listes de mots (finis) sur $Sigma$.
Existe-t-il une suite $(i_k)_(1<k<K) in [|1,N|]^K$ avec $K in NN^*$ tels que $alpha_i_1...alpha_i_K = beta_i_1... beta_i_K $ ?

On admet que PCP est *indécidable*.


1. Que dire des instances suivantes ?
  + Soit $Sigma = {a,b}$
    - $(alpha_i) = "a","ab","bba"$
    - $(beta_i) = "baa","aa","bb"$
  + Soit $Sigma = {a,b}$
    - $(alpha_i) = "a","ab","bba"$
    - $(beta_i) = "baa","bb","aa"$
  + Soit $Sigma = {a,b,c}$
    - $(alpha_i) = "a","b","c"$
    - $(beta_i) = "bac","ca","bca"$    

2. Exhiber un algorithme donnant pour tout instance l'existence d'une solution (de taille bornée).

*Définition*: _INTER-G_

Soit (G,G') un couple de grammaires sans contextes, existe-t-il un mot $w$ engendré par les deux grammaires ?

3. Quel est le type du problème _INTER-G_ ?

Soit $N in NN$. Soit $Sigma$ l'alphabet sur lequel sont définies $(u_k)_(0<k<=N)$ et $(v_k)_(0<k<=N)$ deux listes de mots. Soit $ Alpha = {a_1,...,a_(N)}$ des caractères disjoints de $Sigma$ (càd $Sigma \u{2229} A =  emptyset$). On définit les langages suivant:

- $L_U = union.big_(n in NN){a_i_0..a_i_(n-1)u_i_(n-1)...u_i_0 | forall k in [|0,n-1|], i_k in [|1,N|]}$
- $L_V = union.big_(n in NN){a_i_0..a_i_(n-1)v_i_(n-1)...v_i_0 | forall k in [|0,n-1|], i_k in [|1,N|]}$

4. Montrer que $L_U$ et $L_V$ sont des langages algébriques.
5. Montrer que _INTER-G_ est indécidable.
