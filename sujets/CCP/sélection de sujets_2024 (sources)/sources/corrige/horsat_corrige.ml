(*Première façon de représenter une FNC*)
type litteral = P of int | N of int
type clause = litteral list
type formule = clause list

let f1_horn = [[N 0; N 1; N 3]; [P 0; N 1]; [N 2; P 0; N 3]; [N 0; N 3; P 2]; [P 2]; [N 3; N 2]]
let f2_pas_horn = [[P 0; N 1]; [N 2; P 2; N 3; N 0]; [N 1]; [P 1; N 1; P 0]; [N 0; P 2]]

(** [est_horn f] vaut true si et seulement si [f] est une formule de Horn. La fonction auxiliaire nb_positifs compte le nombre de littéraux positifs dans une clause donnée.*)
let est_horn (f:formule) :bool =
  let rec nb_positifs (c:clause) :int = match c with
    |[] -> 0
    |(P _)::q -> 1 + nb_positifs q
    |_::q -> nb_positifs q
  in List.for_all (fun e -> e < 2) (List.map nb_positifs f)

let _ = est_horn f1_horn
let _ = est_horn f2_pas_horn

(*Deuxième façon de représenter une formule de Horn*)
type clause_horn = int option * int list
type formule_horn = clause_horn list

(** [trouver_clause_unitaire f] renvoie un int option valant None si il n'y a aucune clause unitaire dans [f] supposée être une formule de Horn correctement formée et Some i où i est le numéro d'une variable intervenant dans une clause unitaire *)
let rec trouver_clause_unitaire (f:formule_horn) :int option = match f with
  |[] -> None
  |(Some v,l)::q -> if l = [] then Some v else trouver_clause_unitaire q
  |_::q -> trouver_clause_unitaire q

(** Techniquement, ceci marcherait très bien vu le contexte car si il y a une clause vide qui apparaît, on peut interrompre les propagations. Mais ça ne remplit pas la spécification car il pourrait y avoir une clause unitaire ET une clause vide dans une même formule*)
let rec trouver_clause_unitaire_maligne (f:formule_horn) :int option = match f with
  |[] -> None
  |(p,l)::q -> if l = [] then p else trouver_clause_unitaire q


(*Correspond à f1_horn avec le nouveau formalisme*)
let f1_sat = [ (None, [0;1;3]); (Some 0, [1]); (Some 0, [2;3]); (Some 2, [0;3]); (Some 2, []); (None, [2;3])]
let f3_pas_sat = [(None, [1;4]); (Some 1, []); (None, [0;3;4]); (Some 0, [1]); (Some 2, [3;4]); (Some 4, [0;1])]

let _ = trouver_clause_unitaire f1_sat
let _ = trouver_clause_unitaire f3_pas_sat

(** [propager f v] calcule une formule de Horn dérivée de la formule supposée être de Horn [f] comme suit : dans chaque clause de [f], si la variable indicée par [v] intervient positivement la clause entière est supprimée et si elle intervient négativement, le littéral négatif correspondant est supprimé de la clause. La fonction enlever_neg prend en entrée une liste dont on suppose qu'elle contient au plus une fois la valeur [v] et supprime ladite valeur de cette liste le cas échéant*)
let rec propager (f:formule_horn) (v:int) :formule_horn =
  let rec enlever_neg (l:int list) :int list = match l with
    |[] -> []
    |t::q when t = v -> q
    |t::q -> t::(enlever_neg q)
  in
  match f with
  |[] -> []
  |(i,l)::q -> match i with
                 |Some t when t = v -> propager q v
                 |_ -> (i, enlever_neg l)::(propager q v)

let _ = propager f1_sat 2
let _ = propager f3_pas_sat 1

(** [avoir_clause_vide f] renvoie true ssi la formule de Horn [f] admet une clause vide. En particulier [f] n'est pas satifiable dans ce cas.*)
let rec avoir_clause_vide (f:formule_horn) :bool = match f with
  |[] -> false
  |t::q when t = (None, []) -> true
  |_::q -> avoir_clause_vide q

(** [etre_satisfiable f] renvoie true ssi la formule de Horn [f] est satisfiable*)
let rec etre_satisfiable (f:formule_horn) :bool =
  match (trouver_clause_unitaire f) with
  |None -> not (avoir_clause_vide f)
  |Some v -> etre_satisfiable (propager f v)

let _ = etre_satisfiable f1_sat
let _ = etre_satisfiable f3_pas_sat
let _ = etre_satisfiable []

