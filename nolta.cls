\ifdefined\sjis%%% for (u)ptex
\RequirePackage{plautopatch}
\fi


%%% A4 14Q X 160mm X 51L(19H)

\NeedsTeXFormat{LaTeX2e}[2018/12/01]
\ProvidesClass{nolta}
% [2010/05/21 v1.0 NOLTA class (C) 2010 Copyright IEICE. All rights reserved.]
% [2010/07/0 v2.0 NOLTA class (C) 2010 Copyright IEICE. All rights reserved.]
% [2010/07/26 v2.1 NOLTA class (C) 2010 Copyright IEICE. All rights reserved.]
% [2010/10/15 v2.2 NOLTA class (C) 2010 Copyright IEICE. All rights reserved.]
% [2010/10/21 v2.3 NOLTA class (C) 2010 Copyright IEICE. All rights reserved.]
% [2011/04/25 v2.4 NOLTA class (C) 2011 Copyright IEICE. All rights reserved.]
% [2011/07/28 v3.0 NOLTA class (C) 2011 Copyright IEICE. All rights reserved.]
% [2011/08/23 v3.01 NOLTA class (C) 2011 Copyright IEICE. All rights reserved.]
% [2015/08/28 v3.02 NOLTA class (C) 2011 Copyright IEICE. All rights reserved.]
% [2018/04/18 v3.06 NOLTA class (C) 2011 Copyright IEICE. All rights reserved.]
% [2022/07/22 v3.07 NOLTA class (C) 2011 Copyright IEICE. All rights reserved.]
% [2022/08/29 v3.071 NOLTA class (C) 2011 Copyright IEICE. All rights reserved.]
% [2022/10/01 v4.00 NOLTA class (C) 2022 Copyright IEICE. All rights reserved.]
% [2023/10/24 v4.01 NOLTA class (C) 2023 Copyright IEICE. All rights reserved.]
% [2023/11/01 v4.011 NOLTA class (C) 2023 Copyright IEICE. All rights reserved.]
  [2024/04/01 v5.00 NOLTA class (C) 2024 Copyright IEICE. All rights reserved.]

%%2018/04/18 v3.06 Add for ORCID ID.
%%2022/08/29 experimental code for TL2020 or later
%%2022/07/15 .eps deleted
%%2022/07/15 require plautopatch
%%2022/07/15 color->xclolor Gray -> black!50
%%%% (u)platex/lualatex/pdflatex/xelatex OK, maybe...
%%2022/07/15 add CC-By mark
%%2022/07/15 surppress the warnings of fonts when using (u)pLaTeX
%%2022/07/15 require graphicx.sty in cls, move color after ProcessOptions
%%2022/07/15 fix multipls ExecuteOptions/ProcessOptions
%%2022/07/15 require hyperref
%%2022/07/15 fix strange labe settings for first/last page
%%2022/07/15 change cc-by to cc-by-nc-nd and its layout
%%2022/07/20 merge orcid-aux (change \orcid to new \orcid using aux)
%%2022/07/21 branch cite
%%2022/07/22 surppress label/ref/pageref/footnote link
%%2022/09/08 versoin/caption fixed
%%2023/10/24 New category ``Survey paper'' added
%%2023/11/01 The name of header, CC image is changed
%%2024/04/01 fix the identifier of the macros for NOLA.
%%2024/04/01 Add new headers. (Ack Ref header is changed ro subsection)

%\RequirePackage{keyval}%%%


