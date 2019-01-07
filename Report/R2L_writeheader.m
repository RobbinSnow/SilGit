function R2L_writeheader(texfile,doktitle,dokauthor,opt_addheader)
% THIS IS PART OF REPORT2LATEX (R2L)
% 
% INPUTS:
% texfile      : complete path to the .tex file
% doktitle     : Document title (will be displayed in LATEX document).
% dokauthor    : Author (will be displayed in LATEX document).
% opt_addheader: Optional/additional header Text
% 
% OUTPUTS:
% none
% 
% FUNCTION:
% This function writes a new .tex file and adds a header. 
% CAUTION: If the file already exists it will be rewritten!
% 
% Jahn Ruehrig 2017

if nargin<4
    opt_addheader='';
end

CA1={'\documentclass[12pt]{report}';...
    strcat('\title{',doktitle,'}');...
    strcat('\author{',dokauthor,'}');...
    '\date{\today}';...
    '\usepackage{float}';... 
    '\usepackage[english]{babel}';...
    '\usepackage[utf8]{inputenc}';...
    '\usepackage{fancyhdr}';...
    '\usepackage{graphicx}';...
    '\usepackage{subfigure}';...
    '\usepackage[nottoc,notlot,notlof]{tocbibind} ';...
    '\usepackage{cite}';...
    '\usepackage{tikz} ';...
    '\usepackage{color}';...
    '\usepackage[toc,page]{appendix}';...
    '\usepackage[ nonumberlist,acronym,toc,section]{glossaries} ';...
    '\usepackage{CJK}';...
    '\usepackage[';...
     'colorlinks=true,';...
     'urlcolor=pdfurlcolor,';...
     'filecolor=pdffilecolor,';...
     'linkcolor=black,';...
     'raiselinks=true,';...
     'breaklinks,';...
     'backref=page,';...
     'pagebackref=false,';...
     'verbose,';...
     'hyperindex=true,';...
     'linktocpage=true,';...
     'hyperfootnotes=false,';...
     'bookmarks=true,';...
     'bookmarksopen=true,';...
     'bookmarksopenlevel=\maxdimen,';...
     'bookmarksnumbered=true,';...
     'bookmarkstype=toc,';...
     'plainpages=false,';...
     'pageanchor=true,';...
     strcat('pdftitle=',doktitle,',');...
     strcat('pdfauthor=',dokauthor,',');...
     'pdfcreator={MATLAB},';...
     'pdfstartview=Fit,';...
     'pdfpagemode=UseOutlines,';...
     'pdfpagelabels=true,';...
     'pdfpagelayout=TwoPageRight,';...
     ']{hyperref}';...
    '\pagestyle{fancy}';...
    '\fancyhf{}';...
    '\rhead{EP21 ADAS HIL Test}';...
    '\lhead{SAIC Motor}';...
    '\rfoot{Page \thepage}';...
    '';
    '%%%%%%% OPTIONAL HEADER %%%%%%%%%%%%%';
    };
    
CA2={'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%';    
    '\begin{document}';...
    '\maketitle';...
    };


CA=[CA1;opt_addheader;CA2];

    writeheader(texfile,CA);


end


function writeheader(texfile,CA)
%% WRITE THE HEADER TO A TEX FILE DELETING EVERYTHING THAT WAS THERE BEFORE

si=size(CA,1);

fid = fopen( texfile, 'wt' );
% fid = fopen( 'test.tex', 'a+' );

for cnt=1:si
    
    fprintf( fid, '%s \n', CA{cnt} );

end

fclose(fid);

end





