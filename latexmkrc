# latexmkrc at the root of the project
$pdflatex = 'lualatex -interaction=nonstopmode -halt-on-error %O %S';
$pdf_mode = 1;
$dvi_mode = 0;
$postscript_mode = 0;

# Set working directory for sources
$root_dir = 'Source';
chdir $root_dir if -d $root_dir;