%%Creative Commons
\def\CClicense{%
\raisebox{3.5mm}[\z@][\z@]{%
    \rlap{%
       \scalebox{.6}{%
          \href{https://creativecommons.org/licenses/by-nc-nd/4.0/deed}%
               {\includegraphics{by-nc-nd-nolta}}}~%
          \footnotesize
          \scalebox{.95}{This work is licensed under a Creative Commons Attribution Non Commercial, No Derivatives 4.0 License.}%
    }%
}%
}

%% surppress the warnings of fonts when using (u)pLaTeX
\ifdefined\sjis%%% for ptex or uptex
\ifcsname JY2/mc/m/n/10\endcsname%%% for uptex
   \DeclareFontShape{JT2}{mc}{bx}{it}{<-> ssub*mc/bx/n}{}
   \DeclareFontShape{JY2}{mc}{bx}{it}{<-> ssub*mc/bx/n}{}
   \DeclareFontShape{JT2}{mc}{m}{it}{<-> ssub*mc/m/n}{}
   \DeclareFontShape{JY2}{mc}{m}{it}{<-> ssub*mc/m/n}{}
   \DeclareFontShape{JT2}{gt}{m}{it}{<-> ssub*gt/m/n}{}
   \DeclareFontShape{JY2}{gt}{m}{it}{<-> ssub*gt/m/n}{}
\else%%% for ptex
   \DeclareFontShape{JT1}{mc}{bx}{it}{<-> ssub*mc/bx/n}{}
   \DeclareFontShape{JY1}{mc}{bx}{it}{<-> ssub*mc/bx/n}{}
   \DeclareFontShape{JT1}{mc}{m}{it}{<-> ssub*mc/m/n}{}
   \DeclareFontShape{JY1}{mc}{m}{it}{<-> ssub*mc/m/n}{}
   \DeclareFontShape{JT1}{gt}{m}{it}{<-> ssub*gt/m/n}{}
   \DeclareFontShape{JY1}{gt}{m}{it}{<-> ssub*gt/m/n}{}
\fi
\fi



% New Century for nombrefont
%\newif\if@cameraready \@camerareadyfalse
%\DeclareOption{cameraready}{\@camerareadytrue}


%%% Proof
\newif\if@Proof \@Prooffalse%
\DeclareOption{Proof}{\@Prooftrue}


%%% Printer
\newif\if@Printer \@Printerfalse%
\DeclareOption{Printer}{\@Printertrue}

%\ExecuteOptions{Prooffalse}

%%% Invited Paper
%%%\newif\if@invited \@invitedfalse%
\DeclareOption{invited}{\def\paper@type{Invited Paper}}

%%% Paper(default)
%%%\newif\if@paper \@paperfalse%
\DeclareOption{paper}{\def\paper@type{Paper}}

%%%%Survey
\DeclareOption{survey}{\def\paper@type{Survey paper}}



%%%
%\ProcessOptions



%\definecolor{gray}{}

%%% center
\def\Center{\topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
 \trivlist \centering\item\relax}
\def\endCenter{\endtrivlist}
%%% flushtleft
\def\Flushleft{\topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
 \trivlist \raggedright\item\relax}
\def\endFlushleft{\endtrivlist}


%%%% parameter %%%%%%%%%
\unitlength=1mm
\predisplaypenalty=0

%%%%%%%%%%%%%%%%%%%%%%%%

%%%
\def\Hline{\noalign{\hrule height .25mm}}


%%%%%%%%%%%%%%%%% These are borrowed style files %%%%%%%%%%%
%%% from  LaTeX
\def\pushtowall{\relax\leavevmode
\ifmmode\def\next{\mathpalette\mathpushw@ll}
\else\let\next\makepushw@ll \fi \next}
\def\finpushw@ll{\wd0=0pt \box0}
\def\makepushw@ll#1{\setbox0=\hbox{#1}\finpushw@ll}
\def\mathpushw@ll#1#2{\setbox0=\hbox{$\m@th#1{#2}$}\finpushw@ll}
%%%%

%%%%% from indent.sty
% Newsgroups: comp.text.tex
% From: cameron@symcom.math.uiuc.edu (Cameron Smith)

\newenvironment{indentation}[2]%
{%
  \par
  \setlength{\leftmargin}{#1}%
  \setlength{\rightmargin}{#2}%
  \advance\linewidth -\leftmargin
  \advance\linewidth -\rightmargin
  \advance\@totalleftmargin\leftmargin
  \@setpar{{\@@par}}%
  \parshape 1 \@totalleftmargin \linewidth
  \ignorespaces
}%
{\par}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





\newcommand\@ptsize{}

\newif\if@restonecol
\newif\if@titlepage

\@titlepagefalse

\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi
\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\fi
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\ExecuteOptions{a4paper,twoside,final,paper}
\ProcessOptions




%% graphics/Color
\RequirePackage{graphicx}
\RequirePackage{xcolor}



%OT1cmr
\DeclareFontShape{OT1}{cmr}{m}{n}%
     {<-5.5>   cmr5%
      <5.5-6.5>   cmr6%
      <6.5-7.5>   cmr7%
      <7.5-8.5>   cmr8%
      <8.5-11.5>  cmr10%
      <11.5-16.5> cmr12%
      <16.5->   cmr17%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{sl}%
     {  <-8.5>   cmsl8%
      <8.5-9.5>  cmsl9%
      <9.5-11.5> cmsl10%
      <11.5->    cmsl12%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{it}%
     {%
      <-7.5>     cmti7%
      <7.5-8.5>  cmti8%
      <8.5-9.5>  cmti9%
      <9.5-11.5> cmti10%
      <11.5->    cmti12%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{sc}%
     {%
      <->cmcsc10%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{ui}
     {%
      <-> cmu10%
      }{}
%%%%%%% bold series
\DeclareFontShape{OT1}{cmr}{b}{n}
     {%
      <-> cmb10%
      }{}
%%%%%%%% bold extended series
\DeclareFontShape{OT1}{cmr}{bx}{n}
   {%
      <-5.5>     cmbx5
      <5.5-6.5>  cmbx6
      <6.5-7.5>  cmbx7
      <7.5-8.5>  cmbx8
      <8.5-9.5>  cmbx9%
      <9.5-11.5> cmbx10%
      <11.5->    cmbx12%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{sl}
      {%
      <-> cmbxsl10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{it}
      {%
      <-> cmbxti10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{ui}
      {<->sub*cmr/m/ui}{}
%OMScmsy
\DeclareFontShape{OMS}{cmsy}{m}{n}{%
      <-5.5>    cmsy5
      <5.5-6.5> cmsy6
      <6.5-7.5> cmsy7
      <7.5-8.5> cmsy8
      <8.5-9.5> cmsy9
      <9.5->    cmsy10%
      }{}
\DeclareFontShape{OMS}{cmsy}{b}{n}{%
      <   -5.5> cmbsy5
      <5.5-6.5> cmbsy6
      <6.5-7.5> cmbsy7
      <7.5-8.5> cmbsy8
      <8.5-9.5> cmbsy9
      <9.5-   > cmbsy10%
      }{}
%OMXcmex
\DeclareFontShape{OMX}{cmex}{m}{n}{%
   <-> cmex10%
   }{}
%OMLcmmi
\DeclareFontShape{OML}{cmm}{m}{it}%
     {<   -5.5>    cmmi5
      <5.5-6.5> cmmi6
      <6.5-7.5> cmmi7
      <7.5-8.5> cmmi8
      <8.5-9.5> cmmi9%
      <9.5-11.5>cmmi10%
      <11.5-   >cmmi12%
      }{}
\DeclareFontShape{OML}{cmm}{b}{it}{%
      <   -5.5>    cmmib5
      <5.5-6.5> cmmib6
      <6.5-7.5> cmmib7
      <7.5-8.5> cmmib8
      <8.5-9.5> cmmib9%
      <9.5->    cmmib10%
      }{}
\DeclareFontShape{OML}{cmm}{bx}{it}%
   {<->ssub*cmm/b/it}{}
%%OT1cmtt
\DeclareFontShape{OT1}{cmtt}{m}{n}
     {%
      <   -8.5>     cmtt8
      <8.5-9.5>  cmtt9%
      <9.5-11.5> cmtt10%
      <11.5-   >    cmtt12%
      }{}
%%%%%% make sure subst shapes are available
\DeclareFontShape{OT1}{cmtt}{m}{it}
     {%
      <-> cmitt10%
      }{}
\DeclareFontShape{OT1}{cmtt}{m}{sl}
     {%
      <-> cmsltt10%
      }{}
\DeclareFontShape{OT1}{cmtt}{m}{sc}
     {%
      <-> cmtcsc10%
      }{}
\DeclareFontShape{OT1}{cmtt}{m}{ui}
  {<->ssub*cmtt/m/it}{}
\DeclareFontShape{OT1}{cmtt}{bx}{n}
  {<->ssub*cmtt/m/n}{}
\DeclareFontShape{OT1}{cmtt}{bx}{it}
  {<->ssub*cmtt/m/it}{}
\DeclareFontShape{OT1}{cmtt}{bx}{ui}
  {<->ssub*cmtt/m/it}{}
%%\changes{v0.3}{2002/09/11}{amsfonts}
%umsa
\DeclareFontFamily{U}{msa}{}
\DeclareFontShape{U}{msa}{m}{n}{
  <   -5.5> msam5
  <5.5-6.5> msam6
  <6.5-7.5> msam7
  <7.5-8.5> msam8
  <8.5-9.5> msam9
  <9.5-    > msam10
  }{}
\DeclareFontFamily{U}{msb}{}
\DeclareFontShape{U}{msb}{m}{n}{
  <   -5.5> msbm5
  <5.5-6.5> msbm6
  <6.5-7.5> msbm7
  <7.5-8.5> msbm8
  <8.5-9.5> msbm9
  <9.5-   > msbm10
  }{}
%%for latexsym
\DeclareFontFamily{U}{lasy}{}
\DeclareFontShape{U}{lasy}{m}{n}{
 <   -5.5>lasy5
 <5.5-6.5>lasy6
 <6.5-7.5>lasy7
 <7.5-8.5>lasy8
 <8.5-9.5>lasy9
 <9.5-    >lasy10  }{}
\DeclareFontShape{U}{lasy}{b}{n}{
     <  -10> ssub * lasy/m/n
     <10-  > lasyb10  }{}
%%%



\newdimen\JQ
 \JQ=0.7392507pt
\newdimen\Q
 \Q=0.7392507pt%0.71144pt
\newdimen\EM
 \EM=.03125em
\newdimen\h
\h=0.25mm

\newdimen\EQ
 \EQ=1.1\Q



\def\Cvs{\baselineskip}%%%%


 \def\@vpt{5}
 \def\@vipt{6}
 \def\@viipt{7}
 \def\@viiipt{8}
 \def\@ixpt{9}
 \def\@xpt{10}
 \def\@xipt{10.95}
 \def\@xiipt{12}
 \def\@xivpt{14.4}
 \def\@xviipt{17.28}
 \def\@xxpt{20.74}
 \def\@xxvpt{24.88}



\renewcommand\normalsize{%
%   \@setfontsize\normalsize\@xpt{17\Q}%
   \@setfontsize\normalsize{14\Q}{19\h}%
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
\normalsize

\newcommand\small{%
   \@setfontsize\small{13\Q}{14\h}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\footnotesize{%
   \@setfontsize\footnotesize{11\Q}{13\h}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\scriptsize{\@setfontsize\scriptsize{10\Q}{14\h}}
\newcommand\tiny{\@setfontsize\tiny{7\Q}{11\h}}
\newcommand\large{\@setfontsize\large{14\Q}{18\h}}
%%\newcommand\large{\@setfontsize\large\@xiipt{14}}
\newcommand\Large{\@setfontsize\Large{16\Q}{20\h}}
\newcommand\LARGE{\@setfontsize\LARGE{20\Q}{24\h}}
\newcommand\XXIQ{\@setfontsize\XXIQ{21\Q}{24\h}}
\newcommand\huge{\@setfontsize\huge\@xxpt{25}}
\newcommand\Huge{\@setfontsize\Huge\@xxvpt{30}}





\if@twocolumn
  \setlength\parindent{1em}
\else
  \setlength\parindent{1em}%{15\p@}
\fi
\setlength\smallskipamount{3\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount{6\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\bigskipamount{12\p@ \@plus 4\p@ \@minus 4\p@}
\setlength\headheight{12\p@}
\setlength\headsep   {17.5\Q}
\setlength\topskip   {13\Q}%{10\p@}
\setlength\footskip{12mm}%{27.5\Q}%{17.5\Q}%{.35in}
\if@compatibility \setlength\maxdepth{4\p@} \else
\setlength\maxdepth{.5\topskip} \fi
\if@compatibility
  \if@twocolumn
    \setlength\textwidth{410\p@}
  \else
    \setlength\textwidth{345\p@}
  \fi
\else
  \setlength\@tempdima{\paperwidth}
  \addtolength\@tempdima{-2in}
  \setlength\@tempdimb{345\p@}
  \if@twocolumn
    \ifdim\@tempdima>2\@tempdimb\relax
      \setlength\textwidth{2\@tempdimb}
    \else
      \setlength\textwidth{\@tempdima}
    \fi
  \else
    \ifdim\@tempdima>\@tempdimb\relax
      \setlength\textwidth{\@tempdimb}
    \else
      \setlength\textwidth{\@tempdima}
    \fi
  \fi
\fi
\if@compatibility\else
  \@settopoint\textwidth
\fi
\if@compatibility
  \setlength\textheight{43\baselineskip}
\else
  \setlength\@tempdima{\paperheight}
  \addtolength\@tempdima{-2in}
  \addtolength\@tempdima{-1.5in}
  \divide\@tempdima\baselineskip
  \@tempcnta=\@tempdima
  \setlength\textheight{\@tempcnta\baselineskip}
\fi
\addtolength\textheight{\topskip}
\if@twocolumn
 \setlength\marginparsep {10\p@}
\else
  \setlength\marginparsep{11\p@}
\fi
\setlength\marginparpush{5\p@}
\if@compatibility
  \if@twoside
     \setlength\oddsidemargin   {44\p@}
     \setlength\evensidemargin  {82\p@}
     \setlength\marginparwidth {107\p@}
  \else
     \setlength\oddsidemargin   {63\p@}
     \setlength\evensidemargin  {63\p@}
     \setlength\marginparwidth  {90\p@}
  \fi
  \if@twocolumn
     \setlength\oddsidemargin  {30\p@}
     \setlength\evensidemargin {30\p@}
     \setlength\marginparwidth {48\p@}
  \fi
\else
  \if@twoside
    \setlength\@tempdima        {\paperwidth}
    \addtolength\@tempdima      {-\textwidth}
    \setlength\oddsidemargin    {.4\@tempdima}
    \addtolength\oddsidemargin  {-1in}
    \setlength\marginparwidth   {.6\@tempdima}
    \addtolength\marginparwidth {-\marginparsep}
    \addtolength\marginparwidth {-0.4in}
  \else
    \setlength\@tempdima        {\paperwidth}
    \addtolength\@tempdima      {-\textwidth}
    \setlength\oddsidemargin    {.5\@tempdima}
    \addtolength\oddsidemargin  {-1in}
    \setlength\marginparwidth   {.5\@tempdima}
    \addtolength\marginparwidth {-\marginparsep}
    \addtolength\marginparwidth {-0.4in}
    \addtolength\marginparwidth {-.4in}
  \fi
  \ifdim \marginparwidth >2in
     \setlength\marginparwidth{2in}
  \fi
  \@settopoint\oddsidemargin
  \@settopoint\marginparwidth
  \setlength\evensidemargin  {\paperwidth}
  \addtolength\evensidemargin{-2in}
  \addtolength\evensidemargin{-\textwidth}
  \addtolength\evensidemargin{-\oddsidemargin}
  \@settopoint\evensidemargin
\fi
\if@compatibility
  \setlength\topmargin{27pt}
\else
  \setlength\topmargin{\paperheight}
  \addtolength\topmargin{-2in}
  \addtolength\topmargin{-\headheight}
  \addtolength\topmargin{-\headsep}
  \addtolength\topmargin{-\textheight}
  \addtolength\topmargin{-\footskip}     % this might be wrong!
  \addtolength\topmargin{-.5\topmargin}
  \@settopoint\topmargin
\fi
\setlength\footnotesep{6.65\p@}
\setlength{\skip\footins}{9\p@ \@plus 4\p@ \@minus 2\p@}
\setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\intextsep   {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}





\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}
\def\@listi{\leftmargin\leftmargini
            \parsep 4\p@ \@plus2\p@ \@minus\p@
            \topsep 8\p@ \@plus2\p@ \@minus4\p@
            \itemsep4\p@ \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    4\p@ \@plus2\p@ \@minus\p@
              \parsep    2\p@ \@plus\p@  \@minus\p@
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}
%%%%%\endinput
%%
%% End of file `size10.clo'.


%%%%


\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{\z@}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301


%% koko
\setcounter{topnumber}{5}
\setcounter{bottomnumber}{5}
\setcounter{totalnumber}{10}
\setcounter{dbltopnumber}{5}
\renewcommand{\topfraction}{.95}
\renewcommand{\bottomfraction}{.95}
\renewcommand{\textfraction}{.05}
\renewcommand{\floatpagefraction}{.05}
\renewcommand{\dbltopfraction}{.95}
\renewcommand{\dblfloatpagefraction}{.05}




\if@Proof
 \def\@Rtop{\rlap{\smash{\rule[-\headsep]{0.05mm}{10mm}%
  \rule[-\headsep]{10mm}{0.05mm}}}}
 \def\@Ltop{\llap{\smash{\rule[-\headsep]{10mm}{0.05mm}%
  \rule[-\headsep]{0.05mm}{10mm}}}}
 \def\@Rbot{\rlap{\smash{\raisebox{1\footskip}
  {\rule[-10mm]{0.05mm}{10mm}\rule{10mm}{0.05mm}}}}}
 \def\@Lbot{\llap{\smash{%
%\pushtowall{\usebox{\daisibox}}%
\raisebox{1\footskip}
  {\rule{10mm}{0.05mm}\rule[-10mm]{0.05mm}{10mm}}}}}
%%%%
 \def\@Ctate{\relax}
\def\@Cyoko{\relax}
%%%
 \def\pot@jobname{\smash{\raise7mm\rlap{\LARGE\texttt{\jobname}}}}
\else
 \let\@Rtop\relax\let\@Ltop\relax\let\@Rbot\relax\let\@Lbot\relax\let\@Ctate\relax\let\@Cyoko\relax
 \let\pot@jobname\relax
\fi


%%%%%
%%%%% insert Month
\def\specialissue#1{%
 \gdef\@specialissue{%
  \vtop{\hrule \@height.1mm
   \hbox{%
    \vrule \@width.1mm \@height 6mm
    \vbox to 6mm{\vss
     \hbox{\hskip1.5mm SPECIAL Xxxxxx\hskip3mm #1\hskip1.5mm\null}%
    \vss}%
    \vrule \@width.1mm \@height 6mm
   }%
   \hrule \@height.1mm
  }\global\@tempdimc-1mm}}
\def\@specialissue{}

\newdimen\@tempdimc




\def\Year#1{%
 \gdef\@Year{#1}%
 \afterassignment\remove@to@nnil
  \count@ 0#1\relax\@nnil
 \ifnum\count@=\z@
  \gdef\@Year{2006}%
 \else
  \@tempcnta=#1\relax
  \advance \@tempcnta -2000\relax
  \xdef\@@Year{0\the\@tempcnta}%
 \fi
}
\def\@Year{}
\def\@@Year{}



\def\Vol#1{%
 \gdef\@Vol{#1}%
 \gdef\@VolForHeadings{#1}%
 \ifx\@Vol\empty\gdef\@Vol{XX}\fi
 \ifx\@Vol\empty\gdef\@VolForHeadings{XX}\fi
}
\def\@Vol{}
\def\@VolForHeadings{}



\def\No#1{%
 \gdef\@No{#1}%
 \afterassignment\remove@to@nnil
  \count@ 0#1\relax\@nnil
 \ifnum\count@=\z@
  \gdef\@No{0}
 \fi
 \gdef\@@No{\two@digits{\@No}}%
}
\def\@No{}
\def\@@No{}




\renewcommand{\No}[1]{%\setcounter{theArNumcnt}{0}
\def\@tempNoNum{#1}%
\ifx\@tempNoNum\empty \gdef\@No{??}%
\else%
\gdef\@InputNo{#1}%
\gdef\@No{%
\ifnum#1 <10 00#1\else%
\ifnum#1 <100 0#1\else%
#1\fi\fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\gdef\@@No{%
\ifnum#1 <10 000#1\else%
\ifnum#1 <100 00#1\else%
#1\fi\fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% for headings
\gdef\@NoForHeadings{%
\ifnum#1 <10 #1\else%
\ifnum#1 <100 #1\else%
#1\fi\fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fi
}




\renewcommand{\No}[1]{%\setcounter{theArNumcnt}{0}
\def\@tempNoNum{#1}%
\ifx\@tempNoNum\empty \gdef\@No{??}%
\else%
\gdef\@InputNo{#1}%
\gdef\@No{%
\ifnum#1 <10 0#1\else%
\ifnum#1 <100 #1\else%
#1\fi\fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\gdef\@@No{%
\ifnum#1 <10 000#1\else%
\ifnum#1 <100 00#1\else%
#1\fi\fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% for headings
\gdef\@NoForHeadings{%
\ifnum#1 <10 #1\else%
\ifnum#1 <100 #1\else%
#1\fi\fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fi
}







\def\Month#1{%
 \gdef\@Month{#1}%
 \afterassignment\remove@to@nnil
  \count@ 0#1\relax\@nnil
 \ifnum\count@=\z@
  \gdef\@Month{0}
 \fi
 \gdef\@@Month{\two@digits{\@Month}}%
}
\def\@Month{}
\def\@@Month{}





\def\fmt@month#1{%
 \ifx\tmp@month\empty XXX\else
  \ifcase#1 xxx\or January\or February\or March\or April\or
   May\or June\or July\or August\or September\or October\or
    November\or December\else
   \@ctrerr\fi\relax
 \fi
}


%%%%%
\def\received#1#2#3{%
 \begingroup
  \def\tmp@month{#1}%
  \protected@xdef\@received{%
   \@received
%   \protect\footnotetext[0]
{%\small%
%   \hskip.5em
Received\
     \fmt@month{#1}\
     #2, #3}%
  }%
 \endgroup
 \gdef\@receivedyear{#3}}







\def\revised#1#2#3{%
 \begingroup
  \def\tmp@month{#1}%
  \protected@xdef\@revised{%
   \@revised
%   \protect\footnotetext[0]
{%\small%
%   \hskip.5em
;\ Revised\
     \fmt@month{#1}\
     #2, #3}%
  }%
 \endgroup}


\def\published#1#2#3{%
 \begingroup
  \def\tmp@month{#1}%
  \protected@xdef\@published{%
   \@published
%   \protect\footnotetext[0]
{%\small%
%   \hskip.5em
;\ Published\
     \fmt@month{#1}\
     #2, #3}%
}%
 \endgroup}


\def\@received{}
\def\@receivedyear{}
\def\@revised{}
\def\@published{}




\gdef\@DOI{DOI: 10.1587/nolta.\@Vol.\pageref{NOLTA@firstpage}%\@ArticleNumber
}






%%%%%
\newif\if@TITLENOTE  \@TITLENOTEfalse

\newbox\@TITLENOTEbox

\def\titlenote[#1]#2{%
%
\rlap{\@textsuperscript{\normalfont\scriptsize%\small
#1}}
\noindent\begingroup
%
%  \def\tmp@month{#1}%
  \protected@xdef\@titlenote{%
%   \@received
\protect\footnotetext[0]{\small%
%   \hskip.5em
\noindent\leftskip2em%
\noindent\hspace*{-3.45em}\hb@xt@1.8em{\hss$^{#1}$\,}%
%\smash{\protect\pushtowall{\protect\rule{.1mm}{40mm}}}
#2%
}%
  }%
 \endgroup\@TITLENOTEtrue
%\if@TITLENOTE
\gdef\@TITLENOTEmark{\@textsuperscript{\normalfont\scriptsize%\small
#1}}%
}

\def\@titlenote{}

\def\@footpage{%
 \ifnum \value{page} < 10\relax
  \gdef\@@footpage{000\thepage}%
 \else
  \ifnum \value{page} < 100\relax
   \gdef\@@footpage{00\thepage}%
  \else
   \ifnum \value{page} < 1000\relax
    \gdef\@@footpage{0\thepage}%
   \else
    \gdef\@@footpage{\thepage}%
   \fi
  \fi
 \fi
}

\def\NOLTA@copyright{\scriptsize \raise.2mm\hbox{\copyright}}
\def\@@receivedyear{%
 \ifx\@receivedyear\empty
  \@Year
 \else
  \@receivedyear
 \fi
}

 \def\nombre@font{\footnotesize\bfseries\slshape}
\def\head@font{\normalfont\small}
%%%%%


\if@twoside
  \def\ps@headings{%
      \def\@evenhead{%
          \@Ltop%
          \hfill\@Rtop}%
     \def\@oddhead{%
          \@Ltop%
          \hfill\@Rtop}%
    \def\@evenfoot{\@Lbot\hfill
\smash{\begin{tabular}[t]{@{}c@{}}%
\mbox{}\\[-4.8mm]%[-10.5mm]%[-8.25mm]%%!!!  <-------- v3.0
{%\small
\fontsize{11pt}{0pt}\selectfont%
\thepage}\\[-5.7mm]%%!!!  <-------- v3.0
\phantom{\scriptsize[\@received\@revised\@published]}\hfill\mbox{}\\[-1.25mm]%\par%%
\phantom{\scriptsize[\@DOI]}\hfill\mbox{}\\[-.25mm]
\hbox to\textwidth{\small%\hfill
\phantom{%%%%%% !!! Not use
Nonlinear Theory and Its Applications,
IEICE, vol.\ \@VolForHeadings, no.\ \@NoForHeadings, pp.\ \pageref{NOLTA@firstpage}--\pageref{LastPage}%\fmt@month{\@Month}\hspace{2.5mm}
\hskip6mm{\copyright}IEICE\ \@Year%
}%%%%!!!
\hfill}%\hfill}}%
\end{tabular}}%
\hfill\@Rbot}%
%%%%%
\def\@oddfoot{\@Lbot\hfill
\smash{\begin{tabular}[t]{@{}c@{}}%
\mbox{}\\[-4.8mm]%%!!!  <-------- v3.0
{%\small
\fontsize{11pt}{0pt}\selectfont%
\thepage}\\[-5.7mm]%%!!!  <-------- v3.0
\phantom{%\scriptsize
\footnotesize[\@received\@revised\@published]}\hfill\mbox{}\\[-1.25mm]%\par%%
\phantom{%\scriptsize
\footnotesize[\@DOI]}\hfill\mbox{}\\[-.25mm]
\hbox to\textwidth{\small%\hfill
\phantom{%%%%%% !!! Not use
Nonlinear Theory and Its Applications,
IEICE, vol.\ \@VolForHeadings, no.\ \@NoForHeadings, pp.\ \pageref{NOLTA@firstpage}--\pageref{LastPage}%\fmt@month{\@Month}\hspace{2.5mm}
\hskip6mm{\copyright}IEICE\ \@Year%
}%%%%!!!
\hfill}%\hfill}}%
\end{tabular}}%
\hfill\@Rbot}%
      \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection\quad
        \fi
        ##1}}{}}%
    \def\subsectionmark##1{%
      \markright {%
        \ifnum \c@secnumdepth >\@ne
          \thesubsection\quad
        \fi
        ##1}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% first page (\maketitle)
\def\ps@OLDNOLTA{%
 \let\@mkboth\@gobbletwo
 \def\@oddhead{\@Ltop\hfil\@Rtop}%
 \let\@evenhead\@oddhead
 \def\@evenfoot{\@Lbot\hfil
  \@footpage{\normalfont\scriptsize
   JOURNAL\
   \@@No/\@@Year/\@Vol\@No--\@@footpage\,\NOLTA@copyright\,\@receivedyear\
   SOCIETY}%
  \hfil\@Rbot}%
 \let\@oddfoot\@evenfoot
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \def\ps@TITLEPAGEheadings{%
      \def\@evenhead{\leavevmode\smash{\raisebox{2mm}{\pushtowall{\hspace*{-25mm}%
\includegraphics{header-nolta}%
}}}%
\@Ltop%
\hfill\@Rtop}%
     \def\@oddhead{%
\leavevmode\smash{\raisebox{2mm}{\pushtowall{\hspace*{-25mm}%
\includegraphics{header-nolta}%
}}}%
\@Ltop%
\hfill\@Rtop}%
%%%%%%%%%%%%%%%%%%%%
% evenfoot
%%%%%%%%%%%%%%%%%%%%
    \def\@evenfoot{\@Lbot\hfill
\smash{\begin{tabular}[t]{@{}c@{}}%
\mbox{}\\[-4.8mm]%%%!!!  <-------- v3.0
{%\small
\fontsize{11pt}{0pt}\selectfont%
\phantom{\thepage}}\\[-5.7mm]%!!!  <-------- v3.0
{%\scriptsize
\phantom{\footnotesize[\@received\@revised\@published]}\hfill\mbox{}}%
\\[-1.25mm]%\par%%!!v28
{%\scriptsize
\phantom{\footnotesize[\@DOI]}\hfill\mbox{}}%%!!v28
\\[-.25mm]
\hbox to\textwidth{\footnotesize%%!! v28
\CClicense
Nonlinear Theory and Its Applications,
IEICE, vol.\ \@VolForHeadings,
no.\ \@NoForHeadings,
pp.\ \pageref{NOLTA@firstpage}--\pageref{LastPage}%\fmt@month{\@Month}\hspace{2.5mm}
\hskip3mm%6mm
{\copyright}IEICE\ \@Year%
\hskip3mm%6mm
{\footnotesize{\@DOI}}%%!!v28
\hfill}%\hfill}}%
\end{tabular}}%
\hfill\@Rbot}%
%%%%%%%%%%%%%%%%%%%%
% oddfoot
%%%%%%%%%%%%%%%%%%%%
\def\@oddfoot{\@Lbot\hfill%
\smash{\begin{tabular}[t]{@{}c@{}}%
\mbox{}\\[-4.8mm]%%!!!  <-------- v3.0
{%\small
\fontsize{11pt}{0pt}\selectfont%
\phantom{\thepage}}\\[-5.7mm]%!!!  <-------- v3.0
{%\scriptsize
\phantom{\footnotesize[\@received\@revised\@published]}\hfill\mbox{}}%%!!v28
\\[-1.25mm]%\par%%
{%\scriptsize
\phantom{\footnotesize[\@DOI]}\hfill\mbox{}}%%!!v28
\\[-.25mm]
\hbox to\textwidth{\footnotesize%%!!v28
\CClicense
Nonlinear Theory and Its Applications,
IEICE, vol.\ \@VolForHeadings,
no.\ \@NoForHeadings,
pp.\ \pageref{NOLTA@firstpage}--\pageref{LastPage}%\fmt@month{\@Month}\hspace{2.5mm}
\hskip3mm%6mm
{\copyright}IEICE\ \@Year%
\hskip3mm%6mm
{\footnotesize{\@DOI}}%%!!v28
\hfill}%\hfill}}%
\end{tabular}}%
\hfill\@Rbot}%
      \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markboth {\MakeUppercase{%
        \ifnum \c@secnumdepth >\z@
          \thesection\quad
        \fi
        ##1}}{}}%
    \def\subsectionmark##1{%
      \markright {%
        \ifnum \c@secnumdepth >\@ne
          \thesubsection\quad
        \fi
        ##1}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\sectionmark##1{%
      \markright {\MakeUppercase{%
        \ifnum \c@secnumdepth >\m@ne
          \thesection\quad
        \fi
        ##1}}}}
\fi







\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
    }




\newif\if@Esubtitle\@Esubtitlefalse

\def\subtitle#1{\gdef\@subtitle{#1}\@Esubtitletrue}
\def\@subtitle{\@latex@error{No \noexpand\subtitle given}\@ehc}

\def\@subtitle{}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% TITLE
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanksNOLTA
%%%
  \let \footnote\affiliate%%%%%%%%%%%%
%%%
  \null\vfil
%  \vskip 60\p@
  \begin{center}%
%
    {\huge \@title \par}%
    {\huge \@subtitle \par}%
    \vskip 3em%
    {\Large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\affiliate\relax%%%%%%%
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@jtitle\@empty%%%%
  \global\let\jtitle\relax%%%%%%
  \global\let\@title\@empty
  \global\let\etitle\relax
%%%
  \global\let\@jsubtitle\@empty
  \global\let\jsubtitle\relax
  \global\let\@subtitle\@empty
  \global\let\subtitle\relax
%%%
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
%%%%    ------------ \newcommand\maketitle{\par

\newdimen\MaketitleIntrosep
\MaketitleIntrosep=0mm

\def\maketitle{\@ifnextchar[{\maketitleHIKISU}{\maketitleNO}}



\def\maketitleNO{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote
}%
%%
%%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
 \thispagestyle{TITLEPAGEheadings}%{NOLTA}%    \thispagestyle{plain}\@thanks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%  affiliate
% \ifx\@affiliate\@undefined\else{%
%    \def\@makefntext{%\parindent1em
%\noindent\hangindent6mm\hangafter-20}
%    \footnotetext[0]{\@affiliate}%
%  }\fi
%  \global\let\@affiliate\@undefined
%%%%%%%  affiliate
%
%\ifx\@affiliate\@undefined\else{%\leavevmode\noindent%
%    \def\@makefntext{\small\leftskip2em%\parindent1em
%\noindent
%}
%%%
%%%
%\footnotetext[0]{%\leavevmode\noindent
%\@affiliate}%
%}\fi
%  \global\let\@affiliate\@undefined
%
%%%%%%%  end affiliate
%%%  Email
% \ifx\authors@mail\@undefined\else{%
%    \def\@makefntext{\small\leftskip2em%24\Q%2em%\parindent1em
%\noindent}
%    \footnotetext[0]{E-mail:\ \authors@mail}%
%  }\fi
  \global\let\authors@mail\@undefined
%%
%\centerline{\small[\@received\@revised\@published]}\par
%\centerline{\small[\@DOI]}
%\global\let\@received\@undefined
%\global\let\@revised\@undefined
%\global\let\@published\@undefined
%\global\let\@DOI\@undefined
\@titlenote
 \thispagestyle{TITLEPAGEheadings}%{NOLTA}
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
%%%%
  \global\let\@jtitle\@empty
  \global\let\jtitle\relax
  \global\let\@etitle\@empty
  \global\let\etitle\relax
%%%%
  \global\let\@jsubtitle\@empty
  \global\let\jsubtitle\relax
%%%%
  \global\let\@subtitle\@empty
  \global\let\subtitle\relax
%%%%
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
% \gdef\@received{}%
% \gdef\@revised{}%
% \gdef\@published{}%
%\setcounter{footnote}{-1}%
}




%%%% \maketitleHIKISU
\def\maketitleHIKISU[#1]{\par
\MaketitleIntrosep#1
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote
}%
%%
%%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{TITLEPAGEheadings}%{plain}\@thanks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%  affiliate
% \ifx\@affiliate\@undefined\else{%
%    \def\@makefntext{%\parindent1em
%\noindent\hangindent6mm\hangafter-20}
%    \footnotetext[0]{\@affiliate}%
%  }\fi
%  \global\let\@affiliate\@undefined
%%%%%%%  affiliate
%\ifx\@affiliate\@undefined\else{\leavevmode\noindent%
%    \def\@makefntext{\small\leftskip2em%\parindent1em
%\noindent
%}
%%%
%%%
%\footnotetext[0]{%\leavevmode\noindent
%\@affiliate}%
%}\fi
%  \global\let\@affiliate\@undefined
%%%%%%%  end affiliate
%%%  Email
% \ifx\authors@mail\@undefined\else{%
%    \def\@makefntext{\small\leftskip2em%24\Q%2em%\parindent1em
%\noindent}
%    \footnotetext[0]{E-mail:\ \authors@mail}%
%  }\fi
  \global\let\authors@mail\@undefined
%%
%\centerline{\small[\@received\@revised\@published]}\par
%\centerline{\small[\@DOI]}
\global\let\@received\@undefined
\global\let\@revised\@undefined
\global\let\@published\@undefined
\global\let\@DOI\@undefined
%
\@titlenote
 \thispagestyle{TITLEPAGEheadings}%{NOLTA}
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
%%%%
  \global\let\@subtitle\@empty
  \global\let\subtitle\relax
%%%%
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
% \gdef\@received{}%
% \gdef\@revised{}%
% \gdef\@published{}%
%\setcounter{footnote}{-1}%
}

%%%% \maketitleHIKISU






\newbox\@abstractbox
\newbox\@keywordsbox
\newbox\@affiliatebox

\def\abstract{%
 \global\setbox\@abstractbox\hbox\bgroup%
  \begin{minipage}[t]{\textwidth}% 12Q 16H
\fontsize{15\Q}{19\Q}\selectfont%\small%\baselineskip16\h
%\fontsize{\@ixpt}{16\Q}\selectfont%  \if@shortpaper
%   \small
%  \else
%   \normalsize\baselineskip16\@Q
%  \fi
%  \parindent1em
\noindent{\bfseries\textcolor[cmyk]{.2713,.9944,1,0}{Abstract:}}\
  \ignorespaces
}
\def\endabstract{%
%   \unskip\inhibitglue
\par%\smash{\pushtowall{\rule[0mm]{100mm}{.1mm}}}
  \end{minipage}%
 \egroup\ignorespaces}

\def\keywords{%
 \global\setbox\@keywordsbox\hbox\bgroup
  \begin{minipage}[t]{\textwidth}%{150mm}% 12Q 16H
\fontsize{15\Q}{20\Q}\selectfont
%\small\baselineskip16\h%\fontsize{\@ixpt}{16\Q}\selectfont%  \if@shortpaper
%   \small
%  \else
%   \normalsize\baselineskip16\@Q
%  \fi
%  \@hangfrom
{\bfseries\textcolor[cmyk]{.2713,.9944,1,0}{Key Words:}\ }%
  \kern\z@\ignorespaces
}
\def\endkeywords{%
%   \unskip\inhibitglue
\par%\smash{\pushtowall{\rule[0mm]{100mm}{.1mm}}}
  \end{minipage}%
 \egroup\ignorespaces}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newbox\@Mauthor
\def\Mauthor#1{\gdef\@Mauthor{#1}}

%%%%%%\color[cmyk]{0.1074,0.9881,0.8242,0}

\def\NOLTA@AUTHOR@sc#1{#1\fontsize{11\Q}{13\h}\selectfont}


\def\NOLTA@AUTHOR@color#1{\textcolor[cmyk]{0.1074,0.9881,0.8242,0}{#1}%\fontsize{11\Q}{13\h}\selectfont
}


%%% OLD  first character is made a color.
\def\fmt@AUTHOR@Ename#1{%
 \bgroup%
%  \normalsize\bfseries
%  \def\tr@AUTHOR@name##1 ##2\@nil{\NOLTA@AUTHOR@color##1 \protect\uppercase{\protect\NOLTA@AUTHOR@sc ##2}}%
  \def\tr@AUTHOR@name##1 ##2\@nil{\NOLTA@AUTHOR@color##1 ##2}%
  \protected@edef\@AUTHORNAME{\expandafter\tr@AUTHOR@name #1\@nil\null}%
  \@AUTHORNAME\,%
 \egroup%
}

%%% LAST all characters are black.
\def\fmt@AUTHOR@Ename#1{%
 \bgroup%
%  \normalsize\bfseries
%  \def\tr@AUTHOR@name##1 ##2\@nil{\NOLTA@AUTHOR@color##1 \protect\uppercase{\protect\NOLTA@AUTHOR@sc ##2}}%
  \def\tr@AUTHOR@name##1 ##2\@nil{##1 ##2}%
  \protected@edef\@AUTHORNAME{\expandafter\tr@AUTHOR@name #1\@nil\null}%
  \@AUTHORNAME\,%
 \egroup%
}





\long\def\AUTHORsc#1{%
  \fmt@AUTHOR@Ename{#1}%
}
%%%


%%%% Free MODE
%%% OLD  first character is made a color.
\def\fmt@AUTHOR@EnameSTAR#1{%
 \bgroup%
%  \normalsize\bfseries
%  \def\tr@AUTHOR@name##1 ##2\@nil{\NOLTA@AUTHOR@color##1 \protect\uppercase{\protect\NOLTA@AUTHOR@sc ##2}}%
  \def\tr@AUTHOR@nameSTAR##1##2\@nil{\NOLTA@AUTHOR@color##1##2}%
%  \protected@edef\@AUTHORNAME{\expandafter\tr@AUTHOR@name #1\@nil\null}%
  \protected@edef\@AUTHORNAMESTAR{\expandafter\tr@AUTHOR@nameSTAR #1\@nil\null}%
  \@AUTHORNAMESTAR\,%
 \egroup%
}



%%%% Free MODE
%%% LAST all characters are black.
\def\fmt@AUTHOR@EnameSTAR#1{%
 \bgroup%
%  \normalsize\bfseries
%  \def\tr@AUTHOR@name##1 ##2\@nil{\NOLTA@AUTHOR@color##1 \protect\uppercase{\protect\NOLTA@AUTHOR@sc ##2}}%
  \def\tr@AUTHOR@nameSTAR##1##2\@nil{##1##2}%
%  \protected@edef\@AUTHORNAME{\expandafter\tr@AUTHOR@name #1\@nil\null}%
  \protected@edef\@AUTHORNAMESTAR{\expandafter\tr@AUTHOR@nameSTAR #1\@nil\null}%
  \@AUTHORNAMESTAR\,%
 \egroup%
}



\long\def\AUTHORscSTAR#1{%
  \fmt@AUTHOR@EnameSTAR{#1}%
}
%%%






\newcounter{choshai}
\newcounter{choshaii}


\def\Nakaguro{,\space}
\def\NAkaguro{, and\ }

%\def\NAkaguro{,\ }






%%%%%%%%%%%%%%
\newif\ifAND \ANDfalse

\def\Nakaguro{,\space}
\def\NAkaguro{,\enskip and\ }
\def\NAkaMEguro{,\\ and\ }

\newif\ifCHOSHAHUTARI \CHOSHAHUTARIfalse
\def\NAkaguroHUTARI{\ and\ }




%\def\TESTREVi{1yoritiisai}
%\def\TESTREVii{2yoritiisai}


\long\def\authorentry#1{%
\setcounter{choshai}{\m@ne}%
\setcounter{choshaii}{\z@}%
\@for\member:=#1\do{\addtocounter{choshai}{\@ne}}%
\@for\member:=#1\do{\addtocounter{choshaii}{\@ne}%
\ifnum\c@choshaii<\c@choshai%
\ifnum\c@choshai<1\relax\expandafter%\J
\ignorespaces\member%
\else%
\ifnum\c@choshai<2\relax\member\Nakaguro%
\else\expandafter%\J
\ignorespaces\member\Nakaguro%
\fi\fi%
\else%
\ifnum\c@choshaii=\c@choshai\expandafter%\J
%%%%%%%%%%%%%%%%%%%%%%%%%%% 2
\ifnum\c@choshai=1
\ignorespaces\member\NAkaguroHUTARI%
\else%%%%%%%%%%%%%%%%%%%%%% 2
%%%
\ifAND
\ignorespaces\member\NAkaMEguro%
\else
\ignorespaces\member\NAkaguro%
\fi
\fi%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2
%%%
\else
\expandafter%\J
\ignorespaces\member%
\fi\fi%
}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%%%%% author
\newcounter{shozokusanshoui}
\newcounter{shozokusanshouii}


\def\COMMAi{,}
\def\COMMAii{,}


\def\AffiliateLabelRef#1{%%
\@for\refmember:=#1\do{\ref{\refmember}}%
}%%%


\long\def\AffiliateLabelRef#1{%
\setcounter{shozokusanshoui}{\m@ne}%
\setcounter{shozokusanshouii}{\z@}%
\@for\refmember:=#1\do{\addtocounter{shozokusanshoui}{\@ne}}%
\@for\refmember:=#1\do{\addtocounter{shozokusanshouii}{\@ne}%
\ifnum\c@shozokusanshouii<\c@shozokusanshoui%
 \ifnum\c@shozokusanshoui<1\relax\expandafter%\J
 \ref{\refmember}%
\else
\ifnum\c@shozokusanshoui<2\relax\ref{\refmember}\COMMAi%\Nakaguro%
\else \expandafter%\J
\ref{\refmember}\COMMAi%\Nakaguro%
\fi\fi
\else
\ifnum\c@shozokusanshouii=\c@shozokusanshoui\expandafter%\J
\ref{\refmember}\COMMAii%\NAkaguro%
\else
\expandafter%\J
\ref{\refmember}%
\fi\fi
}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\@definecounter{NOLTAauthorNOLTAaffiliate}
\def\theNOLTAauthorNOLTAaffiliate{\@arabic\c@NOLTAauthorNOLTAaffiliate}


\@definecounter{NOLTAauthor}
\def\theNOLTAauthor{\@arabic\c@NOLTAauthor}




%%%
%\def\OLDauthor#1#2{\refstepcounter{NOLTAauthor}%\theNOLTAauthor%
%\AUTHORsc{#1}$^\mathrm{\AffiliateLabelRef{#2}}$\ignorespaces%
%}
%
%\def\author{\@ifstar{\@author}{\author@normal}}
%
%%% usualy, SECOND NAME,  First NAME
%\def\author@normal#1#2{\refstepcounter{NOLTAauthor}%\theNOLTAauthor%
%\AUTHORsc{#1}$^\mathrm{\AffiliateLabelRef{#2}}$\ignorespaces%
%}
%
%%% as You like
%\def\@author#1#2{\refstepcounter{NOLTAauthor}%\theNOLTAauthor%
%#1$^\mathrm{\AffiliateLabelRef{#2}}$\ignorespaces%
%}


%%% \author or \author*


\RequirePackage{tikz}
\usetikzlibrary{svg.path}


\definecolor{orcidlogocol}{HTML}{A6CE39}
\tikzset{
  orcidlogo/.pic={
    \fill[orcidlogocol] svg{M256,128c0,70.7-57.3,128-128,128C57.3,256,0,198.7,0,128C0,57.3,57.3,0,128,0C198.7,0,256,57.3,256,128z};
    \fill[white] svg{M86.3,186.2H70.9V79.1h15.4v48.4V186.2z}
                 svg{M108.9,79.1h41.6c39.6,0,57,28.3,57,53.6c0,27.5-21.5,53.6-56.8,53.6h-41.8V79.1z M124.3,172.4h24.5c34.9,0,42.9-26.5,42.9-39.7c0-21.5-13.7-39.7-43.7-39.7h-23.7V172.4z}
                 svg{M88.7,56.8c0,5.5-4.5,10.1-10.1,10.1c-5.6,0-10.1-4.6-10.1-10.1c0-5.6,4.5-10.1,10.1-10.1C84.2,46.7,88.7,51.3,88.7,56.8z};
  }
}


\newcommand{\@OrigHeightRecip}{0.00390625}

%% We will compute the current X height to make the logo the right height
\newlength{\@curXheight}

%    \end{macrocode}
%
% \begin{macro}{\orcidlink}
%    \begin{macrocode}
\DeclareRobustCommand\orcidmark[1]{%
\hskip1mm%%!!
\scalebox{1.25}{\texorpdfstring{%
\setlength{\@curXheight}{\fontcharht\font`A}%
\href{https://orcid.org/#1}{%
\rlap{\textcolor{white}{\resizebox{\@curXheight}{\@curXheight}{A}}}%
\XeTeXLinkBox{\mbox{%
\begin{tikzpicture}[yscale=-\@OrigHeightRecip*\@curXheight,
xscale=\@OrigHeightRecip*\@curXheight,transform shape]
\pic{orcidlogo};
\end{tikzpicture}%
}}}}{}}\hskip1mm%%!!
}

\def\orcid@from@aux#1{%
\ifcsname orcid@for@#1\endcsname
\expandafter\orcidmark\expandafter{\@nameuse{orcid@for@#1}}%
\fi
}


\def\author{\@ifstar{\@author}{\author@normal}}

\def\author@normal{\@ifnextchar[{\author@normalARI}{\author@normalNO}}


\def\author@normalARI[#1]#2#3{\refstepcounter{NOLTAauthor}%\theNOLTAauthor%
\AUTHORsc{#2}%%\orcidmark{#5}%
\expandafter\orcid@from@aux\expandafter{\theNOLTAauthor}%
{\mathversion{bold}$^{\mathit{\AffiliateLabelRef{#3}}\mbox{\normalsize\textit{\EmailLabelRef{#1})}}%
}$}%
%%#4{#5}
\ignorespaces%
}

\def\author@normalNO#1#2{\refstepcounter{NOLTAauthor}%\theNOLTAauthor%
\AUTHORsc{#1}%%\orcidmark{#4}%
\expandafter\orcid@from@aux\expandafter{\theNOLTAauthor}%
{\mathversion{bold}$^\mathit{\AffiliateLabelRef{#2}}$}%
%%#3{#4}
\ignorespaces%
}


\def\@author{\@ifnextchar[{\@authorARI}{\@authorNO}}

\def\@authorARI[#1]#2#3{\refstepcounter{NOLTAauthor}%\theNOLTAauthor%
\AUTHORscSTAR{#2}%%\orcidmark{#5}%
\expandafter\orcid@from@aux\expandafter{\theNOLTAauthor}%
{\mathversion{bold}$^{\mathit{\AffiliateLabelRef{#3}}\mbox{\normalsize\textit{\EmailLabelRef{#1})}}%
}$}%
%%#4{#5}
\ignorespaces%
}

\def\@authorNO#1#2{\refstepcounter{NOLTAauthor}%\theNOLTAauthor%
\AUTHORscSTAR{#1}%%\orcidmark{#4}%
\expandafter\orcid@from@aux\expandafter{\theNOLTAauthor}%
{\mathversion{bold}$^\mathit{\AffiliateLabelRef{#2}}$}%
%%#3{#4}
\ignorespaces%
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\long\def\AUTHOR{\@ifstar{\AUTHOR@and}{\AUTHOR@normal}}
\long\def\AUTHOR@and#1{\ANDtrue\ignorespaces\Mauthor{\ignorespaces\authorentry{#1}\ignorespaces}\ignorespaces}
\long\def\AUTHOR@normal#1{\ignorespaces\Mauthor{\ignorespaces\authorentry{#1}\ignorespaces}\ignorespaces}



%%%%%%%% affiliate %%%%%
\def\affimark#1{%
\def\@tempMARK{#1}
%
\def\MARKA{asterisk}\def\MARKB{arabic}%
\ifx \@tempMARK\MARKA \let\NOLTA@fnsymbol\asterisk@fnsymbol
\else
\ifx \@tempMARK\MARKB \let\NOLTA@fnsymbol\arabic@fnsymbol
\else
\fi
\fi
}



%%%%%%%% asterisk %%%%%
\def\asterisk@fnsymbol#1{%
 \ifnum\c@NOLTAauthorNOLTAaffiliate%\chk@alcnt
>9\relax
  \ifcase #1\or {*}1\or {*}2\or {*}3\or {*}4\or {*}5\or {*}6\or {*}7\or
   {*}8\or {*}9\or {*}10\or {*}11\or {*}12\or {*}13\or {*}14\or {*}15\or
    \dagger
   \else\@ctrerr\fi\relax
 \else
  \ifcase #1\or{*}\or {*}{*}\or {*}{*}{*}\or {*}{*}{*}{*}\or
   {*}{*}{*}{*}{*}\or {*}{*}{*}{*}{*}{*}\or {*}{*}{*}{*}{*}{*}{*}\or
   {*}{*}{*}{*}{*}{*}{*}{*}\or {*}{*}{*}{*}{*}{*}{*}{*}{*}\or
    \or \or \or \or \or \or \dagger
   \else\@ctrerr\fi\relax
 \fi%
}


%%%%%%%% arabic %%%%%
\def\arabic@fnsymbol#1{%
 \ifnum\c@NOLTAauthorNOLTAaffiliate%\chk@alcnt
>9\relax
  \ifcase #1\or {10}\or {11}\or {12}\or {13}\or {14}\or {15}\or {16}\or
   {17}\or {18}\or {19}\or {20}\or {21}\or {22}\or {23}\or {24}\or
    \dagger
   \else\@ctrerr\fi\relax
 \else
  \ifcase #1\or{1}\or {2}\or {3}\or {4}\or
   {5}\or {6}\or {7}\or
   {8}\or {9}\or
    \or \or \or \or \or \or \dagger
   \else\@ctrerr\fi\relax
 \fi%
}


%%%% standard
\def\NOLTA@fnsymbol#1{%
 \ifnum\c@NOLTAauthorNOLTAaffiliate%\chk@alcnt
>9\relax
  \ifcase #1\or {\dag}1\or {\dag}2\or {\dag}3\or {\dag}4\or {\dag}5\or {\dag}6\or {\dag}7\or
   {\dag}8\or {\dag}9\or {\dag}10\or {\dag}11\or {\dag}12\or {\dag}13\or {\dag}14\or {\dag}15\or
    \dagger
   \else\@ctrerr\fi\relax
 \else
  \ifcase #1\or{\dag}\or {\dag}{\dag}\or {\dag}{\dag}{\dag}\or {\dag}{\dag}{\dag}{\dag}\or
   {\dag}{\dag}{\dag}{\dag}{\dag}\or {\dag}{\dag}{\dag}{\dag}{\dag}{\dag}\or {\dag}{\dag}{\dag}{\dag}{\dag}{\dag}{\dag}\or
   {\dag}{\dag}{\dag}{\dag}{\dag}{\dag}{\dag}{\dag}\or {\dag}{\dag}{\dag}{\dag}{\dag}{\dag}{\dag}{\dag}{\dag}\or
    \or \or \or \or \or \or \dagger
   \else\@ctrerr\fi\relax
 \fi%
}



%%%%%%%% alph %%%%%
\def\alph@fnsymbol#1{%
  \ifcase #1\or{a)}\or {b)}\or {c)}\or {d)}\or
   {e)}\or {f)}\or {g)}\or
   {h)}\or {i)}\or {j)}\or {k)}\or {l)}\or
    {m)}\or {n)}\or {o)}\or {p)}\or {q)}\or {r)}\or
   {s)} \or {t)} \or {u)} \or {v)} \or {w)} \or {x)}\or
   {y)} \or {z)}
\else\fi%   \else\@ctrerr\fi\relax
}



