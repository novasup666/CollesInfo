#import "@preview/diagraph:0.3.3":*
#import "@preview/algorithmic:0.1.0"
#import algorithmic: algorithm


#set page(
  paper: "a4",
  margin: (x:0.75in, y: 1in), 
  numbering: "1/1",
  footer: context [
  IMT-2
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


#align(center, text(18pt)[Sujet IMT-2 ])



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

=  Verrous


0. Rappeler les conditions que doit satisfaire un verrou utilisable.

== Deux fils d'éxecution
L'objectif est de créer un verrou pour deux fils d'execution.

=== Un premier essai

#grid(columns: (1fr,1fr),[ 

  #algorithm({
  import algorithmic: *
  Function("CreateLock", args: (), {
    Return[${"flag" = ["false","false"]}$]
  })
  })

  #algorithm({
  import algorithmic: *
  Function("Unlock", args: ("m","t"), {
    Assign[$m."flag"[t]$][false]
  })
  })
],[
 
  #algorithm({
  import algorithmic: *
  Function("Lock", args: ("m","t"), {
    Assign[other][$1-t$]
    While(cond : [$m."flag"["other"]$],[nothing])
    Assign[$m."flag"[t]$][true]
  })
  })
])

1. Cet essai satisfait-il l'exclusion mutuelle ?

=== Une autre méthode

#grid(columns: (1fr,1fr),[ 

  #algorithm({
  import algorithmic: *
  Function("CreateLock", args: (), {
    Return[${"turn" = 0}$]
  })
  })

  #algorithm({
  import algorithmic: *
  Function("Unlock", args: ("m","t"), {
    Assign[$m."turn"$][$1-t$]
  })
  })
],[
 
  #algorithm({
  import algorithmic: *
  Function("Lock", args: ("m","t"), {
    Assign[other][$1-t$]
    While(cond : [$m."turn" == "other"$],[nothing])
  })
  })
])

2. Cet essai satisfait-il l'exclusion mutuelle ?
3. Que dire de l'absence d'interblocage ?

=== Encore une autre méthode

#grid(columns: (1fr,1fr),[ 

  #algorithm({
  import algorithmic: *
  Function("CreateLock", args: (), {
    Return[{turn = 0, want = {false,false}}]
  })
  })

  #algorithm({
  import algorithmic: *
  Function("Unlock", args: ("m","t"), {
    Assign[$m."turn"$][$1-t$]
    Assign[$m."want"[t]$][false]

  })
  })
],[
 
  #algorithm({
  import algorithmic: *
  Function("Lock", args: ("m","t"), {
    Assign[other][$1-t$]
    Assign[m.turn][t]
    Assign[m.want[t]][true]
    While(cond : [$m."turn" == "other" and m."want"["other"]$],[nothing])
  })
  })
])

4. Cet essai satisfait-il l'exclusion mutuelle ?

5. Modifier cette version pour que cela constitue un verrou utilisable.

6. Montrer qu'elle garantit l'absence de famine. En déduire sur l'absence d'interblocage.

== Plusieurs fils d'execution
7. Nommer et décrire précisemment un algorithme permettant un verou pour n fils d'éxecution.
