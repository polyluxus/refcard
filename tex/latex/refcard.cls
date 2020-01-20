%%
%% This is file `refcard.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% refcard.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% This work is licensed under the
%% 
%%   Creative Commons Attribution-ShareAlike 4.0 International License (CC BY-SA 4.0)
%% 
%% To view a copy of this license, visit
%% 
%%   https://creativecommons.org/licenses/by-sa/4.0/
%% 
%% Repository:
%% 
%%   https://github.com/polyluxus/refcard
%% 
%% Current Maintainer:
%% 
%%   Martin C Schwarzer <polyluxus@gmail.com>
%% 
%% For a list of contributers see the manual, or
%% 
%%   https://github.com/polyluxus/refcard/CONTRIBUTORS
%% 
%% This work consists of the files refcard.dtx and refcard.ins
%% and the derived filebase refcard.cls.
%% 
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{refcard}
    [2020/01/20 v1.0 Reference Card Class]
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=refcard,
  prefix=rcopt@
}
\DeclareStringOption[3]{columns}
\AtBeginDocument{%
  \DisableKeyvalOption[action=error,package=refcard]{refcard}{columns}}
\DeclareStringOption[1cm]{margin}
\DeclareVoidOption{portrait}{%
  \PackageWarning{refcard}{Incompatible with portrait mode, setting will be ignored.}}
\DeclareVoidOption{twocolumn}{%
  \PackageError{refcard}{Using 'multicol' for columns, use columns=2 instead.}}
\DeclareVoidOption{titlepage}{%
  \PackageWarning{refcard}{Incompatible with a title page, setting will be ignored.}}
\DeclareDefaultOption{%
  \PassOptionsToClass{\CurrentOptionKey}{article}}

\ProcessKeyvalOptions{refcard}

\LoadClass{article}[2014/09/29]
\RequirePackage{etoolbox}
\RequirePackage{geometry}[2018/04/16]
\newlength\refcard@margin
\setlength\refcard@margin\rcopt@margin
\AtEndPreamble{%
  \geometry{landscape,margin=\refcard@margin}}
\RequirePackage{multicol}[2018/04/20]
\AfterEndPreamble{%
  \begin{multicols}{\rcopt@columns}}
\AtEndDocument{%
  \end{multicols}}
\renewcommand{\maketitle}{%
  {%
   \begin{center}%
     \Large \@title \\%
     \vspace{0.1ex}%
     \small \@author, \@date%
   \end{center}%
  }%
}
\RequirePackage{titlesec}
\titlespacing{\section}{0.05ex}{0.05ex}{0.05ex}
\titlespacing{\subsection}{0.05ex}{0.05ex}{0.05ex}
\RequirePackage[indent=0pt,skip=0.05ex]{parskip}
\RequirePackage{nopageno}
\setcounter{secnumdepth}{0}
\RequirePackage[inline]{enumitem}[2019/06/20]
\setlist{noitemsep,topsep=0.05ex}
\setlist[itemize]{label=\textendash,leftmargin=*}
\RequirePackage{environ}
\define@key{rclist}{labelfont}{\def\refcard@labelfont{#1}}
\define@key{rclist}{envcolumns}{\def\refcard@envcolumns{#1}}
\define@key{rclist}{cellalign}{\def\refcard@cellalign{#1}}
\setkeys{rclist}{%
  labelfont=\bfseries,%
  envcolumns=2,%
  cellalign=l}%
\newlength\refcardlist@widestitem
\NewEnviron{refcardlist}[1][]{%
  \begingroup%
  \setkeys{rclist}{#1}%
  \vbox{%
    \global\refcardlist@widestitem=0pt%
    \def\item[##1]{%
      \settowidth\@tempdima{{\refcard@labelfont##1}}%
      \ifdim\@tempdima>\refcardlist@widestitem\relax
      \global\refcardlist@widestitem=\@tempdima\fi%
    }%
    \setbox0=\hbox{\BODY}%
  }
  \begin{description}[%
    font=\normalfont\refcard@labelfont,%
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
    font=\normalfont\refcard@labelfont,%
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
  \begin{multicols*}{\refcard@envcolumns}
    \begin{itemize*}[%
      itemjoin={{\newline}},%
      afterlabel={{\nobreakspace}}]
    \BODY
    \end{itemize*}%
  \end{multicols*}
  \endgroup%
}
\newenvironment{refcardverblist}[1][]
{
  \begingroup
  \setkeys{rclist}{#1}
  \begin{multicols*}{\refcard@envcolumns}
    \begin{itemize*}[%
      itemjoin={{\newline}},%
      afterlabel={{\nobreakspace}}]
}{
    \end{itemize*}
  \end{multicols*}
  \endgroup
}
\RequirePackage{tabularx}
\newcounter{refcard@tablecolumns@count}
\newcolumntype{\refcard@expandcoltype}{}
\long\@namedef{%
  NC@rewrite@\string\refcard@expandcoltype}{%
  \expandafter\NC@find}
\NewEnviron{refcardtable}[1][]{%
  \begingroup%
  \setkeys{rclist}{#1}
  \setcounter{refcard@tablecolumns@count}{\refcard@envcolumns}
  \addtocounter{refcard@tablecolumns@count}{-1}
  \begin{tabularx}{\linewidth}{%
    *{\value{refcard@tablecolumns@count}}{%
      \refcard@expandcoltype\refcard@cellalign}%
    X}
    \BODY
  \end{tabularx}
  \endgroup%
}
\NewEnviron{refcardmathtable}[1][]{%
  \begingroup%
  \setkeys{rclist}{#1}
  \setcounter{refcard@tablecolumns@count}{\refcard@envcolumns}
  \addtocounter{refcard@tablecolumns@count}{-2}
  \begin{tabularx}{\linewidth}{%
    >{\(\displaystyle}\refcard@expandcoltype\refcard@cellalign<{\)}%
    *{\value{refcard@tablecolumns@count}}{%
      \refcard@expandcoltype\refcard@cellalign}%
    X }
    \BODY
  \end{tabularx}
  \endgroup%
  }
\endinput
%%
%% End of file `refcard.cls'.