%%%%%%%% alph %%%%%
\def\alph@fnsymbol#1{%
  \ifcase #1\or{a}\or {b}\or {c}\or {d}\or
   {e}\or {f}\or {g}\or
   {h}\or {i}\or {j}\or {k}\or {l}\or
    {m}\or {n}\or {o}\or {p}\or {q}\or {r}\or
   {s} \or {t} \or {u} \or {v} \or {w} \or {x}\or
   {y} \or {z}
\else\fi%   \else\@ctrerr\fi\relax
}


\newbox\@Maffiliate
\def\Maffiliate#1{\setbox\@Maffiliate=\hbox{\begin{tabular}{l}#1\end{tabular}}%
}


\def\Maffiliate#1{\setbox\@Maffiliate=\hbox{#1}%
}


%\def\Maffiliate#1{#1}
\def\Maffiliate#1{\setbox\@Maffiliate=\hbox{#1}%
}





%%% \box
\long\def\affiliate#1#2{%\begin{Flushleft}
{\def\thempfn{}%
%\leftskip2.5mm%%%
%\small
%\fontsize{16\Q}{25\Q}\itshape\selectfont
\fontsize{14\Q}{19\Q}\itshape\selectfont
%  \let\@arabic\NOLTA@fnsymbol
\refstepcounter{NOLTAauthorNOLTAaffiliate}%
\label{#2}%
\leavevmode%
\hspace*{-11.552pt}\hbox to11.552pt%
%\hspace*{-17.41687pt}\hbox to14.41687pt%
{\hss\mathversion{bold}$^\mathit{\ref{#2}}$\,}%\setbox0=\hbox{$^\mathrm{\ref{#2}}$}\the\wd0%
#1%
}%
%\end{Flushleft}%
\vskip.5\baselineskip}


\newenvironment{shozokulist}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\shozokulabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}





\newcounter{shozokui}
\newcounter{shozokuii}


\def\KAIGYOi{\\\ignorespaces}
\def\KAIGYOii{\\\ignorespaces}


\def\KAIGYOi{\par\ignorespaces}
\def\KAIGYOii{\par\ignorespaces}



\long\def\affiliateentry#1{%
\setcounter{shozokui}{\m@ne}%
\setcounter{shozokuii}{\z@}%
\@for\member:=#1\do{\addtocounter{shozokui}{\@ne}}%
\@for\member:=#1\do{\addtocounter{shozokuii}{\@ne}%
\ifnum\c@shozokuii<\c@shozokui%
\ifnum\c@shozokui<1\relax\expandafter%\J
\ignorespaces\member%
\else%
\ifnum\c@shozokui<2\relax\member\KAIGYOi%\Nakaguro%
\else \expandafter%\J
\ignorespaces\member\KAIGYOi%\Nakaguro%
\fi\fi%
\else%
\ifnum\c@shozokuii=\c@shozokui\expandafter%\J
\ignorespaces\member\KAIGYOii%\NAkaguro%
\else%
\expandafter%\J
\ignorespaces\member%
\fi\fi%
}}



