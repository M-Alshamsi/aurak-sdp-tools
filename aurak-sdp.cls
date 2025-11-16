%% aurak-sdp.cls
%% Copyright 2025 Mohammed Alshamsi
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Mohammed Alshamsi.
%
% This work consists of the file aurak-sdp.cls.



%%%%%%%%%%%%%%%%%%%%
%% IDENTIFICATION %%
%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
% Remember to change the date whenever the class is updated
\ProvidesClass{aurak-sdp}[2025-11-16 AURAK Senior Design Project Report]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PRELIMINARY DECLARATIONS %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[letter,twoside]{report}

%%%%%%%%%%%%%
%% OPTIONS %%
%%%%%%%%%%%%%

% maybe someday we'll have actual options here

\DeclareOption*{\ClassWarning{aurak-sdp}%
  {Unknown option \CurrentOption}%
  {Remove or correct it please!}%
}
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%
%% MORE DECLARATIONS %%
%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\chaptitle}{} % need to define it for later

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BIBLIOGRAPHY

\RequirePackage{csquotes}
\RequirePackage[backend=biber, giveninits, defernumbers=true]{biblatex}
\DeclareFieldFormat[article]{title}{\mkbibquote{#1}} % make article titles in quotes
\DeclareFieldFormat[thesis]{title}{\mkbibemph{#1}} % make theses italics
\DeclareBibliographyCategory{cited}
\AtEveryCitekey{\addtocategory{cited}{\thefield{entrykey}}}
\renewcommand*{\bibfont}{\footnotesize}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% DIMENSIONS

\RequirePackage[inner=1.5cm,top=3.5cm,bottom=2cm,marginpar=4.5cm,totalwidth=\dimexpr\paperwidth-3cm\relax,includemp]{geometry}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FLOATS AND SUCH

\RequirePackage{float}
\RequirePackage{tabularray}
\RequirePackage{subcaption}
\RequirePackage{caption}
\DeclareCaptionFont{gray3}{\color{gray3}}
\RequirePackage[strict]{changepage}
\RequirePackage{environ}

\newlength{\widefigwidth}
\NewEnviron{widefig}[1][h]{% can't figure out a way to do this with the usual \newenvironment
  \setlength{\widefigwidth}{\dimexpr\textwidth+\marginparwidth+\marginparsep\relax}
  \begin{figure}[#1]
    \checkoddpage%
    \edef\side{\ifoddpage l\else r\fi}%
    \makebox[\textwidth][\side]{%
      \begin{minipage}[t]{\dimexpr\textwidth+\marginparwidth+\marginparsep\relax}% same as \headwidth
        \BODY%
      \end{minipage}%
    }%
  \end{figure}%
}

\NewEnviron{widetbl}[1][h]{
  \setlength{\widefigwidth}{\textwidth}
  \begin{table}[#1]
    \checkoddpage%
    \edef\side{\ifoddpage l\else r\fi}%
    \makebox[\textwidth][\side]{%
      \begin{minipage}[t]{18cm}% same as \headwidth
        \BODY
      \end{minipage}
    }
  \end{table}
}

% the way this is done necessitates use of \captionof{figure} instead of \caption.
% optional argument is a vertical offset to the figure.
\NewEnviron{marginfig}[1][0pt]{
  \vspace*{#1}
  \marginpar{
    \begin{minipage}[t]{\marginparwidth}
      \BODY
    \end{minipage}
  }
  \vspace*{-#1}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FONTS

% Math
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}

% Improves typesetting quality
\RequirePackage{microtype}

% Fonts and language
\RequirePackage{fontspec}
\RequirePackage[english]{babel}
\setmainfont[Numbers=OldStyle]{CMU Concrete}
\newcommand{\lining}{\addfontfeature{Numbers=Lining}}

% use Euler math font
\RequirePackage[euler-digits,OT1]{eulervm}

% Fix math operators like gcd and mod
\DeclareSymbolFont{operators}{\encodingdefault}{\familydefault}{m}{n}

% slightly-letter-spaced lmr. good for uppercase headers
\newfontfamily\lslmr{Latin Modern Roman}[LetterSpace=5]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% GRAPHICS

\RequirePackage{graphicx}

\RequirePackage{xcolor}

% The "accent color" for the document
\definecolor{accent}{RGB}{140, 140, 140}
\definecolor{accentlite}{RGB}{210, 130, 100}
\definecolor{accentliter}{RGB}{210, 180, 175}
\definecolor{titlepagecolor}{rgb}{0,0,0}

% What color to use for citation hyperlinks
\definecolor{cite}{RGB}{0, 0, 96}

% Nice drawings
\RequirePackage{pgf}
\RequirePackage{tikz}
\usetikzlibrary{positioning}
\usetikzlibrary{calc}
\usetikzlibrary{fadings}
\usetikzlibrary{decorations.text}
% graphs
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HEADINGS

\RequirePackage{titlesec}

\newcommand*{\studentstatement}{%
\pagestyle{stat}
\pdfbookmark[0]{Students' Statement}{ss}
\begin{center}
  \fontfamily{lmr}\selectfont\textbf{STUDENTS' STATEMENT}
\end{center}
}
\newcommand*{\supervisorcertification}{%
\pagestyle{cert}
\pdfbookmark[0]{Supervisor Certification}{sc}
\begin{center}
  \fontfamily{lmr}\selectfont\textbf{SUPERVISOR CERTIFICATION}
\end{center}
}
\newcommand*{\acknowledgement}{%
\pagestyle{ack}
\pdfbookmark[0]{Acknowledgement}{ack}
\begin{center}
  \fontfamily{lmr}\selectfont\textbf{ACKNOWLEDGEMENT}
\end{center}
}
\renewcommand*{\abstract}{%
\pagestyle{abs}
\pdfbookmark[0]{Abstract}{abs}
{
\centering
  \fontfamily{lmr}\selectfont\textbf{ABSTRACT}
\par
}
}

\AddToHookWithArguments{cmd/chapter/before}{%
  \clearpage{\thispagestyle{empty}\cleardoublepage}
  \pagecolor{gray4}
}

\newcommand{\chapterpageheader}{\MakeUppercase{\chaptertitlename}\ \thechapter\\\MakeUppercase{\chaptitle}}

\newenvironment{chapterpage}[1][\chapterpageheader]{%
  \clearpage
  \pagestyle{empty}
  \pagecolor{gray7}
  \color{gray3}
  {\hfill
  \begin{minipage}{12cm}
  \begin{flushright}
    \raggedleft\fontfamily{lmr}\selectfont\Huge\sffamily\bfseries\hyperlink{toc}{#1}
  \end{flushright}
  \end{minipage}
  }\par\vskip1pc
  \captionsetup{labelfont=gray3}
  \renewcommand\thefootnote{\textcolor{gray3}{\arabic{footnote}}}
  \fontsize{12}{15}\selectfont
  \noindent
  \ignorespaces
}{%
  \clearpage
}

\AddToHook{env/chapterpage/after}{%
  \color{black}
  \pagecolor{white}
  \pagestyle{headings}
  \fontsize{12}{15}\selectfont
}

\AddToHook{cmd/appendix/after}{%
  \titleformat{\chapter}[display]%
    {% Format for both title and label:
    }
    {% Label format:
      \lslmr\color{gray8}\rlap{\scalebox{5}{$APPENDIX\ \thechapter$}}\hspace{10cm}%
    }{% Distance between label and title:
      0pt
    }{% Commands run before title:
      \begin{minipage}{12cm}
      \raggedright\Huge\sffamily\bfseries\color{gray9}\MakeUppercase
    }[% Commands run after title:
      \vspace*{\fill}
      \end{minipage}
    ]

  \AddToHook{cmd/chaptermark/after}{%
    \pagenumbering{arabic}
    \renewcommand*\thepage{\thechapter--\arabic{page}}
  }

  \renewcommand{\chapterpageheader}{\MakeUppercase{\chaptertitlename}\ \thechapter\\\MakeUppercase{\chaptitle}}
}

\newcommand{\bibchapter}{%
  \clearpage{\thispagestyle{empty}\cleardoublepage}
  \pagecolor{gray4}
  \thispagestyle{empty}
  \phantomsection\label{chap:bibliography}
  \addcontentsline{toc}{chapter}{Bibliography}
  {\color{gray8}\rlap{\scalebox{5}{$BIBLIOGRAPHY$}}\hspace{10cm}}
  \clearpage
  \renewcommand{\chapterpageheader}{BIBLIOGRAPHY}
}

\newcommand{\frchapter}{%
  \clearpage{\thispagestyle{empty}\cleardoublepage}
  \pagecolor{gray4}
  \phantomsection
  \thispagestyle{empty}
  \phantomsection\label{chap:furtherreading}
  {\color{gray8}\rlap{\scalebox{5}{\begin{minipage}{\textwidth}$FURTHER $\\[-.3em]$READING$\end{minipage}}}\hspace{10cm}}
  \addcontentsline{toc}{chapter}{Further Reading}
  \clearpage
  \renewcommand{\chapterpageheader}{FURTHER READING}
}

% Alter spacing above and below headings.
% This is dependent mainly on the line skip, and secondarily on font size.
% See the \fontsize after \begin{document}. first number is font size, second is line skip:
%   \fontsize{12}{15}\selectfont
% The space above and below a section heading must sum to a multiple of baselineskip,
% but manual adjustment is necessary based on font size and usage of \normalsize, \large, etc.
% I worked out something decent here, but if you mess with
% the sizes of the headings, you might need to adjust these numbers.
\titlespacing*{\chapter}{0pt}{0pt}{15pt}
\titlespacing*{\section}{0pt}{24.9pt}{7.5pt}
\titlespacing*{\subsection}{0pt}{10.5pt}{7.5pt}
\titlespacing*{\subsubsection}{0pt}{10.5pt}{7.5pt}
\titlespacing*{\paragraph}{0pt}{7.5pt}{1.4ex minus 0.2ex} %

% From titlesec documentation:
\newcommand{\periodafter}[1]{#1.}

\titleformat{\chapter}[display]%
{% Format for both title and label:
}
{% Label format:
  \lslmr\color{gray8}\rlap{\scalebox{5}{$CHAPTER\ \thechapter$}}\hspace{10cm}%
}{% Distance between label and title:
  0pt
}{% Commands run before title:
  \begin{minipage}{12cm}
  \raggedright\Huge\sffamily\bfseries\color{gray9}\MakeUppercase
}[% Commands run after title:
  \vspace*{\fill}
  \end{minipage}
]

\titleformat{\section}[hang]{\large\bfseries}{\makebox[1.5cm]{\lslmr\thesection\hfill}}{0pt}{\lslmr\MakeUppercase}

\titleformat{\subsection}[hang]{\normalsize\bfseries}{\makebox[1.5cm]{\lslmr\thesubsection\hfill}}{0pt}{\lslmr\MakeUppercase}

\titleformat{\subsubsection}[hang]{\normalsize\bfseries}{\makebox[1.5cm]{\lslmr\thesubsubsection\hfill}}{0pt}{\lslmr\MakeUppercase}
% Note: makebox width must not depend on font size, so don't use em, ex, etc.

\titleformat{\paragraph}[runin]{\bfseries}{}{0pt}{\fontfamily{lmr}\selectfont\periodafter}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HEADERS AND FOOTERS

\RequirePackage[headings]{fancyhdr}
\RequirePackage[bottom]{footmisc}

% Color headrule
\RequirePackage{xpatch}
\let\origheadrule\headrule
\xpretocmd\headrule{\color{accent}}{}{\PatchFailed}
\xpretocmd\footrule{\color{accent}}{}{\PatchFailed}

% Make the footnote line longer
\renewcommand{\footnoterule}{%
  \kern -3pt
  {\color{accent}\hrule width \textwidth height 0.4pt}
  \kern 2pt
}

% default \rightmark and \leftmark are like this:
%     \chaptername\ \thechapter. #1
%     \thesection. #1
% This is wrong: the space after the period is wider than usual
% since TeX treats it like a sentence-ending period
\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\slshape\chaptername\ \thechapter.\ #1}}{}\renewcommand{\chaptitle}{#1}}
\renewcommand{\sectionmark}[1]{\markright{\MakeUppercase{\slshape\thesection.\ #1}}}

%\setlength{\headheight}{43.60004pt}
\setlength{\headsep}{25pt}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.0pt}

% Adapted from https://tex.stackexchange.com/a/69149
\def\cleardoublepage{
  \newgeometry{inner=2.5cm,outer=2.5cm,top=2.5cm,bottom=4.5cm}
  \if@twoside
    \ifodd\c@page\else
      \vspace*{\fill}
      \hfill
      \begin{center}
        \fontfamily{lmr}\selectfont\itshape\color{accent}This page intentionally left blank
      \end{center}
      \vspace{\fill}
      \vspace{\fill}
      \thispagestyle{empty}
      \if@twocolumn\mbox{}\newpage\fi
    \fi
  \fi
  \restoregeometry
}

\fancypagestyle{abs}{%
  \fancyhf{}%
  \fancyhfoffset[OL,ER]{1cm}
  \fancyhfoffset[EL,OR]{1cm}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.0pt}
  \def\headrule{\origheadrule}
  \fancyhead[ER]{\fontfamily{lmr}\selectfont\slshape{ABSTRACT}}
  \fancyhead[OL]{\fontfamily{lmr}\selectfont\slshape{ABSTRACT}}
  \fancyhead[EL]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
  \fancyhead[OR]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
}

\fancypagestyle{ack}{%
  \fancyhf{}%
  \fancyhfoffset[OL,ER]{1cm}
  \fancyhfoffset[EL,OR]{1cm}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.0pt}
  \def\headrule{\origheadrule}
  \fancyhead[ER]{\fontfamily{lmr}\selectfont\slshape{ACKNOWLEDGEMENT}}
  \fancyhead[OL]{\fontfamily{lmr}\selectfont\slshape{ACKNOWLEDGEMENT}}
  \fancyhead[EL]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
  \fancyhead[OR]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
}

\fancypagestyle{cert}{%
  \fancyhf{}%
  \fancyhfoffset[OL,ER]{1cm}
  \fancyhfoffset[EL,OR]{1cm}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.0pt}
  \def\headrule{\origheadrule}
  \fancyhead[ER]{\fontfamily{lmr}\selectfont\slshape{SUPERVISOR CERTIFICATION}}
  \fancyhead[OL]{\fontfamily{lmr}\selectfont\slshape{SUPERVISOR CERTIFICATION}}
  \fancyhead[EL]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
  \fancyhead[OR]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
}

\fancypagestyle{stat}{%
  \fancyhf{}%
  \fancyhfoffset[OL,ER]{1cm}
  \fancyhfoffset[EL,OR]{1cm}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.0pt}
  \def\headrule{\origheadrule}
  \fancyhead[ER]{\fontfamily{lmr}\selectfont\slshape{STUDENTS' STATEMENT}}
  \fancyhead[OL]{\fontfamily{lmr}\selectfont\slshape{STUDENTS' STATEMENT}}
  \fancyhead[EL]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
  \fancyhead[OR]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
}

% \tableofcontents command uses \thispagestyle, apparently,
% so this mitigates that behavior.
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{toc}}}

\fancypagestyle{toc}{%
  \fancyhf{}%
  \fancyhfoffset[OL,ER]{1cm}
  \fancyhfoffset[EL,OR]{1cm}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.0pt}
  \def\headrule{\origheadrule}
  \fancyhead[ER]{\fontfamily{lmr}\selectfont\slshape{TABLE OF CONTENTS}}
  \fancyhead[OL]{\fontfamily{lmr}\selectfont\slshape{TABLE OF CONTENTS}}
  \fancyhead[EL]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
  \fancyhead[OR]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
}

\fancypagestyle{lot}{%
  \fancyhf{}%
  \fancyhfoffset[OL,ER]{1cm}
  \fancyhfoffset[EL,OR]{1cm}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.0pt}
  \def\headrule{\origheadrule}
  \fancyhead[ER]{\fontfamily{lmr}\selectfont\slshape{LIST OF TABLES}}
  \fancyhead[OL]{\fontfamily{lmr}\selectfont\slshape{LIST OF TABLES}}
  \fancyhead[EL]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
  \fancyhead[OR]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
}

\fancypagestyle{lof}{%
  \fancyhf{}%
  \fancyhfoffset[OL,ER]{1cm}
  \fancyhfoffset[EL,OR]{1cm}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.0pt}
  \def\headrule{\origheadrule}
  \fancyhead[ER]{\fontfamily{lmr}\selectfont\slshape{LIST OF FIGURES}}
  \fancyhead[OL]{\fontfamily{lmr}\selectfont\slshape{LIST OF FIGURES}}
  \fancyhead[EL]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
  \fancyhead[OR]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
}

\fancypagestyle{los}{%
  \fancyhf{}%
  \fancyhfoffset[OL,ER]{1cm}
  \fancyhfoffset[EL,OR]{1cm}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.0pt}
  \def\headrule{\origheadrule}
  \fancyhead[ER]{\fontfamily{lmr}\selectfont\slshape{LIST OF SYMBOLS AND ABBREVIATIONS}}
  \fancyhead[OL]{\fontfamily{lmr}\selectfont\slshape{LIST OF SYMBOLS AND ABBREVIATIONS}}
  \fancyhead[EL]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
  \fancyhead[OR]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
}

\fancypagestyle{empty}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0.0pt}
  \renewcommand{\footrulewidth}{0.0pt}
  \def\headrule{\origheadrule}
}

\fancypagestyle{plain}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.0pt}
  \def\headrule{%
    \ifodd\value{page}\relax\else\origheadrule\fi}%
}

\fancypagestyle{headings}{%
  \fancyhf{}
  \fancyhfoffset[RE,LO]{0cm}
  \fancyhfoffset[RO,LE]{\dimexpr\marginparwidth+\marginparsep\relax}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.0pt}
  \fancyhead[ER]{\fontfamily{lmr}\selectfont\slshape\leftmark}
  \fancyhead[OL]{\fontfamily{lmr}\selectfont\slshape\rightmark}
  \fancyhead[EL]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
  \fancyhead[OR]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
  \def\headrule{\origheadrule}
}

\fancypagestyle{bib}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.0pt}
  \def\headrule{\origheadrule}
  \fancyhead[ER]{\fontfamily{lmr}\selectfont\slshape{BIBLIOGRAPHY}}
  \fancyhead[OL]{\fontfamily{lmr}\selectfont\slshape{BIBLIOGRAPHY}}
  \fancyhead[EL]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
  \fancyhead[OR]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
}

\fancypagestyle{fr}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.0pt}
  \def\headrule{\origheadrule}
  \fancyhead[ER]{\fontfamily{lmr}\selectfont\slshape{FURTHER READING}}
  \fancyhead[OL]{\fontfamily{lmr}\selectfont\slshape{FURTHER READING}}
  \fancyhead[EL]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
  \fancyhead[OR]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
}

