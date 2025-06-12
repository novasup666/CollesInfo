#import "@preview/diagraph:0.3.3":*
#import "@preview/algorithmic:0.1.0"
#import algorithmic: algorithm

#set page(
  paper: "a4",
  margin: (x:0.75in, y: 1in), 
  numbering: "1/1",
  footer: context [
  IMT-7
  #h(1fr)
  #counter(page).display(
    "1 of 1",
    both: true,
  )
]
)

#set heading(numbering: "I.a.1 - ")

#align(center, text(18pt)[Sujet IMT-7 ])

= Verrou
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

1. Cet algorithme satisfait-il l'exclusion mutuelle ?

2. Modifier l'algorithme pour que cela constitue un verrou utilisable.

3. Montrer que cette nouvelle version garantit l'absence de famine. En déduire sur l'absence d'interblocage.