\long\def\AFFILIATE#1{%\noindent\ignorespaces\parindent0pt
\Maffiliate{\gdef\@affiliate{\affiliateentry{
%\begin{Center}%{Flushleft}
#1
%\end{Center}%{Flushleft}
}}}}




%%% email output



\@definecounter{NOLTAauthorNOLTAmail}
\def\theNOLTAauthorNOLTAmail{\@arabic\c@NOLTAauthorNOLTAmail}


%%% \box
\def\email#1#2{{\def\thempfn{}%
%\leftskip2.5mm%%%
%\small
%\fontsize{16\Q}{25\Q}\itshape\selectfont
%
  \let\@arabic\alph@fnsymbol
\refstepcounter{NOLTAauthorNOLTAmail}%
\label{#2}%
\leavevmode%
\hspace*{-11.552pt}\hbox to11.552pt%
%\hspace*{-17.41687pt}\hbox to14.41687pt%
{\hss\mathversion{bold}$^\mathit{\ref{#2}\mbox{\scriptsize\it\bfseries)}}$\,}%\setbox0=\hbox{$^\mathrm{\ref{#2}}$}\the\wd0%
#1%
}%
}


\newenvironment{EMAILlist}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\EMAILlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}





\newcounter{EMAILi}
\newcounter{EMAILii}




\long\def\emailentry#1{%
\setcounter{EMAILi}{\m@ne}%
\setcounter{EMAILii}{\z@}%
\@for\member:=#1\do{\addtocounter{EMAILi}{\@ne}}%
\@for\member:=#1\do{\addtocounter{EMAILii}{\@ne}%
\ifnum\c@EMAILii<\c@EMAILi%
 \ifnum\c@EMAILi<1\relax\expandafter%\J
\ignorespaces\member%
\else
\ifnum\c@EMAILi<2\relax\member\KAIGYOi%\Nakaguro%
\else \expandafter%\J
\ignorespaces\member\KAIGYOi%\Nakaguro%
\fi\fi
\else
\ifnum\c@EMAILii=\c@EMAILi\expandafter%\J
\ignorespaces\member\KAIGYOii%\NAkaguro%
\else
\expandafter%\J
\ignorespaces\member%
\fi\fi
}}



