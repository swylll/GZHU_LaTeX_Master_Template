% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\LoadClass[a4paper,twoside]{ctexbook}
\ProvidesClass{GZHUMaster}[2025/03/06]

%------------------------ 页面布局 ------------------------
\RequirePackage{fancyhdr,hyperref}
\hypersetup{pdfencoding=auto}  
\hypersetup{pdfborder={0 0 0}}  %若希望显示超链接外框，请注释掉本行
\RequirePackage[top=2.5truecm,bottom=2.5truecm,left=2.5truecm,right=2.5truecm,xetex]{geometry}  %页面设置，根据广州大学研究生工作手册，学位论文页面边距上下左右各为25mm。
%\RequirePackage[top=2.5truecm,bottom=2.5truecm,left=2.8truecm,right=2.2truecm,xetex]{geometry}  %装订用
\RequirePackage{fontspec}

%------------------------ 变量设置 ------------------------
\newtoks\DCI             %中图分类号
\newtoks\SchoolNumber    %学校代码
\newtoks\ConfLvl         %密级
\newtoks\Major          %学科专业中文名
\newtoks\Specialty      %英文研究方向
\newtoks\Etitle          %英文题目
\newtoks\Supervisor     %指导教师中文名
\newtoks\StudentNumber   %学号
\newtoks\Chairman       %答辩委员会主席
\newtoks\Member         %答辩委员会成员

%------------------------ 页眉页脚 ------------------------
\newcommand{\makeheadrule}{              %双线页眉，在页眉下画一条2.25pt和0.4pt宽的分隔线
\makebox[-3pt][l]{\rule[.7\baselineskip]{\headwidth}{0.4pt}}
\rule[0.85\baselineskip]{\headwidth}{2.25pt}\vskip-.8\baselineskip}
\makeatletter
\renewcommand{\headrule}{
    {\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
     \makeheadrule}}
\renewcommand{\footrulewidth}{0pt}       %在页脚不画分隔线

\let\ps@oldplain\ps@plain

\fancyhf{}                              %清除以前对页眉页脚的设置
\fancyhead[CE]{广州大学硕士学位论文}       %偶数页页眉居中位置的设置，不填则为空
\fancyhead[CO]{\leftmark}               %显示章节名称
\fancyfoot[C]{-\,\thepage\,-}           %页面下侧的设置，大括号内置空，表示什么也不填。反之，没有此命令的话，会在页脚出现页码

\newcommand{\fancyfancy}{
\fancypagestyle{plain}{ %上面改了这里也要改
\fancyhf{}
\fancyhead[CE]{广州大学硕士学位论文}
\fancyhead[CO]{\leftmark}
\fancyfoot[C]{-\,\thepage\,-}}
} 

%------------------------ 封面设置 ------------------------
\def\maketitle{
  \thispagestyle{empty}
  \begin{center}\leavevmode
    {\songti \normalsize
    \begin{tabular}{p{20mm}p{30mm}p{25mm}p{20mm}p{40mm}l}
      分\hspace{0.5em}类\hspace{0.5em}号：&{\the\DCI}& &
      密\qquad 级：&{\the\ConfLvl}\\
      学校代码：&{\the\SchoolNumber}& &
      保密日期：&{}\\
      学\qquad 号：&{\the\StudentNumber}& &
      保密期限：&{}\\
    \end{tabular}
    }
    \par
    \vspace{20mm} 
    {\heiti \zihao{-2} 广州大学硕士学位论文}
    \par
    \vfill
    {\heiti \zihao{2}  \@title \par}
    \vspace{5mm}
    {\heiti \zihao{2}  \the\Etitle \par}
    \vfill
    {\songti \zihao{4} \@author\par}
    \vspace{15mm}
    {\songti\zihao{-4}
    \begin{tabular}{p{50mm}p{5mm}cp{5mm}}
      \raisebox{-2ex}[0pt]{专\hspace{2.3em}业\makebox[2.4em][c]{/}领\hspace{2.3em}域: }& &\raisebox{-2ex}[0pt]{\the\Major}&\\[2ex] \cline{2-4}
      \raisebox{-2ex}[0pt]{研\hspace{2.3em}究\hspace{2.4em}方\hspace{2.3em}向: }& &\raisebox{-2ex}[0pt]{\the\Specialty}&\\[2ex] \cline{2-4}
      \raisebox{-2ex}[0pt]{论\quad 文\quad 答\quad 辩\quad 日\quad 期: }& &\raisebox{-2ex}[0pt]{\@date}&\\[2ex] \cline{2-4}
      \raisebox{-2ex}[0pt]{指\quad 导\quad 教\quad 师（签名）: }& &\raisebox{-2ex}[0pt]{\the\Supervisor}&\\[2ex] \cline{2-4}
      \raisebox{-2ex}[0pt]{答辩委员会主席（签名）: }& &\raisebox{-2ex}[0pt]{\the\Chairman}&\\[2ex] \cline{2-4}
      \raisebox{-2ex}[0pt]{答辩委员会委员（签名）: }& &\raisebox{-2ex}[0pt]{\the\Member}&\\[2ex] \cline{2-4}
      & & &\\[2ex] \cline{2-4}
      & & &\\[2ex] \cline{2-4}
      & & &\\[2ex] \cline{2-4}
     \end{tabular}
    }
    \par
    \vspace{20mm}
    
  \end{center}
  \newpage
  \thispagestyle{empty}
  \cleardoublepage
}

