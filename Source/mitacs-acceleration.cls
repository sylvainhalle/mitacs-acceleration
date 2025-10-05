%% ------------------------
%% Déclarations
%% ------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mitacs-acceleration}[2025/10/05, Mitacs Acceleration V1.0 par Sylvain Hallé]

%% ------------------------
%% Vérifie qu'on compile avec lualatex
%% ------------------------
\newif\ifluatexengine
\ifdefined\directlua
  \luatexenginetrue
\else
  \luatexenginefalse
\fi
\ifluatexengine
  % LuaLaTeX detected: continue
\else
  \ClassError{myclass}{This class requires LuaLaTeX}
    {%
      You are not using LuaLaTeX.\MessageBreak
      Please compile with "lualatex" instead.\MessageBreak
      For example: lualatex yourfile.tex%
    }
\fi

%% ------------------------
%% Passage des autres options à la classe book
%% ------------------------
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions
\LoadClass[10pt]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage{fontspec}
\RequirePackage{microtype}
\RequirePackage[french]{babel}
\RequirePackage[usegeometry,paper=8.5in:11in]{typearea}% load before geometry
\RequirePackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage[x11names]{xcolor}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
\RequirePackage{lastpage}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{stmaryrd}
\RequirePackage{luacode}
\RequirePackage{colortbl}
\RequirePackage[document]{ragged2e}
\RequirePackage[some]{background}
\RequirePackage{array}
\newcolumntype{x}[1]{>{\centering\arraybackslash}p{0.075cm}|}
\newcolumntype{y}[1]{>{\raggedright\arraybackslash}m{#1}}

\newcommand\changepapersize[1]{%
  \cleardoublepage
  \KOMAoptions{paper=#1,DIV=last}%
  \newgeometry{margin=1in,footskip=0.5in}%
}
\AtBeginDocument{\storeareas\defaultareasettings}
\BeforeRestoreareas{\clearpage}

%% Formatage
\renewcommand\familydefault{\sfdefault}
\setlength{\parindent}{0pt}
\setlength{\parskip}{10pt}
\makeatletter
\renewcommand{\maketitle}{%
\begin{center}
  \chivo\LARGE\bfseries\color{white}\@title
\end{center}
}
\makeatother
% Set Helvetica (or TeX Gyre Heros) as the default sans font
\setsansfont{TeX Gyre Heros} % a free Helvetica-like font
% Chivo font for a special heading
\newfontfamily\chivo{Chivo}

%% Environnements custom
\newenvironment{instructions}{\itshape\small\color{gray}}{}
\definecolor{lebleu}{HTML}{005FAF}
\titleformat{\section}
  {\Large\bfseries\centering\color{lebleu}}{\thesection.}{1em}{}
\titleformat{\subsection}
  {\large\bfseries}{\thesubsection}{1em}{}
\renewcommand{\thesubsection}{\arabic{section}.\Alph{subsection}.}
\renewcommand{\thesubsubsection}{\alph{subsubsection})}

\pagestyle{fancy}
\fancyhead[L,C,R]{}
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{}
\fancyfoot[R]{\footnotesize\textbf{Version la plus récente Mars 2025~~~~~~\thepage} de \textbf{\pageref{LastPage}}}

\newcommand{\mitacsheader}{%
\SetBgScale{1}
\SetBgOpacity{1}
\SetBgAngle{0}
\SetBgContents{\includegraphics[width=8.5in]{Entete.png}}
\BgThispage
}

\newcommand{\tolandscape}{%
\changepapersize{8.5in:14in}
\KOMAoptions{paper=landscape,DIV=current}%switch to landscape
\newgeometry{left=1in,right=1in}
}

\newcommand{\toportrait}{%
\changepapersize{8.5in:11in}
\KOMAoptions{paper=portrait,DIV=current}%switch to landscape
\restoregeometry
}

%% :wrap=soft:mode=latex: