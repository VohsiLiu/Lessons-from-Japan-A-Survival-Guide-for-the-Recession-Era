\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LessonsFromJapan}
\LoadClass[zihao=-4,a4paper,12pt,twoside,fontset=none]{ctexart}
\RequirePackage[top=3.2cm,bottom=2.7cm,left=3.18cm,right=3.18cm]{geometry}
\RequirePackage{xcolor,graphicx}

% 中文各字体独立设置；西文保留模板的 Times New Roman。
\RequirePackage[AutoFallBack=true]{xeCJK}
\setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03}]{FZShuSong-Z01}
\setCJKsansfont[BoldFont={FZHei-B01}]{FZHei-B01}
\setCJKmonofont[BoldFont={FZHei-B01}]{FZFangSong-Z02}
\setCJKfamilyfont{zhsong}[BoldFont={FZHei-B01}]{FZShuSong-Z01}
\setCJKfamilyfont{zhhei}[BoldFont={FZHei-B01}]{FZHei-B01}
\setCJKfamilyfont{zhkai}[BoldFont={FZHei-B01}]{FZKai-Z03}
\setCJKfamilyfont{zhfs}[BoldFont={FZHei-B01}]{FZFangSong-Z02}
\providecommand{\songti}{}
\renewcommand*{\songti}{\CJKfamily{zhsong}}
\providecommand{\heiti}{}
\renewcommand*{\heiti}{\CJKfamily{zhhei}}
\providecommand{\kaishu}{}
\renewcommand*{\kaishu}{\CJKfamily{zhkai}}
\providecommand{\fangsong}{}
\renewcommand*{\fangsong}{\CJKfamily{zhfs}}
\newCJKfontfamily\xbsong{FZXiaoBiaoSong-B05S}
\setCJKfallbackfamilyfont{\CJKrmdefault}{TH-Sy-P0,FZSongS--GB1-5,FZSONG_ZHSJ_02--GB1-5}
\xeCJKDeclareCharClass{CJK}{"2160 -> "216F, "2460 -> "2473}
\setmainfont{Times New Roman}[SmallCapsFont=TeX Gyre Termes:+smcp]
\RequirePackage{newunicodechar}
\newunicodechar{∶}{\ensuremath{\mathrel{:}}}
\xeCJKsetup{CJKecglue=\hskip 0.15em plus 0.05em minus 0.03em}

% 正文与页眉。封面的字体、字号和页面参数沿用原模板。
\RequirePackage{fancyhdr,emptypage,indentfirst,setspace}
\setlength{\parindent}{2em}
\setlength{\parskip}{0.25em}
\setstretch{1.5}
\setlength{\emergencystretch}{2em}
% 与参考模板一致，避免页眉盒高度将正文和页码整体向下推移。
\setlength{\headheight}{15pt}
\setlength{\footskip}{30pt}
\raggedbottom
\fancypagestyle{tocstyle}{%
  \fancyhf{}\renewcommand{\headrulewidth}{0.35pt}%
  \fancyhead[C]{\kaishu\small 目录}\fancyfoot[C]{\small\thepage}}
\fancypagestyle{docstyle}{%
  \fancyhf{}\renewcommand{\headrulewidth}{0.35pt}%
  \fancyhead[CO]{\kaishu\small\nouppercase{\leftmark}}%
  \fancyhead[CE]{\kaishu\small 以日为鉴：衰退时代生存指南}%
  \fancyfoot[C]{\small\thepage}}
\renewcommand{\sectionmark}[1]{\markboth{#1}{}}
\renewcommand{\subsectionmark}[1]{}

% 五篇为 part，十五章为 section，章内主题为 subsection。
\RequirePackage{titlesec}
\setcounter{secnumdepth}{0}
\setcounter{tocdepth}{2}
\titleformat{\section}[block]
  {\centering\xbsong\zihao{-2}\xeCJKsetup{CJKglue=\hskip 1.5pt}}
  {}{0pt}{}
\titleformat{\subsection}[block]
  {\centering\heiti\setstretch{1.25}\zihao{-3}}{}{0pt}{}
\titleformat{\subsubsection}[block]
  {\heiti\setstretch{1.25}\zihao{4}}{}{0pt}{}
\titlespacing*{\section}{0pt}{1.8em}{1.6em}
\titlespacing*{\subsection}{0pt}{1.5em}{0.8em}
\titlespacing*{\subsubsection}{0pt}{1.1em}{0.5em}
\titleformat{\paragraph}[block]{\heiti\normalsize}{}{0pt}{}
\titlespacing*{\paragraph}{0pt}{0.8em}{0.3em}
\newcommand{\q}{\ \ }
\renewcommand*{\l@part}[2]{%
  \vskip 0.6em\@plus\p@\@dottedtocline{0}{0em}{0em}{\bfseries #1}{\bfseries #2}}
% 只在目录中给篇内各级条目增加一层缩进，附文恢复原缩进。
\newlength{\BookTOCOffset}
\newcommand{\BookTOCScope}[1]{\setlength{\BookTOCOffset}{#1}}
\renewcommand*{\l@section}[2]{%
  \vskip 0.3em\@plus\p@\@dottedtocline{1}{\BookTOCOffset}{0em}{\bfseries #1}{#2}}
\renewcommand*{\l@subsection}[2]{%
  \@dottedtocline{2}{\dimexpr1.5em+\BookTOCOffset\relax}{0em}{#1}{#2}}
\renewcommand*{\l@subsubsection}[2]{%
  \@dottedtocline{3}{\dimexpr3.8em+\BookTOCOffset\relax}{3.2em}{#1}{#2}}
% 篇首页保留原书插图；章节分页由主入口的 include 统一控制。
\newcommand{\BookPart}[2]{%
  \phantomsection\markboth{#1\q #2}{}%
  \addtocontents{toc}{\protect\BookTOCScope{1.5em}}%
  \addcontentsline{toc}{part}{#1\q #2}\thispagestyle{empty}%
  \vspace*{0.02\textheight}%
  \begin{center}{\heiti\zihao{3}#1\par}\vspace{1.6em}%
  {\xbsong\zihao{-1}#2\par}\end{center}}
\newcommand{\BookPartImage}[1]{%
  \vspace{2em}\begin{center}%
  \includegraphics[width=\linewidth,keepaspectratio]{#1}\end{center}}
\newcommand{\BookFront}[1]{%
  \phantomsection\section*{#1}\markboth{#1}{}%
  \addtocontents{toc}{\protect\BookTOCScope{0pt}}%
  \addcontentsline{toc}{section}{#1}}
\newcommand{\BookSubtitle}[1]{%
  \begin{center}{\heiti\zihao{4}\setstretch{1.25}#1\par}\end{center}\medskip}
\newcommand{\BookChapter}[1]{%
  \setcounter{section}{#1}\setcounter{table}{0}\setcounter{figure}{0}}
\renewcommand{\thefigure}{\arabic{section}.\arabic{figure}}
\renewcommand{\thetable}{\arabic{section}.\arabic{table}}

% 可编辑的跨页表格；仅十三列原表使用横向页面。
\RequirePackage{array,booktabs,longtable,pdflscape,float,caption}
\captionsetup{font=small,labelfont=bf,labelsep=quad}
\setlength{\LTpre}{0.6\baselineskip}
\setlength{\LTpost}{0.6\baselineskip}
\setlength{\LTcapwidth}{\textwidth}

% 列表沿用正文行距。
\RequirePackage{enumitem}
\setlist{topsep=0pt,partopsep=0pt,itemsep=0pt,parsep=\parskip,leftmargin=2em}
\setlist[itemize]{label=\textbullet}

\RequirePackage[stable,bottom]{footmisc}
\RequirePackage{perpage}
\MakePerPage{footnote}
\RequirePackage{xurl}
\RequirePackage{hyperref}
\def\toclevel@part{0}
\urlstyle{same}
\hypersetup{colorlinks=true,allcolors=black,linktoc=all,
  bookmarksopen=true,bookmarksopenlevel=1,
  pdftitle={以日为鉴：衰退时代生存指南},pdfauthor={分析师Boden}}
\renewcommand{\theHfigure}{\arabic{section}.\arabic{figure}}
\renewcommand{\theHtable}{\arabic{section}.\arabic{table}}
\endinput