\newbox\@Memail

\def\Memail#1{\setbox\@Memail=\hbox{#1}%
}

\let\authors@mail\relax
\long\def\EMAIL#1{\Memail{\gdef\authors@mail{\emailentry{#1}}}}





%%%%%%%% authot
\newcounter{emailsanshoui}
\newcounter{emailsanshouii}


%\def\COMMAi{,}
%\def\COMMAii{,}


\def\EmailLabelRef#1{%%
\@for\emailaddress:=#1\do{\ref{\emailaddress}}%
}%%%


\long\def\EmailLabelRef#1{%
\setcounter{emailsanshoui}{\m@ne}%
\setcounter{emailsanshouii}{\z@}%
\@for\emailaddress:=#1\do{\addtocounter{emailsanshoui}{\@ne}}%
\@for\emailaddress:=#1\do{\addtocounter{emailsanshouii}{\@ne}%
\ifnum\c@emailsanshouii<\c@emailsanshoui
 \ifnum\c@emailsanshoui<1\relax\expandafter%\J
 \ref{\emailaddress}%
\else
\ifnum\c@emailsanshoui<2\relax\ref{\emailaddress}\COMMAi%\Nakaguro%
\else \expandafter%\J
\ref{\emailaddress}\COMMAi%\Nakaguro%
\fi\fi
\else
\ifnum\c@emailsanshouii=\c@emailsanshoui\expandafter%\J
\ref{\emailaddress}\COMMAii%\NAkaguro%
\else
\expandafter%\J
\ref{\emailaddress}%
\fi\fi
}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




























\newdimen\titlelength
\titlelength=160mm%\textwidth

%\def\title#1{\gdef\@title{\begin{tabular}{@{}p{\titlelength}@{}}\raggedright#1\end{tabular}}}

%\def\@title{\@latex@error{No \noexpand\title given}\@ehc}




%%%% standard


\newdimen\titleabstractsep
\titleabstractsep8mm%4.25mm%6.25mm 32\Q

\def\@maketitle{%
  \newpage
  \null
%  \vskip 2em%
  \bgroup\hbadness10001%
   \small
  \egroup%\vspace*{-6mm}%{3mm}%%% 15
%%
\vspace*{-.75mm}%%
 \noindent {\fontsize{18.5\Q}{29\Q}%\bfseries
%%%%
  \usefont{OT1}{ptm}{b}{n}\selectfont%Times-Bold*
  \paper@type
  }%
\vspace*{1mm}%%
%%
  \begin{Center}%\hbadness10001%
  \let \footnote \thanks
%{\fboxsep=0pt\colorbox{red}{%
%\vbox to\TITLEheight{%
%
%\fboxsep=0pt\fcolorbox{green}{red}{%
%\vbox% to\Titleheight
%{%
\begin{tabular}{@{}p{\titlelength}@{}}\raggedright
    {\mathversion{bold}%
    %%%%
    \usefont{OT1}{ptm}{b}{n}%Times-Bold*
    %%%%
    \fontsize{34\Q}{46\Q}\selectfont\bfseries
    \color[cmyk]{1,0.9132,0.2181,0} \@title\par}%
%\vskip2mm
    \ifx\@subtitle\empty\vspace*{-2mm}\else
%    {\mathversion{bold}\LARGE\XXIQ\bfseries \@subtitle \par}\vss}\fi}}
    \vspace*{-1mm}{\mathversion{bold}\fontsize{28\Q}{34}\selectfont\bfseries
      \color[cmyk]{1,0.9132,0.2181,0}\@subtitle \par}\fi%\vss
%}%}}
\par%
\vspace*{12.25mm}%{7.75mm}%{-2.25mm}%\vskip6mm%-1mm%    \vskip 1.5em%
    {\fontsize{18.5\Q}{29\Q}\bfseries\itshape\selectfont
%      \lineskip .5em%
      \begin{tabular}[t]{@{}l}%
\@Mauthor\par%\box\@Mauthor%
%        \@author
      \end{tabular}\vfill
\par}
%\vss}%}}%%
%    \vskip 1em%
%    {\large \@date}%
\end{tabular}
  \end{Center}%
  \par
\vskip-\topskip%16\Q%%%
%
{\begin{tabular}{@{\hspace*{9mm}}p{145.25mm}}
\begin{Flushleft}%
{\fontsize{14\Q}{19\Q}\bfseries\itshape\selectfont
%\textcolor[cmyk]{.8079,.2519,1,0}{\@affiliate}}\end{Flushleft}%
\@affiliate}\end{Flushleft}%
\par
\vskip1mm
%\noindent
%%%%% e-mail color
%%{\fontsize{15\Q}{21\Q}\bfseries\itshape\selectfont\textcolor[cmyk]{.9464,.3915,.0668,0}{\,\authors@mail}}\\
{\fontsize{15\Q}{21\Q}\bfseries\itshape\selectfont\,\authors@mail}\\
\end{tabular}}
\par
%%%
%%\label{NOLTA@firstpage}
%%
%\vskip10mm\centerline{\small[\@received\@revised\@published]}\par
%-----------------------------------------------------------
%
%\vskip6mm%
\vskip1.5\baselineskip%!! <-------- 3.0
\noindent{\fontsize{15\Q}{19\Q}\selectfont%
\@received\@revised\@published}\par%%%!! v28
%-----------------------------------------------------------
%
%\vskip\titleabstractsep%6.25mm%% 32Q
%\vskip6mm%
\vskip1.5\baselineskip%%!! <-------- 3.0
%\begin{tabular}[t]{c}%
  \ifvoid\@abstractbox
   \vskip-1\baselineskip
  \else
