1) rgbHistogram:
	Pentru calcularea histogramei RGB a imaginii am creat initial un vector 
de intervale pe baza formulelor furnizate in enunt. Apoi am extras fiecare 
fasie a matricei de pixeli(matrice 3D), obtinand astfel 3 matrici 2D cu valorile
pentru rosu, verde respectiv albastru. Cu ajutrul functie histc am facut
distributia pe intervale a valorilor de pe fiecare coloana si pentru a obtine
valoarile totale pe intervale (adica histograma)  am adunat valorile de pe coloane.
Se repeta procedeul pentru fiecare culoare si la final se concateneaza 
cele 3 histograme pentru a obtine histograma imaginii.

2) hsvHistogram: 
	Procesul este similar cu cel de la calcularea rgbHistogram, doar ca 
difera formula folosita pentru crearea vectorului de intervale.
	Deoarece imaginea citita initial este in format RGB, am facut conversia ei
la HSV cu ajutorul functiei RGB2HSV implementata cu ajutorul algoritmului din 
enunt pe care l-am scalat la o matrice de pixeli.