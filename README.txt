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


3)convert: 
transforma o imagine in format RGB intr-o imagine in format HSV, astfel:
	- Sunt aduse valorile componentelor r, g si b in intervalul [0, 1]
	- Se concateneaza componentele r, g si b modificate
	- Se determina valorile maxime, respectiv minime ale imaginii formate din componentele 
	modificate
	- Se calculeaza componentele h, s si v ale imaginii in format hsv
	- Se concateneaza elementele h, s si v pentru a obtine imaaginea in format hsv

6) hsvHistogram:
returneaza histograma HSV a unei imagini, astfel:
	- Se citeste matricea imaginii
	- Se face conversia imaginii din format RGB in format HSV folosind functia convert
	- Se stabilesc intervalele in care vor fi incadrati pixelii
	- Se concateneaza cele trei componente pentru a obtine histograma imaginii

5) Householder: 
realizeaza factorizarea unei matrice intr-o matrice ortogonala si una superior 
triunghiulara(algoritmul este cel din curs/laborator/disponibil pe site-ul de curs), 
astfel:
	- Calculare reflector Householder
	- Transformare coloana p din Ap
	- Transformare coloanele p + 1 : n din Ap
	- Transformare coloanele 1 : n din H

6) SST: 
rezolva un sistem superior triunghiular prin metoda substitutiei (algoritmul este
cel din curs/laborator/disponibil pe site-ul de curs), astfel:
	- Se initializeaza vectorul de solutii cu 0
	- Se obtine solutia sistemului prin substitutie inapoi

7) preprocess:
returneaza matricea de caracteristici si vectorul de etichete pentru un set de imagini 
cu sau fara pisici, astfel:
	- Se stabilesc caile catre cele doua directoare cu imagini: cats, respectiv not_cats
	- Se salveaza calea catre imaginile din cele doua foldere in doua matrice: cats, respectiv 
	not_cats
	- Se calculeaza histogramele imaginilor si acestea sunt salvate intr-o matrice
	- Se initializeaza vectorul coloana de etichete cu 1 pentru imaginile cu pisici, respectiv -1 
	pentru cele fara pisici

8) learn: 
returneaza vectorul de parametri ai modelului, astfel:
	- Se bordeaza matricea de caracteristiic cu 1 pe ultima coloana
	- Se factorizeaza Householder matricea de caracteristici
	- Se rezolva sistemul de ecuatii folosind metoda substitutiei pe un sistem superior 
	triunghiular

9) evaluate:
calculeaza procentul de imagini clasificate corect(cats/not cats), astfel:
	- Se stabilesc caile catre cele doua directoare cu imagini: cats, respectiv not_cats
	- Se salveaza calea catre imaginile din cele doua foldere in doua matrice: cats, 
	respectiv not_cats
	- Se initializeaza numarul de imagini clasificate corect cu 0, si a cata coloana 
	trebuie bordata cu 1
	- Se calculeaza histogramele imaginilor, iar matricea rezultata se bodeaza cu 1 pe a 
	max_col coloana
	- Se verifica daca imaginea a fost clasificata corect, respectiv produsul dintre w si 
	matricea bordata este 1 pentru imagini cu pisici si -1 pentru imagini fara pisici
	- Se calculeaza procentajul de imagini clasificate corect