%   \hfil
\box\@abstractbox\par
  \fi
%\end{tabular}
  \ifvoid\@keywordsbox
  \else
   \vskip15\Q
%   \hfil
\box\@keywordsbox\par
  \fi
%%%
%
%  \vskip 2\Cvs%\box\Entrybox
%\footnotetext{\box\@affiliatebox}
%\box\@Maffiliate
%\box\@affiliatebox%\@affiliate
\vskip8.25mm\addvspace{\MaketitleIntrosep}%
}
\fi




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thesection {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\part{%
   \if@noskipsec \leavevmode \fi
   \par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >\m@ne
       \Large\bfseries \partname\nobreakspace\thepart
       \par\nobreak
     \fi
     \huge \bfseries #2%
     \markboth{}{}\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@spart#1{%
    {\parindent \z@ \raggedright
     \interlinepenalty \@M
     \normalfont
     \huge \bfseries #1\par}%
     \nobreak
     \vskip 3ex
     \@afterheading}






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% normal from latex.ltx
\def\@startsection#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssect{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}
\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa>\z@
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \else
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \fi
  \ignorespaces}
\def\@seccntformat#1{\csname the#1\endcsname\ }%%% change
\def\@ssect#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M #5\@@par}%
    \endgroup
  \else
    \def\@svsechd{#4{\hskip #1\relax #5}}%
  \fi
  \@xsect{#3}}


\newbox\@tempboxb
\newdimen\SECTwd







%% Y
\def\@startsectionY#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssectY{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sectY{#1}{#2}{#3}{#4}{#5}{#6}}}}
\def\@sectY#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformatY{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6 {%
        \@hangfrom{\hskip #3\relax\@svsec}%
          \interlinepenalty \@M #8\@@par
\nopagebreak% %
\vskip4.5pt\vskip-1mm% %
\offinterlineskip
\textcolor{black!50}{\hrule}% %
}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}
\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa>\z@
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \else
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \fi
  \ignorespaces}
\def\@seccntformatY#1{\csname the#1\endcsname.\ }
\def\@ssectY#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M #5\@@par
\nopagebreak% %
\vskip4.5pt\vskip-1mm% %
\offinterlineskip
\textcolor{black!50}{\hrule}% %
}%
    \endgroup
  \else
    \def\@svsechd{#4{\hskip #1\relax #5}}%
  \fi
  \@xsect{#3}}





\newcommand{\section}{\@startsection{section}{1}{0em}%
%   {.75\Cvs \@plus.1mm \@minus.1mm}%
%   {.25\Cvs \@plus.1mm \@minus.1mm}%
%   {4.125mm \@plus.25mm \@minus.5mm}%
%   {.125\Cvs \@plus0.25mm \@minus0.5mm}%
%   {4.125mm \@plus.125mm \@minus.25mm}%
%   {.125\Cvs \@plus-.125mm \@minus-.25mm}%
   {.00001\Cvs \@plus.00001mm \@minus.00001mm}%
   {.00001\Cvs \@plus.00001mm \@minus.00001mm}%
   {\reset@font\large%\slshape
\bfseries
\mathversion{bold}%
}}


\renewcommand\section{\@startsectionY {section}{1}{\z@}%
%                     {-1\baselineskip \@plus -1ex \@minus -.2ex}%
                     {-3.1mm \@plus -1ex \@minus -.2ex}%
%                     {6.5pt \@plus.2ex}%%\@tempskipa!!!
                     {1.50mm \@plus.2ex}%%\@tempskipa!!!
                     {\reset@font\large%\slshape
                      \fontsize{18\Q}{24\Q}\selectfont\bfseries
                      \mathversion{bold}}}




\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
%                      {-1\baselineskip\@plus -1ex \@minus -.2ex}%
                      {-3.6mm\@plus -1ex \@minus -.2ex}%
                      {.0001pt \@plus .2ex}%
                      {\reset@font%\large%\slshape
                       \fontsize{16\Q}{22\Q}\selectfont\bfseries
                       \mathversion{bold}}}

\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                         {-1\baselineskip\@plus -1ex \@minus -.2ex}%
                         {.0001pt \@plus .2ex}%
                         {\reset@font\large%\slshape
                          \fontsize{14\Q}{19\Q}\selectfont\bfseries
                          \mathversion{bold}}}

\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                     {1\baselineskip \@plus1ex \@minus.2ex}%
                     {-1em}%
                     {\reset@font\large%\slshape
                      \fontsize{14\Q}{19\Q}\selectfont\bfseries
                      \mathversion{bold}}}

\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                        {3.25ex \@plus1ex \@minus .2ex}%
                        {-1em}%
                        {\reset@font\large%\slshape
                         \fontsize{14\Q}{19\Q}\selectfont\bfseries
                         \mathversion{bold}}}













