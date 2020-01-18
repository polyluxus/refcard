%&tex
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{refcard}[2020/01/18 v1.0 Reference Card Class]

%%% OPTION DEFINITIONS
%
%   Simple definitions for key-value pairs with kvoptions
%   See J. Wright, C. Feuersänger, TUGBoat, Vol. 30 (2009), No. 1, p. 110-122
%
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=refcard,
  prefix=rcopt@
}
%
%   Defining how many columns shall be used, 3 is the initial value,
%   which can be set with columns=<int> in the preamble.
%   Disable this option for the body of the document.
%
\DeclareStringOption[3]{columns}
\AtBeginDocument{%
  \DisableKeyvalOption[action=error,package=refcard]{refcard}{columns}}
%
%   Define a preset margin for geometry
%
\DeclareStringOption[1cm]{margin}
%
%   Warn about options which will not be used/ passed on because of potential clashes
%
\DeclareVoidOption{portrait}{%
  \PackageWarning{refcard}{Incompatible with portrait mode}}
\DeclareVoidOption{twocolumn}{%
  \PackageError{refcard}{Using 'multicol' for columns}}
\DeclareVoidOption{titlepage}{%
  \PackageWarning{refcard}{Incompatible with a title page}}
%
%   Pass all other options to article
%
\DeclareDefaultOption{%
  \PassOptionsToClass{\CurrentOptionKey}{article}}
%
%   DEV: Space for more options
%

%
%   Process these options
%   
\ProcessKeyvalOptions{refcard}
%
%%%

%%% INHERIT STANDARD CLASS
%
%   Latest update of standard class article
%   (It probably also works with earlier versions, but why sweat it.)
\LoadClass{article}[2014/09/29]
%
%%%

%%% ADDITIONAL REQUIRED TOOLS
%
%   Package etoolbox is necessary for additional hooks like \AtEndPreamble
%
\RequirePackage{etoolbox}
%
%   Page layout with latest version of geometry
%
\RequirePackage{geometry}[2018/04/16]
\newlength\refcard@margin
\setlength\refcard@margin\rcopt@margin
\AtEndPreamble{%
  \geometry{landscape,margin=\refcard@margin}}
%
%   Produce columns with multicol
%
\RequirePackage{multicol}[2018/04/20]
\AfterEndPreamble{%
  \begin{multicols}{\rcopt@columns}}
\AtEndDocument{%
  \end{multicols}}
%
%%%

%%% REDEFINE TITLE PAGE
%
\renewcommand{\maketitle}{%
  {%
   \begin{center}%
     \Large \@title \\%
     \vspace{0.1ex}%
     \small \@author, \@date%
   \end{center}%
  }%
}
%
%%%

%%% DOCUMENT DIVISIONS
%
%   Package titlesec for setting spacing for title lines
%
\RequirePackage{titlesec}
\titlespacing{\section}{0.05ex}{0.05ex}{0.05ex}
\titlespacing{\subsection}{0.05ex}{0.05ex}{0.05ex}
%
%   Package parskip to set indentation and paragraph separation
%
\RequirePackage[indent=0pt,skip=0.05ex]{parskip}
%
%   Package nopageno to supress all page numbers
%   this changes the definition of the pagestyle plain.
%
\RequirePackage{nopageno} 
%
%   No section numbering
%
\setcounter{secnumdepth}{0}
%
%%%

%%% COMMANDS AND ENVIRONMENTS
%
%   Extended definition of lists with enumitem
%
\RequirePackage[inline]{enumitem}[2019/06/20]
%   Calculating widths, e.g. with \widthof
\RequirePackage{calc} 

%   generate dense lists
\setlist{noitemsep,topsep=0.05ex}
\setlist[itemize]{label=\textendash,leftmargin=*}

%   More convinient environment definitions
\RequirePackage{environ}

