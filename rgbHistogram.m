function [sol] = rgbHistogram(path_to_image, count_bins)
  imdata = imread(path_to_image);
  [m,n] = size(imdata);
  f =  256 / count_bins;
  for i = 1 : count_bins              # creez un vector de intervale
    edges(i) = [(i-1) * f];
    edges(i+1) = [(i-1) * f + f];
  endfor
  reds = imdata(:,:,1);               # matricea corespunzatoare rosu
  r = histc(reds,edges);              # matrice cu frecventele de aparitie
  r = r';
  R = sum(r);                         # histograma rosu
  R(end) = [];
  blues = imdata(:,:,2);              # matrice corespunzatoare albastru
  b = histc(blues,edges);             # matrice cu frecventele de aparitie
  b = b';
  B = sum(b);                         # histograma albastru
  B(end) = [];
  greens = imdata(:,:,3);             # matrice corespunzatoare verde
  g = histc(greens, edges);           # matrice cu frecventele de aparitie
  g = g';
  G = sum(g);                         # histograma verde
  G(end) = [];
  sol = [R B G];                      # histograma imagine
endfunction