%% M
\def\@startsectionM#1#2#3#4#5#6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssectM{#3}{#4}{#5}{#6}}%
    {\@dblarg{\@sectM{#1}{#2}{#3}{#4}{#5}{#6}}}}
\def\@sectM#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsecM\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsecM{\@seccntformatM{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax\@svsecM}%
          \interlinepenalty \@M #8\@@par
\nopagebreak% %
\vskip4.5pt% %
\offinterlineskip
\textcolor{black!50}{\hrule}% %
}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechdM{%
      #6{\hskip #3\relax
      \@svsecM #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsectM{#5}}
\def\@xsectM#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa>\z@
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \else
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechdM \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \fi
  \ignorespaces}
\def\@seccntformatM#1{\csname the#1\endcsname\quad}
\def\@ssectM#1#2#3#4#5{%
  \@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
    \begingroup%
      #4{%
        \@hangfrom{\hskip #1}%
          \interlinepenalty \@M
      \smash{\pushtowall{\textcolor[cmyk]{.0994,.8008,.3452,0}{\rule[-1mm]{\textwidth}{5.5mm}}}#5}\rule{0mm}{4.5mm}
\@@par
\nopagebreak% %
\vskip4.5pt% %
\offinterlineskip
%\textcolor[cmyk]{.0994,.8008,.3452,0}{\hrule height 5.5mm}% %
}%
    \endgroup
  \else
    \def\@svsechdM{#4{\hskip #1\relax #5}}%
  \fi
  \@xsectM{#3}}


%% changed to the underline.
\newcommand\Othersection{\@startsectionY {section}{1}{\z@}%
                     {-3.1mm \@plus -1ex \@minus -.2ex}%
                     {1.50mm \@plus.2ex}%%\@tempskipa!!!
                     {\reset@font\large%\slshape
                      \fontsize{16\Q}{22\Q}\selectfont\bfseries
                      \mathversion{bold}}}




\newcommand{\appendix}{\Othersection*{Appendix}}


\newcommand{\acknowledgments}{\Othersection*{Acknowledgments}}
\newcommand{\dataavailability}{\Othersection*{Data availability}}
\newcommand{\funding}{\Othersection*{Funding}}
\newcommand{\conflictsofinterest}{\Othersection*{Conflicts of interest}}
\newcommand{\aitools}{\Othersection*{Artificial intelligence tools}}
\newcommand{\authorcontribution}{\Othersection*{Author contribution}}
\newcommand{\ethics}{\Othersection*{Ethics approval and consent to participate}}
\newcommand{\patientconsent}{\Othersection*{Patient consent for publication}}








\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}






\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\if@compatibility
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
%      \thispagestyle{empty}%
 \thispagestyle{TITLEPAGEheadings}%{NOLTA}
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
%      \thispagestyle{empty}%
 \thispagestyle{TITLEPAGEheadings}%{NOLTA}
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi










\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.12mm}%{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.12mm}%{.4\p@}
\renewcommand \theequation {\@arabic\c@equation}



%%%%
%\def\@floatboxreset{%
%        \reset@font
%        \footnotesize
%        \@setminipage
%}



\def\@floatenv{%
 \let\center\Center
% \def\verbatimsize{\small}%
}


\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}



\newcounter{figure}
\renewcommand \thefigure {\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@floatenv\abovecaptionskip4.5pt\belowcaptionskip\z@\let\center=\Center\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@floatenv\capwidth.67\textwidth\abovecaptionskip4.5pt\belowcaptionskip\z@\let\center=\Center\@dblfloat{figure}}
               {\end@dblfloat}



\newcounter{table}
\renewcommand\thetable{\@Roman\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}

%\newenvironment{table}
%               {\floatenv\abovecaptionskip\z@\belowcaptionskip4.5pt\let\center=\Center\@float{table}}
%               {\end@float}

\newenvironment{table}
{\setlength\abovecaptionskip{\z@}
\setlength\belowcaptionskip{4.5pt}
\@floatenv
\@float{table}}
               {\end@float}

\newenvironment{table*}
               {\floatenv\capwidth.67\textwidth\abovecaptionskip\z@\belowcaptionskip1.25mm\let\center=\Center\@dblfloat{table}}
               {\end@dblfloat}





\long\def\@ORGmakecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}


\def\NOLTA@shortstack{\@ifnextchar[% ]
 \@NOLTA@shortstack{\@NOLTA@shortstack[c]}}
\def\@NOLTA@shortstack[#1]{%
  \leavevmode
  \vbox\bgroup
    %%\baselineskip-\p@\lineskip 3\p@
    \let\mb@l\hss\let\mb@r\hss
    \expandafter\let\csname mb@#1\endcsname\relax
    \let\\\@stackcr
    \@ishortstack}

\long\def\@caption#1[#2]#3{\par
 %%\addcontentsline{\csname ext@#1\endcsname}{#1}%
 %% {\protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}%
 \begingroup
  \@parboxrestore
  \if@minipage
   \@setminipage
  \fi
  \small
  \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
 \endgroup}



\newdimen\capwidth
\capwidth=115mm

\long\def\@makecaption#1#2{%
 \vskip\abovecaptionskip
 \setbox\@tempboxa\hbox{{\bf#1.}\hskip1em\NOLTA@shortstack[l]{#2}}%
 \@tempdima \ht\@tempboxa
 \advance \@tempdima \dp\@tempboxa
 \setbox\@tempboxb\hbox{{\bf#1.}\hskip1em}%
 \ifdim \@tempdima > \baselineskip
  \ifdim \wd\@tempboxa > \capwidth
   \hfil\parbox[t]{\capwidth}{%\hangindent\wd\@tempboxb
    {\bf#1.}\hskip1em #2}\par
    \hrule \@height \z@
  \else
   \hfil\parbox[t]{\wd\@tempboxa}{%\hangindent\wd\@tempboxb
    {\bf#1.}\hskip1em #2}\par
    \hrule \@height \z@
  \fi
 \else
  \ifdim \wd\@tempboxa > \capwidth
   \hfil\parbox[t]{\capwidth}{%\hangindent\wd\@tempboxb
    {\bf#1.}\hskip1em #2}\par
    \hrule \@height \z@
  \else
   \hbox to\hsize{\hss\box\@tempboxa\hss}%
  \fi
 \fi
 \vspace{\belowcaptionskip}%
}




\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    }
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty\@secpenalty
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
      \fi
    \endgroup
  \fi}
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{10em}{5em}}
\newcommand\listoffigures{%
    \section*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure



\newcommand{\references}{\Othersection*{References}}

\newdimen\bibindent
\setlength\bibindent{1.5em}
\def\@biblabel#1{[#1]}





%\def\@lbibitem[#1]#2{\item[\hypertarget{#2}{\@biblabel{#1}}\hfill]%
%      \if@filesw
%      {\let\protect\noexpand
%       \immediate
%       \write\@auxout{\string\bibcite{#2}{#1}}}\fi\ignorespaces}

%\def\@bibitem#1{\hypertarget{#1}{\item}%
%       \if@filesw \immediate\write\@auxout
%       {\string\bibcite{#1}{\the\value{\@listctr}}}\fi\ignorespaces}


\newenvironment{thebibliography}[1]
     {\references
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
        \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
            \leftmargin\labelwidth
            \advance\leftmargin\parindent%\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}







\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty


\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width \columnwidth
  \kern2.6\p@}
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Fig.}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}%{plain}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi





%%%% 60
\setlength{\textheight}{51\baselineskip}%%%%% 52L
%\setlength{\textheight}{45\baselineskip}%%%%%
\addtolength{\textheight}{\topskip}%

%%%%
\setlength{\textwidth}{160mm}%{708\Q} %%
\setlength\paperheight {297mm}% 	a5
\setlength\paperwidth  {210mm}%
%\setlength{\footskip}{8mm}

%%%
\setlength{\parindent}{14\Q}
\setlength{\parskip}{0mm}













%%%
%%%
%%%
%%%A4
%\paperwidth210mm
%\paperheight297mm

\columnsep7mm

%\headsep7mm
%\footskip9.25mm



%%%
%\textwidth81.25mm
%\textwidth2\textwidth
%\advance\textwidth6.5mm



\oddsidemargin\paperwidth
\advance\oddsidemargin-\textwidth
\oddsidemargin.5\oddsidemargin
\advance\oddsidemargin-1in
\evensidemargin\oddsidemargin

\topmargin=-6mm%-9mm
%\advance\topmarginmm%-13.5mm
%\topmargin0mm
%\advance\topmargin-1in
%\advance\topmargin-\headsep
%\advance\topmargin-\headheight
%\newdimen\TenTi
%\TenTi=\topmargin\advance\paperheight-\textheight
%\TenTi=.5\TenTi
%\advance\topmargin-\TenTi
%\topmargin0pt%-28.5pt
%\headsep0pt
%\headheight0pt
%\advance\topmargin-.5in













%%
%%%%%%%%%%%%% \MARU %%%%%%%%%%%%%%%%%%%
\def\MARU#1{\raisebox{0.1zh}{{\rm\ooalign{\hfil
\lower.168ex\hbox{#1}\hfil\crcr\mathhexbox20D}}}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
















\newenvironment{biography}{%
 \footnotesize\normalfont
 \parindent\z@
 \vskip\baselineskip
 \penalty\@medpenalty
 \hbox to \hsize{\leaders
  \hbox{\vrule \@width.1mm \@height 1mm\hskip.4mm}\hfil}%
 \penalty\@M
  \let\@profile\@eprofile
  \let\n@profile\n@eprofile
\vskip1\Cvs%  \vskip2mm
 }{\vskip3.75mm%\ifNoPhotoII \vskip-3mm\else\vskip3.75mm\fi%-1mm%%% 4mm aki
   \hbox to \hsize{\leaders
    \hbox{\vrule \@width.1mm \@height 1mm\hskip.4mm}\hfil}\par
  }

\def\profile{\@ifstar{\n@profile}{\@profile}}

%% \t{oo} causes error
\def\NOLTA@sc#1{#1\fontsize{9\JQ}{13\h}\selectfont}

\newcounter{profile}










\def\fmt@pro@Ename#1#2{%
 \bgroup
  \normalsize\bfseries
  \def\tr@name##1 ##2\@nil{##1 \protect\uppercase{\protect\NOLTA@sc ##2}}%
  \protected@edef\@authorname{\expandafter\tr@name #2\@nil\null}%
  \@authorname\
 \egroup
 \if #1m\relax
  {\normalsize (Member)}%
 \else
  \if #1s\relax
   {\normalsize (Student Member)}%
  \else
 \if #1f\relax
   {\normalsize (Member, Fellow)}%
  \else
 \if #1h\relax
   {\normalsize (Honorary Member, Fellow)}%
  \else
   \if #1n\relax
    \relax
   \else
    \relax
    \fi
   \fi
  \fi
 \fi
\fi
 \vskip1mm
}





\newsavebox{\PROFILEcheck}
\savebox{\PROFILEcheck}{%
\begin{picture}(10,10)
\put(-20,8.5){\rule[-6.25mm]{40mm}{.1mm}}
\put(-20,12.5){\rule[-6.25mm]{40mm}{.1mm}}
\put(-12,4){Leader Prof sep 4mm}
%
%\put(-10,-6){\rule[-6.25mm]{80mm}{.1mm}}
%\put(40,-6){\rule[-6.25mm]{.1mm}{6mm}}
%\put(18,-11){6mm}
\put(-20,3.25){\rule[-6.25mm]{40mm}{.1mm}}
\put(-10,3.25){\rule[-6.25mm]{.1mm}{5.5mm}}
\put(-10,-1){AuthorTop--FisrtLine 5.5mm}
\end{picture}
%
}


\newsavebox{\PROFILEcheckII}
\savebox{\PROFILEcheckII}{%
\begin{picture}(10,10)
\put(-45,8.5){\rule[-6.25mm]{30mm}{.1mm}}
%\put(-45,15.25){\rule[-6.25mm]{30mm}{.1mm}}
\put(-45,12.5){\rule[-6.25mm]{30mm}{.1mm}}
\put(-43,4){ProfileSEP 4mm}
\end{picture}
%
}






\newif\ifPhoto    \Photofalse   %

\newif\ifNoPhotoII    \NoPhotoIIfalse   %

\newif\ifMemberShip \MemberShipfalse%
\newif\ifNoPhoto    \NoPhotofalse   %
\newif\ifAuthorNameFree    \AuthorNameFreefalse   %


\define@key{MemberShip}{name}[true]{\AuthorNameFreetrue%
\gdef\authornamefree{#1}
}

\define@key{MemberShip}{member}{\MemberShiptrue
\gdef\boxofmember{ ({#1})}
}



\define@key{MemberShip}{s}[true]{%\MemberShiptrue
\gdef\boxofmember{ ({Student Member})}
}

\define@key{MemberShip}{m}[true]{%\MemberShiptrue
\gdef\boxofmember{ ({Member})}
}
\define@key{MemberShip}{f}[true]{%\MemberShiptrue
\gdef\boxofmember{ ({Member, Fellow})}
}
\define@key{MemberShip}{h}[true]{%\MemberShiptrue
\gdef\boxofmember{ ({Honorary Member, Fellow})}
}



\define@key{MemberShip}{n}[true]{%\MemberShiptrue
\gdef\boxofmember{}
}




\define@key{MemberShip}{nophoto}[true]{\NoPhototrue\NoPhotoIItrue
%%\gdef\boxofmember{ ({#1})}
}


%\def\profile{\@ifstar{\n@Jprofile}{\@Jprofile}}
\def\profile{\@ifnextchar[%]
{\special@Jprofile}{\normal@Jprofile}
}


\def\profile{%\@ifnextchar[%]
%
%{\special@Jprofile}{\normal@Jprofile}
\special@Jprofile
}




%%
\long\def\special@Jprofile[#1]#2#3{%\vskip3.875mm%
 \refstepcounter{profile}%
 \vbox{%
\ifnum\c@profile>1 \vskip3.75mm\else\fi  \special@fmt@pro@Ename[#1]{#2}%
\ifNoPhoto\Photofalse
  %{%\normalsize\normalfont
%   \hskip5.5mm
\fmt@pro@pic@nophoto{#3}%\par\NoPhotoIItrue%\ifNoPhotoII \vskip-3mm\else\fi
\else
  \fmt@pro@pic{#3}\Phototrue%\par%\vspace*{1mm}%
\fi
%
 }%
%\vskip3.875mm%6.5mm%1\Cvs%6.5mm
}
%%%


%\ifNoPhoto\vspace*{-2.375mm}\else\fi



%%%%%
\def\special@fmt@pro@Ename[#1]#2{\Phototrue%
   \setkeys{MemberShip}{member=\MemberShipfalse}%\@undefined%
   \setkeys{MemberShip}{#1}
%   \setkeys{MemberShip}{nohoto=\NoPhototrue}
%
%
%
\bgroup
  \normalsize\bfseries
%  \def\tr@name##1 ##2\@nil{##1 \protect\uppercase{\protect\NOLTA@sc ##2}}%
%  \protected@edef\@authorname{\expandafter\tr@name #2\@nil\null}%
%  \@authorname\
\ifAuthorNameFree
\authornamefree%#2%
\else%\SEIMEI{#2}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \def\tr@name##1 ##2\@nil{##1 \protect\uppercase{\protect\NOLTA@sc ##2}}%
  \protected@edef\@authorname{\expandafter\tr@name #2\@nil\null}%
  \@authorname\
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fi
\egroup
{\normalsize\boxofmember}% \if #1m\relax
\if@Proof
\smash{\pushtowall{\usebox{\PROFILEcheckII}\usebox{\PROFILEcheck}}}%
\else\relax\fi%
%  {\normalsize (Member)}%
% \else
%  \if #1s\relax
%   {\normalsize (Student Member)}%
%  \else
% \if #1f\relax
%   {\normalsize (Member, Fellow)}%
%  \else
% \if #1h\relax
%   {\normalsize (Honorary Member, Fellow)}%
%  \else
%   \if #1n\relax   {\normalsize (Xxxx)}%
%    \relax
%   \else
%    \relax
%    \fi
%   \fi
%  \fi
% \fi
%\fi
 \vskip1mm
}


%%%
\def\normal@fmt@pro@Ename#1#2{%
   \setkeys{MemberShip}{member=\MemberShipfalse,m=Member}
 \bgroup
  \normalsize\bfseries
%  \def\tr@name##1 ##2\@nil{##1 \protect\uppercase{\protect\NOLTA@sc ##2}}%
%  \protected@edef\@authorname{\expandafter\tr@name #2\@nil\null}%
%  \@authorname\
#2 \egroup
 \if #1m\relax
  {\normalsize (Xxxx)}%
 \else
  \if #1s\relax
   {\normalsize (Xxxxx Xxxxx)}%
  \else
 \if #1f\relax
   {\normalsize (Xxxxx, Xxxxxx)}%
  \else
 \if #1h\relax
   {\normalsize (Xxxxxxxxxx, Xxxxx)}%
  \else
   \if #1n\relax   {\normalsize (Xxxx)}%
    \relax
   \else
    \relax
    \fi
   \fi
  \fi
 \fi
\fi
 \vskip1mm
}






%%%%
\def\fmt@pro@pic#1{%
\noindent\begin{minipage}[t]{\columnwidth}%{16mm}%
\noindent \leavevmode%\raise-127.5mm
%  \noindent\vbox to 20mm{%
   \noindent\IfFileExists{a\the\c@profile.eps}{%
%\leavevmode\smash{\llap{\lower21.5mm\hbox to 20mm{%%%%%%%%%%%%%%%%%%%%%%%
%\noindent\leavevmode%\smas{\llap{\raise10mm\hbox to 20mm{%%%%%%%%%%%%%%%%%%%%%%%
    \noindent{\raisebox{-18.75mm}{\pushtowall{%\hspace*{-20mm}
\resizebox{16mm}{20mm}{\includegraphics{a\the\c@profile.eps}}}}}%
%\hss}}}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   }{%
\noindent{\smash{\raisebox{1mm}
{\pushtowall{%
\begin{minipage}[t]{16mm}
     \hrule \@height .1mm
     \hbox to 16mm{\vrule \@width .1mm \@height 19.8mm\hss
                   \vrule \@width .1mm \@height 19.8mm}%
     \hrule \@height .1mm
\end{minipage}
}}}}
%     \hrule \@height .1mm
%     \hbox to 16mm{\vrule \@width .1mm \@height 19.8mm\hss
%                   \vrule \@width .1mm \@height 19.8mm}%
%     \hrule \@height .1mm
    }%
%  }%
% \end{minipage}%
% \hfill
\pushtowall{\begin{minipage}[t]{\columnwidth}%{66.25mm}% 22zw
\hangindent20mm\hangafter-7\relax
  \hskip2.75mm
  #1%\par
\end{minipage}%
}%
 \end{minipage}%\par%
%\if@Proof
%\leavevmode\smash{\pushtowall{\usebox{\PROFILEcheckIII}}}%
%\else\relax\fi%
%\rule{.1mm}{10mm}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%
\def\fmt@pro@pic@nophoto#1{%
\noindent\begin{minipage}[t]{\columnwidth}%{16mm}%
\noindent \leavevmode%\raise-127.5mm
\pushtowall{\begin{minipage}[t]{\columnwidth}%{66.25mm}% 22zw
%\hangindent20mm\hangafter-7\relax
  \hskip2.75mm
  #1%\par
\end{minipage}%
}%
 \end{minipage}%\par%
%\if@Proof
%\leavevmode\smash{\pushtowall{\usebox{\PROFILEcheckIII}}}%
%\else\relax\fi%
%\rule{.1mm}{10mm}
}








%%% From File: ltthm.dtx
%%% section=
\def\newtheorem#1{%
  \@ifnextchar[{\@othm{#1}}{\@nthm{#1}}}
\def\@nthm#1#2{%
  \@ifnextchar[{\@xnthm{#1}{#2}}{\@ynthm{#1}{#2}}}
\def\@xnthm#1#2[#3]{%
  \expandafter\@ifdefinable\csname #1\endcsname
    {\@definecounter{#1}\@newctr{#1}[#3]%
     \expandafter\xdef\csname the#1\endcsname{%
       \expandafter\noexpand\csname the#3\endcsname \@thmcountersep
          \@thmcounter{#1}}%
     \global\@namedef{#1}{\@thm{#1}{#2}}%
     \global\@namedef{end#1}{\@endtheorem}}}
\def\@ynthm#1#2{%
  \expandafter\@ifdefinable\csname #1\endcsname
    {\@definecounter{#1}%
     \expandafter\xdef\csname the#1\endcsname{\@thmcounter{#1}}%
     \global\@namedef{#1}{\@thm{#1}{#2}}%
     \global\@namedef{end#1}{\@endtheorem}}}
\def\@othm#1[#2]#3{%
  \@ifundefined{c@#2}{\@nocounterr{#2}}%
    {\expandafter\@ifdefinable\csname #1\endcsname
    {\global\@namedef{the#1}{\@nameuse{the#2}}%
  \global\@namedef{#1}{\@thm{#2}{#3}}%
  \global\@namedef{end#1}{\@endtheorem}}}}
\def\@thm#1#2{%
  \refstepcounter{#1}%
  \@ifnextchar[{\@ythm{#1}{#2}}{\@xthm{#1}{#2}}}
\def\@xthm#1#2{%
  \@begintheorem{#2}{\csname the#1\endcsname}\ignorespaces}
\def\@ythm#1#2[#3]{%
  \@opargbegintheorem{#2}{\csname the#1\endcsname}{#3}\ignorespaces}
\def\@thmcounter#1{\noexpand\arabic{#1}}
\def\@thmcountersep{.}%%%
\def\@begintheorem#1#2{\trivlist
   \item[\hskip \labelsep{{\bfseries #1\ #2}}]}
\def\@opargbegintheorem#1#2#3{\trivlist
%      \item[\hskip \labelsep{{\bfseries #1\ #2\ {(#3)}}}]}
      \item[\hskip \labelsep{{\bfseries #1\ #2\ (#3{\bfseries)}}}]}
\def\@endtheorem{\endtrivlist}







\newdimen\mathindent




\newcommand{\Introduction}{\@startsectionC{section}{1}{0em}%
%   {.00001\Cvs \@plus.00001mm \@minus.00001mm}%
%   {.00001\Cvs \@plus.00001mm \@minus.00007mm}%
   {.000001mm}%
   {.00001\Cvs \@plus.00001mm \@minus.00007mm}%
   {\reset@font\large%\slshape
\bfseries
\mathversion{bold}%
}}


\newcommand{\introduction}{\Introduction{Introduction}}





\def\Newpage{\linebreak\newpage\noindent}






\def\QED{{\fboxsep\z@\fboxrule.1mm
 \unskip\nobreak\hfil\penalty50
 \hskip2.75mm\hbox{}\nobreak\hfil
  \mbox{\smash{\fbox{\rule{0mm}{3mm}\rule{1.5mm}{0mm}}}\hskip1em}%
 \parfillskip\z@ \finalhyphendemerits\z@\par}}




\def\BQED{{\fboxsep\z@\fboxrule.1mm
 \unskip\nobreak\hfil\penalty50
 \hskip2.75mm\hbox{}\nobreak\hfil \mbox{\smash{\rule{1.5mm}{3mm}}\hskip1em}%
 \parfillskip\z@ \finalhyphendemerits\z@\par}}


\DeclareRobustCommand{\ddash}{\protect\makebox[2em]{---\hspace*{-.25mm}---}}


\vbadness10001

%%%% cite

\iffalse

%% from citesort.sty, a little customized
\newcount\@minsofar
\newcount\@min
\newcount\@cite@temp
\def\@citex[#1]#2{%
\if@filesw \immediate \write \@auxout {\string \citation {#2}}\fi
\@tempcntb\m@ne \let\@h@ld\relax \def\@citea{}%
\@min\m@ne%
\@cite{%
  \@for \@citeb:=#2\do {\@ifundefined {b@\@citeb}%
    {\@h@ld\@citea\@tempcntb\m@ne\textbf{?}%% {\bf ?}
    \@warning {Citation `\@citeb ' on page \thepage \space undefined}}%
{\@minsofar\z@ \@for \@scan@cites:=#2\do {%
  \@ifundefined{b@\@scan@cites}%
    {\@cite@temp\m@ne}
    {\@cite@temp\number\csname b@\@scan@cites \endcsname \relax}%% <
 \ifnum\@cite@temp > \@min% select the next one to list
    \ifnum\@minsofar = \z@
      \@minsofar\number\@cite@temp
      \edef\@scan@copy{\@scan@cites}\else
    \ifnum\@cite@temp < \@minsofar %% >
      \@minsofar\number\@cite@temp
      \edef\@scan@copy{\@scan@cites}\fi\fi\fi}\@tempcnta\@min %% <
  \ifnum\@minsofar > \z@ % some more
    \advance\@tempcnta\@ne
    \@min\@minsofar
    \ifnum\@tempcnta=\@minsofar %   Number follows previous--hold on to it
      \ifx\@h@ld\relax
        \edef \@h@ld{\@citea\csname b@\@scan@copy\endcsname}%
      \else %% [
%       \edef\@h@ld{\ifmmode{]\mbox{--}\allowbreak [}%
       \edef\@h@ld{\ifmmode{\mbox{--}\allowbreak }%
%        \else ]--\allowbreak[\fi %% ]
        \else --\allowbreak \fi %% ]
         \csname b@\@scan@copy\endcsname}%
      \fi
    \else \@h@ld\@citea\csname b@\@scan@copy\endcsname
          \let\@h@ld\relax
  \fi % no more
 \fi}%
  \def\@citea{%% [
%   ],\,\allowbreak[}}\@h@ld}{#1}% ]
   ,\,\allowbreak }}\@h@ld}{#1}% ]
}

\fi

%% ver2.2
\renewcommand\appendix{\par
\def\@seccntformat##1{\thesection.\the\c@subsection\ }%  ver2.3
\Othersection*{Appendix}
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
\renewcommand\thesection{\@Alph\c@section}
%\renewcommand\thesubsection  {\@Alph\c@subsection}
\renewcommand\thesubsection   {\thesection\@arabic\c@subsection}
%\renewcommand\theequation {\@arabic\c@equation}
\renewcommand\theequation {\thesection-\@arabic\c@equation}
%
%\renewcommand \thefigure {{\bfseries\@arabic\c@figure}}
\renewcommand \thefigure {{\thesection-\@arabic\c@figure}}
\renewcommand\thetable{{\thesection-\@Roman\c@table}}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\def\fnum@table{\tablename~\thetable}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%
%% Y
\def\@startsectionY##1##2##3##4##5##6{%
  \if@noskipsec \leavevmode \fi
  \par
  \@tempskipa ##4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@
    \@tempskipa -\@tempskipa \@afterindentfalse
  \fi
  \if@nobreak
    \everypar{}%
  \else
    \addpenalty\@secpenalty\addvspace\@tempskipa
  \fi
  \@ifstar
    {\@ssectY{##3}{##4}{##5}{##6}}%
    {\@dblarg{\@sectY{##1}{##2}{##3}{##4}{##5}{##6}}}}
\def\@sectY##1##2##3##4##5##6[##7]##8{%
  \ifnum ##2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{##1}%
    \protected@edef\@svsec{\@seccntformatY{##1}\relax}%
  \fi
  \@tempskipa ##5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      ##6{%
        \@hangfrom{\hskip ##3\relax\@svsec}%
          \interlinepenalty \@M ##8\@@par
\nopagebreak% %
%\vskip4.5pt\vskip-1mm% %
%\offinterlineskip
%\textcolor[named]{Gray}{\hrule}% %
}%
    \endgroup
    \csname ##1mark\endcsname{##7}%
    \addcontentsline{toc}{##1}{%
      \ifnum ##2>\c@secnumdepth \else
        \protect\numberline{\csname the##1\endcsname}%
      \fi
      ##7}%
  \else
    \def\@svsechd{%
      ##6{\hskip ##3\relax
      \@svsec ##8}%
      \csname ##1mark\endcsname{##7}%
      \addcontentsline{toc}{##1}{%
        \ifnum ##2>\c@secnumdepth \else
          \protect\numberline{\csname the##1\endcsname}%
        \fi
        ##7}}%
  \fi
  \@xsect{##5}}
\def\@xsect##1{%
  \@tempskipa ##1\relax
  \ifdim \@tempskipa>\z@
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \else
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa ##1\relax
        \hskip -\@tempskipa
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \fi
  \ignorespaces}
\def\@seccntformatY##1{\csname the##1\endcsname.\ }%  ver2.3
\def\@ssectY##1##2##3##4##5{%
  \@tempskipa ##3\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      ##4{%
        \@hangfrom{\hskip ##1}%
          \interlinepenalty \@M ##5\@@par
\nopagebreak% %
\vskip4.5pt\vskip-1mm% %
\offinterlineskip
\textcolor{black!50}{\hrule}% %
}%
    \endgroup
  \else
    \def\@svsechd{##4{\hskip ##1\relax ##5}}%
  \fi
  \@xsect{##3}}
%%%%%%%%%%%%%%%%
\renewcommand\section{\@startsectionY {section}{1}{\z@}%
                      {-3.6mm\@plus -1ex \@minus -.2ex}%
                      {.0001pt \@plus .2ex}%
                      {\reset@font%\large%\slshape
                       \fontsize{16\Q}{22\Q}\selectfont\bfseries
                       \mathversion{bold}}}
%%%%%%%%%%%%%%%%
\@addtoreset{equation}{section}
\@addtoreset{figure}{section}
\@addtoreset{table}{section}
}


%%%%%%%%%%%% Added for ORCID 2018/04/18 honda



\newif\if@orcid
\let\orcid\@gobble


\def\printorcid{%
   \global\@orcidtrue
}


\AtBeginDocument{%
\if@orcid
\AtEndDocument{\thispagestyle{empty}
   \advance\c@page\@ne
   \parindent0pt
   Please confirm your ORCID ID.
   \vskip\baselineskip
\typeout{%
^^J%
=======================================^^J%
  ORCID ID is printed out at last page.^^J%
  Please confirm.^^J%
=======================================^^J}%
}%
\fi
%%%%%%%
\def\AUTHORsc#1{\edef\current@author{#1}\fmt@AUTHOR@Ename{#1}}
\def\AUTHORscSTAR#1{\edef\current@author{#1}\fmt@AUTHOR@EnameSTAR{#1}}
%%%%%%
\def\check@orcid#1{%
   \if\relax#1\relax
      \def\current@orcid{no ORCID ID}%
   \else
      \def\current@orcid{#1}%
   \fi
}%
%%%%%%%%%%%
\def\orcid#1{%
   \ifcsname orcid@for@\theNOLTAauthor\endcsname\else
      \AtEndDocument{%
         \@latex@warning{The icon for orcid `#1' is not printed.^^J
                         Rerun to print it.}%
       }%
   \fi
   \def\tempID{#1}%
   \expandafter\ifx\csname orcid@for@\theNOLTAauthor\endcsname\tempID\else
      \@latex@warning{The orcid was changed for the author \theNOLTAauthor.^^J
                         Rerun to corenct it.}%
   \fi
%%%\typeout{>>>>>\theNOLTAauthor}%
   \immediate\write\@auxout{\global\noexpand\@namedef{orcid@for@\theNOLTAauthor}{#1}}%
%   \if@orcid
   \check@orcid{#1}%
%   \fi
   \xdef\name@orcid{\current@author\quad\current@orcid}%
   \if@orcid
   \expandafter\AtEndDocument\expandafter{\name@orcid\par}%
   \fi
}%
%%%\fi
}%%%%%%%%%%%%%End of \AtBeginDocument


%%%%%%%%%%%%%% End for ORCID

%hyperref
\RequirePackage[%%implicit=false,
breaklinks=true,
colorlinks=true,
linkcolor=blue,
anchorcolor=blue,
citecolor=blue,
urlcolor=blue,
bookmarks=false,
pdfpagelabels=false,
hyperfootnotes=false,
]{hyperref}






\ifdefined\AddToHook
\def\AddToHook@begindocument@end@AtBeginDocument{\AddToHook{begindocument/end}}
\else
\let\AddToHook@begindocument@end@AtBeginDocument\AtBeginDocument
\fi




%%firstpage
\AddToHook@begindocument@end@AtBeginDocument{\label{NOLTA@firstpage}}
%%lastpage
\RequirePackage{lastpage}

\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage{hypernat}
%\renewcommand{\thepage}{}



%\makeatletter
\long\def\bibsection#1{%
   \par
   \if@newlist\else \addvspace{\bigskipamount} \fi
   \parshape\z@ \item[]\noindent\hspace{10pt}%
   \parindent10pt\relax #1\@@par \medskip
   \parshape \@ne \@totalleftmargin \linewidth
   \parindent\listparindent}
%\makeatother




%%bib reverted (hyperref/hypernat changed)
\renewenvironment{thebibliography}[1]
     {\references
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
        \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
            \leftmargin\labelwidth
            \advance\leftmargin\parindent%\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}



%%%%%%%%%%%%%%%%%%%%

\long\def\@ORGmakecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}


\def\NOLTA@shortstack{\@ifnextchar[% ]
 \@NOLTA@shortstack{\@NOLTA@shortstack[c]}}
\def\@NOLTA@shortstack[#1]{%
  \leavevmode
  \vbox\bgroup
    %%\baselineskip-\p@\lineskip 3\p@
    \let\mb@l\hss\let\mb@r\hss
    \expandafter\let\csname mb@#1\endcsname\relax
    \let\\\@stackcr
    \@ishortstack}

\long\def\@caption#1[#2]#3{\par
 %%\addcontentsline{\csname ext@#1\endcsname}{#1}%
 %% {\protect\numberline{\csname the#1\endcsname}{\ignorespaces #2}}%
 \begingroup
  \@parboxrestore
  \if@minipage
   \@setminipage
  \fi
  \small
  \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
 \endgroup}



\newdimen\capwidth
\capwidth=115mm

\long\def\@makecaption#1#2{%
 \vskip\abovecaptionskip
 \setbox\@tempboxa\hbox{{\bf#1.}\hskip1em\NOLTA@shortstack[l]{#2}}%
 \@tempdima \ht\@tempboxa
 \advance \@tempdima \dp\@tempboxa
 \setbox\@tempboxb\hbox{{\bf#1.}\hskip1em}%
 \ifdim \@tempdima > \baselineskip
  \ifdim \wd\@tempboxa > \capwidth
   \hfil\parbox[t]{\capwidth}{%\hangindent\wd\@tempboxb
    {\bf#1.}\hskip1em #2}\par
    \hrule \@height \z@
  \else
   \hfil\parbox[t]{\wd\@tempboxa}{%\hangindent\wd\@tempboxb
    {\bf#1.}\hskip1em #2}\par
    \hrule \@height \z@
  \fi
 \else
  \ifdim \wd\@tempboxa > \capwidth
   \hfil\parbox[t]{\capwidth}{%\hangindent\wd\@tempboxb
    {\bf#1.}\hskip1em #2}\par
    \hrule \@height \z@
  \else
   \hbox to\hsize{\hss\box\@tempboxa\hss}%
  \fi
 \fi
 \vspace{\belowcaptionskip}%
}



\AddToHook@begindocument@end@AtBeginDocument{\DeclareRobustCommand\ref{\@ifstar\@refstar\@refstar}}
\AddToHook@begindocument@end@AtBeginDocument{\DeclareRobustCommand\pageref{\@ifstar\@pagerefstar\@pagerefstar}}





\endinput
%%
%% End of file `article.cls'.