%------------------------ 摘要设置 ------------------------
\newcommand\cnabstractname{摘\quad 要}
\newcommand\enabstractname{ABSTRACT}
\newcommand\cnkeywords[1]{ {\heiti\zihao{-4}\cnkeywordsname: }#1}
\newcommand\cnkeywordsname{关键词}
\newcommand\enkeywords[1]{ {\zihao{-4}\bfseries\enkeywordsname: }#1}
\newcommand\enkeywordsname{Keywords}

\newenvironment{cnabstract}{
    \newpage
    \chapter[\cnabstractname]{\begin{center}\cnabstractname\end{center}} %中文摘要目录显示
    \songti\zihao{-4}
    \@afterheading}
{\par}

\newenvironment{enabstract}{
    \newpage
    \chapter[\enabstractname]{\begin{center}\enabstractname\end{center}} %英文摘要目录显示
    \songti\zihao{-4}
    \@afterheading}
{\par}

%------------------------ 常用宏包 ------------------------
\RequirePackage{amsmath,amssymb}             %AMSLaTeX宏包
\RequirePackage[amsmath,thmmarks]{ntheorem}
\RequirePackage{graphicx}                    %图形
\RequirePackage{color,xcolor}                %支持彩色
\RequirePackage{cite}                        %参考文献引用，得到形如[3-7]的样式.
\RequirePackage{url}
\RequirePackage{enumerate}
\RequirePackage[font=normalsize,textfont=up,labelsep=space]{caption} %图表标题格式
\RequirePackage{zhnumber}
\RequirePackage{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage{algpseudocode}
\RequirePackage{float}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage[numbers,sort&compress]{natbib}

%------------------------ 算法设置 ------------------------
\floatname{algorithm}{算法}
\renewcommand{\algorithmicrequire}{\bf 输入}
\renewcommand{\algorithmicensure}{\bf 输出}

%------------------------ 发表设置 ------------------------
\newenvironment{publications}[1]
  {\renewcommand\bibname{}\begin{thebibliography}{#1}}
  {\end{thebibliography}}

%------------------------ 上标引用 ------------------------
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}}  %自定义新命令\upcite，使参考文献引用以上标出现

%------------------------ 目录致谢 ------------------------
\renewcommand{\contentsname}{目\quad 录} %目录二字内含空格
\newcommand\acknowledgement{\backmatter\chapter[致\quad 谢]{致\quad 谢}} %致谢及致谢标题二字内均含空格

%------------------------ 标题设置 ------------------------
\CTEXsetup[nameformat={\heiti\zihao{-2}},titleformat={\heiti\zihao{-2}},number={\chinese{chapter}},name={第,章},afterskip={1ex},beforeskip={1ex}]{chapter}
\CTEXsetup[format={\heiti\zihao{-3}\raggedright}]{section}
\CTEXsetup[format={\heiti\zihao{4}\raggedright}]{subsection}
\CTEXsetup[format={\heiti\zihao{-4}\raggedright}]{subsubsection}
\CTEXoptions[bibname={参考文献}]

%------------------------ 目录设置 ------------------------
\setcounter{tocdepth}{1}     %控制目录显示标题的级别，0为一级标题，1为二级标题，以此类推
\setcounter{secnumdepth}{4}  %最多显示4级标题序号

%------------------------ 图片路径 ------------------------
\graphicspath{{figures/}}        %图片放在figures文件夹

\endinput