%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Medium Length Professional CV
% LaTeX Class
% Version 3.0 (December 17, 2022)
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% Original header:
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved. This file is offered as-is,
% without any warranty.
%
% Created by Trey Hunner and modified by www.LaTeXTemplates.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\ProvidesClass{resume1}[2022/12/17 v3.0 Resume class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{article} % Load the base class

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES AND MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage[parfill]{parskip} % Remove paragraph indentation

\usepackage{array} % Required for bold tabular columns

\usepackage{ifthen} % Required for ifthenelse statements

\usepackage{graphicx} % Required for including images

\usepackage{tabularx}

\usepackage{multirow}

\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=blue
}

\urlstyle{same}

\pagestyle{empty} % Suppress headers and footers on all pages

%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	top=0.6in, % Top margin
	bottom=0.6in, % Bottom margin
	left=0.75in, % Left margin
	right=0.75in, % Right margin
	%showframe, % Uncomment to show how the type block is set on the page
}

%----------------------------------------------------------------------------------------
%	NAME AND ADDRESS COMMANDS
%----------------------------------------------------------------------------------------

\newcommand{\name}[1]{\renewcommand{\name}{#1}} % Defines the \name command to set the user's name

\newcommand{\phone}[1]{\renewcommand{\phone}{#1}} % Defines the \name command to set the user's name

\newcommand{\linkedin}[1]{\renewcommand{\linkedin}{#1}} % Defines the \name command to set the user's name

\newcommand{\email}[1]{\renewcommand{\email}{#1}} % Defines the \name command to set the user's name

%\newcommand{\addressSep}{$\diamond$} % Set default address separator to a diamond symbol

\newcommand{\addressSep}{$\colon$} % Set default address separator to a diamond symbol

% One, two or three address lines can be specified
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% The \address command is used to set the first, second and third address lines (the last 2 are optional)
\newcommand{\address}[1]{
	\@ifundefined{@addressone}{ % If the first address line has not been set yet, set it
		\def \@addressone {#1}
	}{
		\@ifundefined{@addresstwo}{ % If the second address line has not been set yet, set it
			\def \@addresstwo {#1}
		}{ % Otherwise, set the third address line
			\def \@addressthree {#1}
		}%
	}
}

% \printaddress is used to style an address line (provided in the single parameter to the command)
\newcommand{\printaddress}[1]{
	\begingroup
		\def \\ {\addressSep\ } % Redefine newlines (\\) to the address separator symbol so multiple lines of each address are output as a single line
		\centerline{#1} % Output the centered address line
	\endgroup
	\par % End the paragraph to ensure correct spacing between lines
	\smallskip % Vertical whitespace between address lines
}

% \printaddress is used to style an address line (provided in the single parameter to the command)
\newcommand{\printaddressx}[1]{
	\begingroup
		\def \\ {\addressSep\ } % Redefine newlines (\\) to the address separator symbol so multiple lines of each address are output as a single line
		\leftline{#1}
		% \centerline{#1} % Output the centered address line
	\endgroup
	\par % End the paragraph to ensure correct spacing between lines
	\smallskip % Vertical whitespace between address lines
}

% \printname is used to output the user's name in a large size
\newcommand{\printname}{
	\begingroup
		\hfil{\MakeUppercase{\huge\bfseries\name}}\hfil % Style and output the user's name
		\bigskip\break % Vertical whitespace below name
	\endgroup
}

% \printname is used to output the user's name in a large size
\newcommand{\printnameX}{
	\begingroup
		\begin{flushleft}
			%{\MakeUppercase{\huge\bf\name}} % Style and output the user's name
			\huge\bf\name
			%\bigskip % Vertical whitespace below name
		\end{flushleft}
	\endgroup
}

\newcommand{\printcontactX}{
	\begin{tabular}{ l c l}
		Phone & : & \phone \\
		Email & : & \href{mailto:\email}{\email} \\
		LinkedIn & : & \href{\linkedin}{\linkedin} \\ 
	\end{tabular}
}

%----------------------------------------------------------------------------------------
%	OUTPUT THE NAME & ADDRESS LINES AUTOMATICALLY
%----------------------------------------------------------------------------------------

\let\ori@document=\document % Store the original \document command
\renewcommand{\document}{
	\ori@document  % Output the original \document command but add to it below
	% \printnamex % Output the user's name
	% \@ifundefined{@addressone}{}{\printaddressx{\@addressone}} % Output the first address if specified
	% \@ifundefined{@addresstwo}{}{\printaddressx{\@addresstwo}} % Output the second address if specified
	% \@ifundefined{@addressthree}{}{\printaddressx{\@addressthree}} % Output the third address if specified

	\begin{tabularx}{\textwidth}{
		>{\raggedright\arraybackslash}X 
		>{\raggedleft\arraybackslash}X  
		}
		\printnameX
		& 
		\multirow[c]{3}{*}{{\includegraphics[width=0.3\textwidth]{../assets/logo.png}}}\\ 
		\printcontactX
		& \\
	\end{tabularx}
}




%\href{https://github.com/accelr-net/alveo-memory-tester}{GitHub Repo}


%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the major sections within the CV
\newenvironment{rSection}[1]{ % The single parameter is for the section title
	\medskip % Vertical whitespace
	\MakeUppercase{\textbf{#1}} % Section title
	\medskip % Vertical whitespace
	\hrule % Horizontal rule
	\begin{list}{}{ % List to indent the entire content of the section
		\setlength{\leftmargin}{1.5em} % Indent to the left of the list
	}
	\item[] % Empty list item to enable indentation
}{
	\end{list}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 parameters: company name, year(s) employed, job title and location
	\textbf{#1} \hfill {#2} % Bold company name and date to the right
	\ifthenelse{\equal{#3}{}}{}{ % If the third parameter is empty, don't output the job title and location line
		\\ % Job title and location on a new line
		\textit{#3} \hfill \textit{#4} % Output job title and location
	}%
	\smallskip % Vertical whitespace
	\begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
		\setlength{\itemsep}{-0.5em} \vspace{-0.5em} % Reduce vertical spacing between items in the list for a tighter look
}{
	\end{list}
	\vspace{0.5em} % Vertical whitespace after the end of the list
}

\newenvironment{rSubsectionX}[4]{ % 4 parameters: company name, year(s) employed, job title and location
	% \textbf{#1}, \hfill \emph{#2} \\
	% \emph{\footnotesize Web: \url{#3}}
	% \smallskip
	\textbf{#1}, \emph{\small \url{#2}}
 	\smallskip
	\ifthenelse{\equal{#3}{}}{}{ % If the third parameter is empty, don't output the job title and location line
		\\ % Job title and location on a new line
		\emph{#3} \hfill \textit{#4} % Output job title and location
	}
	\smallskip % Vertical whitespace
	\begin{list}{$\cdot$}{\leftmargin=1em} % \cdot used for bullets, no indentation
		\setlength{\itemsep}{-0.5em} \vspace{-0.5em} % Reduce vertical spacing between items in the list for a tighter look
}{
	\end{list}
	\vspace{0.5em} % Vertical whitespace after the end of the list
}

\newenvironment{rSubsectionSmallX}[2]{ % 2 parameters: year(s) employed, job title
	% \textbf{#1}, \hfill \emph{#2} \\
	% \emph{\footnotesize Web: \url{#3}}
	% \smallskip
	% \textbf{#1}, \emph{\small \url{#2}}
 	% \smallskip
	% \ifthenelse{\equal{#1}{}}{}{ % If the third parameter is empty, don't output the job title and location line
	% 	\\ % Job title and location on a new line
	% 	\emph{#1} \hfill \textit{#2} % Output job title and location
	% }
	\emph{#1} \hfill \textit{#2} % Output job title and location
	\smallskip % Vertical whitespace
	\begin{list}{$\cdot$}{\leftmargin=1em} % \cdot used for bullets, no indentation
		\setlength{\itemsep}{-0.5em} \vspace{-0.5em} % Reduce vertical spacing between items in the list for a tighter look
}{
	\end{list}
	\vspace{0.5em} % Vertical whitespace after the end of the list
}

\newenvironment{rSubsectionSimpleX}[4]{ % 4 parameters: company name, year(s) employed, job title and location
	% \textbf{#1}, \hfill \emph{#2} \\
	% \emph{\footnotesize Web: \url{#3}}
	% \smallskip
	\textbf{#1}, \emph{\small \url{#2}}
 	\smallskip
	\ifthenelse{\equal{#3}{}}{}{ % If the third parameter is empty, don't output the job title and location line
		\\ % Job title and location on a new line
		\emph{#3} \hfill \textit{#4} % Output job title and location
	}
}{}