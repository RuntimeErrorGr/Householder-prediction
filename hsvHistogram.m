function [sol] = hsvHistogram(path_to_image, count_bins)
  HSVIm = RGB2HSV(path_to_image);         # conversie la hsv
  [m,n] = size(HSVIm);
  f =  1.01 / count_bins;
   for i = 1 : count_bins                 # creez un vector de intervale
    edges(i) = [((i-1) * f)];     
    edges(i+1) = [((i-1) * f + f)];
  endfor
  h = HSVIm(:,:,1);                       # matrice corespunzatoare H
  r = histc(h,edges);                     # matrice cu frecventele de aparitie
  r = r';
  H = sum(r);                             # histograma H
  H(end) = [];
  s = HSVIm(:,:,2);                       # matrice corespunzatoare S
  b = histc(s,edges);                     # matrice cu frecventele de aparitie
  b = b';
  S = sum(b);                             # histograma S
  S(end) = [];
  v = HSVIm(:,:,3);                       # matrice corespunzatoare V
  g = histc(v, edges);                    # matrice cu frecventele de aparitie
  g = g';                             
  V = sum(g);                             # histograma V
  V(end) = [];  
  sol = [H S V];                          # histograma imagine
end