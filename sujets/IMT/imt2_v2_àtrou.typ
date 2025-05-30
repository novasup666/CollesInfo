#import "@preview/diagraph:0.3.3":*
#import "@preview/algorithmic:1.0.0"
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

=  Verrous à n fils d'exécution


== Un premier verrou

On considère le pseudo-code suivant (avec ``` get_thread_id()``` -> l'identifiant du fil courant).

#grid(columns: (1fr,1fr),[ 

  #algorithm({
  import algorithmic: *
  Function("CreateLock", (), {
    Return[{turn = 0, busy = false}]
  })
  })

  #algorithm({
  import algorithmic: *
  Function("Unlock", ("l",), {
    Assign[$l."busy"$][false]
  })
  })
],[
 
  #algorithm({
  import algorithmic: *
  Function("Lock", ("m","t"), {
    Assign[me][``` get_thread_id()```]
    Repeat($"not" l."busy"$,{Assign[$l."turn"$][me]})
    Assign[$l."busy"$][true]
  })
  })
])

1. Ce protocole garantit-il l'exclusion mutuelle ?

On propose une autre version de la fonction Lock :

  #algorithm({
  import algorithmic: *
  Function("Lock",($m$,$t$), {
    Assign[me][``` get_thread_id ()```]
    Repeat($l."turn" = "me"$, {
      Repeat($"not" l."busy"$,{
        Assign[$l."turn"$][$"me"$]
      })
      Assign[$l."busy"$][$"true"$]
    })
   
  })
  })

2. Ce nouveau protocole garantit-il l'absence d'interblocage ?
3. Que dire de l'exclusion mutuelle ?
== Boulangerie de Lamport
4. Expliquer précisemment le fonctionnement de l'algorithme de la boulangerie de Lamport.

5. Compléter (au tableau) le pseudo-code ci-dessous.

#grid(columns: (1fr,1fr),[ 

  #algorithm({
  import algorithmic: *
  Function("CreateLock", args: (), {
    Assign[want][false,...,false]
    Assign[ticket][0,...,0]
    Return[{want,ticket}]
  })
  })

  #algorithm({
  import algorithmic: *
  Function("Unlock", args: ("m","i"), {
    Assign[$m."want"[i]$][...]
  })
  })
],[
 
  #algorithm({
  import algorithmic: *
  Function("Lock", ("m","i"), {
    Assign[$m."want"[i]$][...]
    Assign[$m."ticket"[i]$][...]
    While(cond : [$exists j, m."want"[j] = "true" and (...) $],[...])
  })
  })
])

6. Montrer que l'algorithme de la boulangerie de Lamport satisfait l'absence d'interblocage.
7. ... respecte l'ordre "FIFO". Qu'en déduire sur l'absence de famine ?
8. ... satisfait l'exclusion mutuelle.