%   Key definitions for the use in the environments 
\define@key{rclist}{font}{\def\refcard@font{#1}}
\define@key{rclist}{listcolumns}{\def\refcard@listcolumns{#1}}
\define@key{rclist}{tablecolumns}{\def\refcard@tablecolumns{#1}}
\define@key{rclist}{tablecolumnalign}{\def\refcard@tablecolumnalign{#1}}

%   Apply standards to these keys
\setkeys{rclist}{font=\bfseries,listcolumns=2,tablecolumns=2,tablecolumnalign=l}%

% https://tex.stackexchange.com/q/461056/33413
% https://tex.stackexchange.com/q/130097/33413
% https://tex.stackexchange.com/a/34314/33413
% Automatically use widest description label
% Define a variable to hold the currently widest label
\newlength\refcardlist@widestitem
\NewEnviron{refcardlist}[1][]{%
  \begingroup%
  \setkeys{rclist}{#1}%
  \vbox{%
    \global\refcardlist@widestitem=0pt%
    \def\item[##1]{%
      \settowidth\@tempdima{{\refcard@font##1}}%
      \ifdim\@tempdima>\refcardlist@widestitem\relax
      \global\refcardlist@widestitem=\@tempdima\fi%
    }%
    \setbox0=\hbox{\BODY}%
  }
  \begin{description}[%
    font=\normalfont\refcard@font,%
    labelindent=0pt,%
    labelwidth=\refcardlist@widestitem]%
  \BODY
  \end{description}%
  \endgroup%
}

\NewEnviron{refcardinline}[1][]{%
  \begingroup%
  \setkeys{rclist}{#1}
  \begin{description*}[%
    mode=unboxed,%
    font=\normalfont\refcard@font,%
    itemjoin={{; }},%
    afterlabel={{\nobreakspace}},%
    after={{.}}]%
  \BODY
  \end{description*}%
  \endgroup%
}

\NewEnviron{refcardcolumnlist}[1][]{%
  \begingroup%
  \setkeys{rclist}{#1}
  \begin{multicols*}{\refcard@listcolumns}
    \begin{itemize*}[%
      itemjoin={{\newline}},%
      afterlabel={{\nobreakspace}}]
    \BODY
    \end{itemize*}%
  \end{multicols*}
  \endgroup%
}

% Need a different approach if we want verbatim stuff
\newenvironment{refcardverblist}[1][]
{
  \begingroup
  \setkeys{rclist}{#1}
  \begin{multicols*}{\refcard@listcolumns}
    \begin{itemize*}[itemjoin={{\newline}},afterlabel={\nobreakspace}]
}{
    \end{itemize*}
  \end{multicols*}
  \endgroup
}

% Provide an easier interface to create a table
% Full width table with automagic column widths
\RequirePackage{tabularx}

\newcounter{refcard@tablecolumns@count}
%[How do I expand a macro into a tabular head?](https://tex.stackexchange.com/a/14460/33413)
\newcolumntype{\refcard@expandcoltype}{}
\long\@namedef{NC@rewrite@\string\refcard@expandcoltype}{\expandafter\NC@find}
\NewEnviron{refcardtable}[1][]{%
  \begingroup%
  \setkeys{rclist}{#1}
  \setcounter{refcard@tablecolumns@count}{\refcard@tablecolumns}
  \addtocounter{refcard@tablecolumns@count}{-1}
  \begin{tabularx}{\linewidth}{%
    *{\value{refcard@tablecolumns@count}}{\refcard@expandcoltype\refcard@tablecolumnalign}%
    X}
    \BODY
  \end{tabularx}
  \endgroup%
}

\NewEnviron{refcardmathtable}[1][]{%
  \begingroup%
  \setkeys{rclist}{#1}
  \setcounter{refcard@tablecolumns@count}{\refcard@tablecolumns}
  \addtocounter{refcard@tablecolumns@count}{-1}
  %\tabularx{\linewidth}{ *{\value{refcard@tablecolumns@count}}{l} X }
  \begin{tabularx}{\linewidth}{ >{ \(\displaystyle }l<{\) } X }
    \BODY
  \end{tabularx}
  \endgroup%
  }