\fancypagestyle{gl}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.0pt}
  \def\headrule{\origheadrule}
  \fancyhead[ER]{\fontfamily{lmr}\selectfont\slshape{GLOSSARY}}
  \fancyhead[OL]{\fontfamily{lmr}\selectfont\slshape{GLOSSARY}}
  \fancyhead[EL]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
  \fancyhead[OR]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
}

\fancypagestyle{idx}{%
  \fancyhf{}%
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0.0pt}
  \def\headrule{\origheadrule}
  \fancyhead[ER]{\fontfamily{lmr}\selectfont\slshape{INDEX}}
  \fancyhead[OL]{\fontfamily{lmr}\selectfont\slshape{INDEX}}
  \fancyhead[EL]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
  \fancyhead[OR]{\fontfamily{lmr}\selectfont\bfseries\color{black}\thepage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% INDEX

\RequirePackage{imakeidx}

\begin{filecontents*}{style.ist}
heading_prefix "{\\bfseries\\hfil "
heading_suffix "\\hfil}\\nopagebreak\n"
headings_flag 1
\end{filecontents*}

\indexsetup{level=\section*,firstpagestyle=idx}
% TODO: 48 is ballpark, figure it out later
\makeindex[columns=2, title={\vspace*{-48pt}}, options = -s style]

% page 4 of https://www.ams.org/arc/tex/howto/index/0index-notes.pdf
% useful little hack that allows referring to a synonymous entry
% "zzzzz@" makes the "see also <other entry>" always be at the bottom
\providecommand{\indexalso}[3]{%
\index{#1!zzzzz@\emph{\alsoname} {#2}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% LISTS

\RequirePackage{enumitem}

% From https://tex.stackexchange.com/a/412247
\begin{filecontents*}{padnum.lua}
function padnum ( digits , n)
  tex.sprint ( string.format ( "%0"..digits.."d" , n ) )
end
\end{filecontents*}
\directlua{dofile("padnum.lua")}
\newcommand\padnum[2][4]{\directlua{padnum(#1,#2)}}

\newlist{reql}{enumerate}{5}

\newenvironment{req}[2]{%
  \begingroup
  \setlist[reql]{label=\textbf{\texttt{[#1}\,\texttt{\padnum[#2]{\expandafter\csname thereqli\endcsname}]}},leftmargin=*,labelindent=2em,labelsep=*,itemindent=!,itemsep=0em}
  \setlist[reql,2]{label=\textbf{\texttt{[#1}\,\texttt{\padnum[#2]{\arabic{reqli}}.\arabic{reqlii}}]}}
  \setlist[reql,3]{label=\textbf{\texttt{[#1}\,\texttt{\padnum[#2]{\arabic{reqli}}.\arabic{reqlii}.\arabic{reqliii}}]}}
  \setlist[reql,4]{label=\textbf{\texttt{[#1}\,\texttt{\padnum[#2]{\arabic{reqli}}.\arabic{reqlii}.\arabic{reqliii}.\arabic{reqliv}}]}}
  \setlist[reql,5]{label=\textbf{\texttt{[#1}\,\texttt{\padnum[#2]{\arabic{reqli}}.\arabic{reqlii}.\arabic{reqliii}.\arabic{reqliv}.\arabic{reqlv}}]}}
  % ^ I don't know if there's a better way of doing this :>
  % I'll leave it for another day.
  \begin{reql}
}{%
  \end{reql}
  \endgroup
}

\newenvironment{urq}[1]{\begingroup\begin{req}{UF}{#1}}{\end{req}\endgroup}
\newenvironment{urn}[1]{\begingroup\begin{req}{UN}{#1}}{\end{req}\endgroup}
\newenvironment{srq}[1]{\begingroup\begin{req}{SF}{#1}}{\end{req}\endgroup}
\newenvironment{srn}[1]{\begingroup\begin{req}{SN}{#1}}{\end{req}\endgroup}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TOC, LOF, LOT

\RequirePackage{tocloft}
\RequirePackage[nohints]{minitoc}
\setcounter{minitocdepth}{2}
\mtcsettitle{minitoc}{}

% Stylize chapter and section numbers, titles, dots, page numbers in contents.
\renewcommand{\cftchapfont}{\fontfamily{lmr}\selectfont\bfseries}
\renewcommand{\cftsecfont}{\normalfont\small}
\renewcommand{\cftfigfont}{\normalfont\small}
\renewcommand{\cfttabfont}{\normalfont\small}
\renewcommand{\cftsecdotsep}{\cftnodots}
\renewcommand{\cftsubsecdotsep}{\cftnodots}
\renewcommand{\cftchapleader}{\hskip0.5em\cftdotfill{\cftdotsep}\hskip0.5em}
\renewcommand{\cftdot}{\rule[2pt]{1pt}{0.4pt}}
\renewcommand{\cftdotsep}{0}
\renewcommand{\cftchappresnum}{\fontfamily{lmr}\selectfont\large\bfseries}
\renewcommand{\cftsecpresnum}{\fontfamily{lmr}\selectfont\bfseries}
\renewcommand{\cftfigpresnum}{\fontfamily{lmr}\selectfont\bfseries}
\renewcommand{\cfttabpresnum}{\fontfamily{lmr}\selectfont\bfseries}
\renewcommand{\cftchappagefont}{\fontfamily{lmr}\selectfont\large\bfseries}
\renewcommand{\cftsecpagefont}{\small\lining}
\renewcommand{\cftfigpagefont}{\small\lining}
\renewcommand{\cfttabpagefont}{\small\lining}
\renewcommand{\@tocrmarg}{2em}
\renewcommand{\@pnumwidth}{2em}
% Hide subsections.
\setcounter{tocdepth}{1}
% Style toc, lof, lot headers.
\renewcommand{\cfttoctitlefont}{\normalfont\fontfamily{lmr}\selectfont\bfseries}
\renewcommand{\cftloftitlefont}{\normalfont\fontfamily{lmr}\selectfont\bfseries}
\renewcommand{\cftlottitlefont}{\normalfont\fontfamily{lmr}\selectfont\bfseries}
% Push toc/lof/lot headers up a bit.
\renewcommand{\cftbeforetoctitleskip}{-12pt}
\renewcommand{\cftbeforeloftitleskip}{-12pt}
\renewcommand{\cftbeforelottitleskip}{-12pt}
% Remove some of the gap between headers and the lists.
\renewcommand{\cftaftertoctitleskip}{0pt}
\renewcommand{\cftafterloftitleskip}{0pt}
\renewcommand{\cftafterlottitleskip}{0pt}

\AddToHook{cmd/tableofcontents/before}{%
\newgeometry{inner=2.5cm,outer=2.5cm,top=3.5cm,bottom=2cm}
\thispagestyle{toc}
\clearpage
\hypertarget{toc}{}
\renewcommand\contentsname{\centering TABLE OF CONTENTS\par}
\pdfbookmark[0]{Table of Contents}{toc}
}
\AddToHook{cmd/tableofcontents/after}{%
\thispagestyle{toc}
\renewcommand{\cftdot}{}
}

\AddToHook{cmd/listoftables/before}{%
\renewcommand{\listtablename}{\centering LIST OF TABLES\par}
\addtocontents{lot}{{\fontfamily{lmr}\selectfont\bfseries Table}~\hfill{\fontfamily{lmr}\selectfont\bfseries Page}\par}
\phantomsection
\addcontentsline{toc}{chapter}{List of Tables}
}
\AddToHook{cmd/listoftables/after}{%
\thispagestyle{lot}
}

\AddToHook{cmd/listoffigures/before}{%
\renewcommand{\listfigurename}{\centering LIST OF FIGURES\par}
\addtocontents{lof}{{\fontfamily{lmr}\selectfont\bfseries Figure}~\hfill{\fontfamily{lmr}\selectfont\bfseries Page}\par}
\phantomsection
\addcontentsline{toc}{chapter}{List of Figures}
}
\AddToHook{cmd/listoffigures/after}{%
\thispagestyle{lof}
}

\newcommand{\listofsymbolshdr}{%
\vspace*{-25pt}% Same as \cftbeforelottitleskip and so on.
\begin{center}{\fontfamily{lmr}\selectfont\textbf{LIST OF SYMBOLS AND ABBREVIATIONS}}
\phantomsection
\addcontentsline{toc}{chapter}{List of Symbols and Abbreviations}
\end{center}
\thispagestyle{los}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TITLE PAGE

\DeclareFixedFont{\titlefont}{T1}{ppl}{b}{it}{0.5in}

% Title page is where you can really put in a personal touch to the report.
% Get creative, replace this with anything. E.g., you can put the project logo.
% If you use a TikZ graphic, be sure to keep the "overlay" key; it's necessary.
\newcommand\titlepagedecoration{%
\begin{tikzpicture}[remember picture,overlay,shorten >= -10pt]
  \node[opacity=0.2] (lol) [below = 11cm of current page.north]
    {\scalebox{12}{\sffamily\slshape l\,o\,g\,o}};
\end{tikzpicture}%
}

\newcommand\titlepageauraklogo{%
\begin{tikzpicture}[remember picture,overlay,shorten >= -10pt]
  \node[opacity=0.6] (lol) [below = 1cm of current page.north]
  {\includegraphics[scale=0.4]{aurak-logo-full-low-quality}};
\end{tikzpicture}%
}

\newcommand*{\printallstudents}{%
  Name (ID)\par
  Name (ID)\par
  Name (ID)\par
  Name (ID)\par
  Name (ID)\par
  Name (ID)\par
}

% Except for \fulltitle, these should be re-def'd by the author.
\def\projtitle{Project Title Project Title Project Title}
\def\shorttitle{Short Title}
\def\fulltitle{\shorttitle: \projtitle}
\def\coursecode{ABCD\,123}
\def\prof{Prof.\@ Whom Ever}
\def\uni{A Certain University Somewhere}
\def\school{A Certain School of Something}
\def\dept{A Certain Department of Something or Other}
\def\yr{2024--2025}

\renewcommand*{\maketitle}{
  \renewcommand\thepage{Cover}
  \begin{titlepage}
    \titlepagedecoration
    \titlepageauraklogo
    \sffamily
    \begin{flushleft}
      \begin{Large}
        \scalebox{3.6}{\textbf\shorttitle}

        \let\otw\textwidth
        \setlength{\textwidth}{0.8\otw}
        {\projtitle}\\
      \end{Large}
      {\textit{A Senior Design Project}}

      \vfill

      Supervised by \prof\hfill\\[1ex]
      Date: \monthname[\month] \the\year\\[1ex]

      \begin{minipage}{0.45\textwidth}
        \large
        \printallstudents
      \end{minipage}
    \end{flushleft}

    \noindent\hrulefill

    \footnotesize
    \noindent Submitted in partial fulfillment of the requirements of the B.Sc.\@ Degrees
    in Computer Science, Computer Engineering, and Artificial Intelligence
    at the \dept{} in the \uni.
  \end{titlepage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MISC

% Multiple columns, useful for lists with very small items
\RequirePackage{multicol}
% Currently used for WBS dictionary
\RequirePackage{mdframed}

\RequirePackage{datetime}

% Make bold text a little wider.
% Applies to Latin Modern, and not Concrete.
\renewcommand\bfdefault{bx}

% For typesetting code (might not be the best option).
\RequirePackage{fancyvrb}
\fvset{
  numbers=left,
  fontsize=\small
}

% Hyperlinks.
\RequirePackage{hyperref}
\hypersetup{
  colorlinks=true,
  linkcolor=.,
  linktoc=all,
  filecolor=magenta,
  urlcolor=accent,
  citecolor=cite
}
\urlstyle{same}

\newcommand*{\frontmatter}{%
\thispagestyle{empty}
\vspace*{\fill}
\hfill
\begin{center}
  \fontfamily{lmr}\selectfont\itshape\color{accent}This page intentionally left blank
\end{center}
\vspace{\fill}
\vspace{\fill}
\thispagestyle{empty}
\mbox{}
\clearpage
\pagenumbering{roman}
\cleardoublepage
\newgeometry{inner=2.5cm,outer=2.5cm,top=3.5cm,bottom=2cm}
\fontsize{12}{15}\selectfont
}
\newcommand*{\mainmatter}{%
\adjustmtc[3] % Offset because of lists of figures, tables, and symbols
\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}
\cleardoublepage
\pagenumbering{arabic} % Needed immediately before ch1, i.e., here
\renewcommand{\cftsecfont}{\fontfamily{lmr}\selectfont\bfseries\color{gray3}}
\renewcommand{\mtcSfont}{\color{gray3}}
\renewcommand{\cftdot}{\rule[2pt]{1pt}{0.4pt}}
\renewcommand{\cftsubsubsecfont}{\itshape\footnotesize}
\setlength{\cftsubsubsecindent}{\dimexpr\cftsecindent+\cftsubsecindent+1.5\parindent\relax}
\renewcommand{\cftsubsubsecdotsep}{\cftnodots}
\renewcommand{\cftsecdotsep}{0}
\renewcommand{\cftsecleader}{\hskip0.5em\cftdotfill{\cftdotsep}\hskip0.5em}
}
