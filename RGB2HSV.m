function [HSVIm] = RGB2HSV(path_to_image)
  imdata = imread(path_to_image);
  imdata = (double)(imdata);
  imdata = imdata / 255;
  r = imdata(:,:,1);
  g = imdata(:,:,2);
  b = imdata(:,:,3);
  Cmax = max(imdata,[],3);
  Cmin = min(imdata,[],3);
  delta = Cmax - Cmin;
  [m n] = size(delta);
  H = zeros(m,n);
  S = zeros(m,n);
  V = zeros(m,n);
  for i = 1 : m
    for j = 1 : n
      if delta(i,j)==0
        H(i,j) = 0;
      elseif Cmax(i,j) == r(i,j)
        H(i,j) = 60 * mod(((g(i,j) - b(i,j)) / delta(i,j)), 6);
      elseif Cmax(i,j) == g(i,j)
        H(i,j) = 60 * (((b(i,j) - r(i,j)) / delta(i,j)) + 2);
      elseif Cmax(i,j) == b(i,j)
        H(i,j) = 60 * (((r(i,j) - g(i,j)) / delta(i,j)) + 4);
      endif  
      if Cmax(i,j) == 0
        S(i,j) = 0;
      else
        S(i,j) = delta(i,j) / Cmax(i,j);
      endif
    endfor 
  endfor
  H = H / 360;
  V = Cmax;
  HSVIm(:,:,1) = H;
  HSVIm(:,:,2) = S;
  HSVIm(:,:,3) = V; 
endfunction
