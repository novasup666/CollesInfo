%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Classe LaTeX pour les exercices des oraux MPI — CCINP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{ccinp}

\LoadClass[11pt,a4paper,oneside]{article}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mise en page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Gestion des marges
\usepackage[left=2cm,right=2cm,top=2cm,bottom=2cm]{geometry}

% En-tête
\usepackage{fancyhdr}
\pagestyle{fancy}

\lhead{\includegraphics[width=.1\textwidth]{image.png}}
\rhead{Épreuve orale d'informatique}

\headsep 35pt
% Suppression de l'indentation des paragraphes
\setlength{\parindent}{0pt}

% Ajout automatique d'espace entre les paragraphes
\usepackage{parskip}

% Gestion des listes, option permettant de renommer les items
\usepackage[shortlabels]{enumitem}

\newenvironment{bullets}
{\begin{itemize}
    \renewcommand{\labelitemi}{{$\bullet$}}
    \renewcommand{\labelitemii}{{$\star$}}
    \renewcommand{\labelitemiii}{{$\circ$}}
}
{\end{itemize}}

% Permet des mettre le contenu sur plusieurs colonnes, en particulier
% dans une liste
\usepackage{multicol}

% Gestion des couleurs
\usepackage[dvipsnames]{xcolor}
\usepackage{colortbl}

% Gestion de la numérotation des exercices
\newcounter{exocntr}
\newcommand{\exocommand}[1]{\stepcounter{exocntr} \textbf{Exercice \arabic{exocntr}} #1}

% Titre d'un exercice
\newcommand{\exercice}[1]{\section*{Exercice de type #1}}

% Pour la correction
\usepackage{comment}
\newenvironment{correction}{\newpage\begin{center}\textbf{Correction}\end{center}}
{}

% Commentaires pour le jury
\newcommand{\jury}[1]{\textcolor{MidnightBlue}{\textsl{#1}}}

% Barème
\newcommand{\pt}[1]{\textcolor{Mahogany}{\textbf{[#1 pt]}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Texte
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Gestion du texte
%\usepackage[french]{babel}
\usepackage{polyglossia}
\setdefaultlanguage{french}
\usepackage{fontspec}

\newcommand{\og}{\guillemotleft\xspace}
\newcommand{\fg}{\guillemotright\xspace}

% Gestion de symboles étoilés
\usepackage{bbding}
% Permet de barrer du texte
\usepackage[normalem]{ulem}

\usepackage{xspace}

% Gestion des liens
\usepackage[colorlinks=true, urlcolor=blue]{hyperref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mathématiques
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{amssymb}
\usepackage{amsthm}
\usepackage{amsmath}
\usepackage{amsfonts}
% Permet d'écrire les brackets pour les intervalles d'entiers
\usepackage{stmaryrd}
% pour faire des petits points notamment en diagonale vers le haut
\usepackage{mathdots}
% pour pouvoir faire le 1 des fonctions indicatrices.
\usepackage{bbold}

\usepackage{pifont}
\newcommand{\cmark}{\text{\ding{51}}\xspace}
\newcommand{\xmark}{\text{\ding{55}}\xspace}

\usepackage{eurosym}

% Gestion des arbres de preuve
\usepackage{ebproof}

% Gestion des tableaux
\usepackage{tabularray}

% Macros
\newcommand{\N}{\mathbb{N}\xspace}
\newcommand{\Z}{\mathbb{Z}\xspace}
\newcommand{\R}{\mathbb{R}\xspace}
%\newcommand{\C}{\mathbb{C}\xspace}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Graphiques et figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Inclusion d'images
\usepackage{graphicx}
% Pour les sous-figures
\usepackage{subfig}

% Création de figures
\usepackage{tikz}
% Options pour la création d'automates
\usetikzlibrary{automata, positioning, arrows, shapes.geometric}
% Options pour la créations de matrices élaborées
\usetikzlibrary{matrix}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Environnements personnalisés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Environnements perso colorés
\usepackage[framemethod=tikz]{mdframed}

% Environnement de mise en valeur générique, sans titre
\newenvironment{highlight-env}
{
  \mdfsetup{
    roundcorner=3pt,
    topline=true,
    leftline=true,
    bottomline=true,
    rightline=true,
    innertopmargin=4pt,
    innerbottommargin=4pt,
    innerrightmargin=4pt,
    innerrightmargin=6pt,
    innerleftmargin=6pt,
    innerlinewidth=1pt,
    backgroundcolor={gray!10},
    linecolor={black},
    linewidth=0.1pt,
  }
  \medskip
  \begin{mdframed}[]

  }{\end{mdframed}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Programmation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ocamlname}{\textsc{OCaml}\xspace}
\newcommand{\cname}{\textsc{C}\xspace}
\newcommand{\sqlname}{\textsc{SQL}\xspace}

% Gestion de la coloration syntaxique du code et pseudocode
\usepackage{minted}

% Minted Inline in C
\newmintinline[mic]{c}{style=friendly, breaklines=true, autogobble}
% Minted Inline in OCaml
\newmintinline[mio]{ocaml}{style=friendly, breaklines=true, autogobble}
% Minted Inline in SQL
\newmintinline[miq]{sql}{style=friendly, breaklines=true, autogobble}
% Minted Inline in bash
\newmintinline[mib]{bash}{style=friendly, breaklines=true, autogobble}

% Environnement d'encadrement du code
  \newenvironment{code-env}
{
  \mdfsetup{
    roundcorner=2pt,
    topline=true,
    leftline=true,
    bottomline=true,
    rightline=true,
    innertopmargin=4pt,
    innerbottommargin=4pt,
    innerrightmargin=4pt,
    innerlinewidth=1pt,
    backgroundcolor={gray!10},
    linecolor={gray!40},
    linewidth=0.1pt,
  }
  \begin{mdframed}[]
  }{\end{mdframed}}

% Environnements de code paramétrables (l'argument peut être notamment ocaml, c ou sql)
% Version encadrée sans numérotation des lignes
  \newenvironment{fancy-code}[1]
  {\VerbatimEnvironment
  \medskip
    \begin{code-env}
    \begin{minted}[
    style=friendly,
    %fontsize=\small,
    escapeinside=~~, % Le contenu entre deux ~ est échappé de l'environnement. ~ ne peux plus être tilisé
    mathescape=true,
    numbersep=0pt,
    autogobble,
    breaklines=true,
    xleftmargin=-2mm,
    framesep=1.5mm,
    linenos=false]{#1}}
 {\end{minted}\end{code-env}}

% Version encadrée avec numérotation des lignes
 \newenvironment{fancy-code-l}[1]
  {\VerbatimEnvironment
    \begin{code-env}{}
    \begin{minted}[
    style=friendly,
    %fontsize=\small,
    escapeinside=~~, % Le contenu entre deux ~ est échappé de l'environnement. ~ ne peux plus être tilisé
    mathescape=true,
    numbersep=5pt,
    autogobble,
    breaklines=true,
    framesep=1.5mm,
    xleftmargin=2pt,
    linenos=true]{#1}}
 {\end{minted}\end{code-env}}

% Version non encadrée sans numérotation de lignes
 \newenvironment{code}[1]
 {\VerbatimEnvironment
   \begin{minted}[
   style=friendly,
   %fontsize=\small,
   escapeinside=~~, % Le contenu entre deux ~ est échappé de l'environnement. ~ ne peux plus être tilisé
   mathescape=true,
   numbersep=5pt,
   autogobble,
   breaklines=true,
   framesep=1.5mm,
   xleftmargin=2pt,
   linenos=false]{#1}}
{\end{minted}}

% Version non encadrée avec numérotation de lignes
\newenvironment{code-l}[1]
{\VerbatimEnvironment
  \begin{minted}[
  style=friendly,
  %fontsize=\small,
  escapeinside=~~, % Le contenu entre deux ~ est échappé de l'environnement. ~ ne peux plus être tilisé
  mathescape=true,
  numbersep=5pt,
  autogobble,
  breaklines=true,
  framesep=1.5mm,
  xleftmargin=2pt,
  frame=leftline,
  linenos=true]{#1}}
{\end{minted}}

\newenvironment{ocode}{%
\VerbatimEnvironment
\begin{fancy-code}{ocaml}}{%
\end{fancy-code}}

\newenvironment{ccode}{%
\VerbatimEnvironment
\begin{fancy-code}{c}}{%
\end{fancy-code}}

\newenvironment{qcode}{%
\VerbatimEnvironment
\begin{fancy-code}{sql}}{%
\end{fancy-code}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Algorithmes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Environnement de pseudo-code (encadré, par défaut lignes numérotées)
\newenvironment{pcode-env}
{
  \IncMargin{0.6cm}
  \begin{algorithm}[H]
  \DontPrintSemicolon
  }{\end{algorithm}}

% Environnement de pseudo-code sans lignes
\newenvironment{pcode-nl-env}
  {
    \IncMargin{0.2cm}
    \LinesNumberedHidden
    \begin{algorithm}[H]
    \DontPrintSemicolon
    }{\end{algorithm}}

% Gestion du pseudo code (encadré, et lignes numérotées par défault)
\usepackage[french,boxed,linesnumbered]{algorithm2e}

% Renommage des mots clés pour le pseudo-code
% Commande générale \SetKwTruc{Motcle1}{Motcle2}{}...{mot affiché 1}{mot affiché 2}...{} avec Truc à retrouver dans la documentation de algorithm2e p31+ et p41+
\SetKwInput{In}{Entrée}
\SetKwInput{Out}{Sortie}
\SetKw{Return}{renvoyer}
\SetKwIF{If}{Elif}{Else}{si}{alors}{sinon si}{sinon}{}
\SetKwSwitch{Switch}{Case}{Default}{distinguer selon}{}{cas où}{autres cas}{}{}
\SetKwFor{For}{pour}{}{}
\SetKwFor{While}{tant que}{}{}

% Modifie le séparateur entre le titre et le nom de l'algo dans les légendes
\SetAlgoCaptionSeparator{-}
% Ajuste le blanc qui sépare le corps de l'algo et sa légende
\SetAlCapSkip{2mm}
% Modifie la fonte de la légende des algorithmes
\newcommand\stylelegende[1]{\textsc{#1}}
\SetAlCapSty{stylelegende}

% Modifie la fonte des conditions pour qu'elle soit normale au lieu d'italique par défaut
\SetArgSty{normaltext}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Préambule C
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\preambulec}{{\itshape Cet énoncé est accompagné d’un ou
    plusieurs codes compagnons en \cname fournissant certaines des
    fonctions mentionnées dans l’énoncé : il sont à compléter en y
    implémentant les fonctions demandées.

La ligne de compilation \mib{gcc -o main.exe -Wall *.c -lm} vous
permet de créer un exécutable \mib{main.exe} à partir du ou des
fichiers \cname fournis. Vous pouvez également utiliser l’utilitaire
\mib{make}. En ligne de commande, il suffit d'écrire \mib{make}. Dans
les deux cas, si la compilation réussit, le programme peut être
exécuté avec la commande \mib{./main.exe}.


Il est possible d'activer davantage d'avertissements et un outil
d'analyse de la gestion de la mémoire avec la ligne de compilation
\mib{gcc -o main.exe -g -Wall -Wextra -fsanitize=address *.c -lm} ou en écrivant
\mib{make safe}. L’examinateur pourra vous demander de compiler avec ces
options.

Si vous désirez forcer la compilation de tous les fichiers,
vous pouvez au préalable nettoyer le répertoire en faisant \mib{make clean}
et relancer une compilation.
}}

\newcommand{\preambuleocaml}{{\itshape Cet énoncé est accompagné d’un ou
  plusieurs codes compagnons en \ocamlname fournissant certaines des
  fonctions mentionnées dans l’énoncé : ils sont à compléter en y
  implémentant les fonctions demandées.
}}
