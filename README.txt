Stingescu Andrei Petrut 342C2
Accuracy on train: 0.73(73%)
Accuracy on test: 0.56(56%)

Descrierea implementarii

1. Implementare corelatie
In cadrul acestei cerinte, am aplicat algoritmul descris in partea de corelatie pentru semnale cu lungimi diferite. Am observat in
momentul in care am aplicat algoritmul cerut ca nu se obtinea graficul corect, problema provenind de la calcularea acelor medii.
Dupa eliminarea mediilor graficul a iesit ok impreuna cu calcularea maximului(obtinerea maximului --> functia max)

2. Detectie
Pentru acesta cerinta pur si simplu am definit cele 2 semnale, insa am adaugat h(101) = 0, ca sa iasa plot-ul cum arata in enunt
 

3. Afisati spectrul filtrelor
Aici am folosit functiile de plot aplicate pe filters(:, 1) si filters(:, 2). Mai departe pentru fiecare filtru, i-am calculat
spectrul dupa care am afisat magnitudinea acestuia. Trebuie mentionat faptul ca pentru obtinerea magnitudinii corespunzator frecventelor pozitive,
am luat in calcul doar prima jumatate a rezultatului fft-ului coefs = coefs(1: sizeFilter / 2)

4. Filtrare rapida
Pentru crearea si filtrarea ferestrelor am procedat in felul urmator:
Am obtinut numarul de semnale, dimensiunea unui semnal, dupa am procedat in felul urmator: din semnalul curent extrag de fiecare data cate K esantionane(echivalentul pentru un frame) 
cu o distanta intre ferestre de floor((12/1000) * fs) pana cand parcurg tot semnalul. Trebuie mentionat faptul ca la final mai ramane de adaugat o fereastra
incompleta si dupa discutia de pe forum, nu am mai adaugat-o in vectorul de ferestre(F * K). Dupa ce am calculat vectorul de frames, 
am calculat matricea matrixO conform enuntului(produs scalar intre fereastra si filtrul inversat). 
Cu ajutorul functiilor mean si std aplicate pe rand fiecarei coloane din matrixO, calculez media si deviatia standard.
In urma acestor calcule vom obtine un vector de feature-uri, de dimensiune 2 * M care va urma sa fie concatenat la matricea feat_train.

5. Filtrare rapida
Pentru aceasta cerinta, am luat cate un semnal din feat_test si i-am calculat corelatia cu fiecare semnal din feat_train. 
In urma acestor calcule am obtinut matricea similarities (Dtest, Dtrain).
Dupa ce am obtinut vectorul de corelatii cu ajutorul functiei my_corr2 pentru fiecare semnal din feat_test, l-am ordonat crescator cu functia sortArrays si am
tinut cont de pozitiile elementelor in indexVector. Dupa sortare am luat cele mai mari top_k valori din vectorul sortat si am ales
valoarea care se repeta cel mai frecvent(functia majority) dupa care am adaugat indexul corespuzator al acesteia in vectorul predictions