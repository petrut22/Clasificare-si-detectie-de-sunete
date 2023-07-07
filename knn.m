function [similarities, predictions] = knn(labels_train, feat_train, feat_test, top_k)
    [Dtrain, M] = size(feat_train);
    [Dtest, M] = size(feat_test);
    predictions = [];
    %vector de indecsi
    indexVector = [];
    vectorSimilarity = [];
    similarities = [];
   
   %iterez prin fiecare sunet de pe coloana i si calculez corelatia cu toate
   %sunetele din feat_train, rezultatele sunt adaugate in vectorSimilarity
   for i = 1 : Dtest
       for j = 1 : Dtrain
            audioTest = feat_test(i, :)';
            audioTrain = feat_train(j, :)';
            y = my_corr2(audioTrain, audioTest);
            vectorSimilarity(j) = y;
            indexVector(j) = j;
       end

       similarities = [similarities; vectorSimilarity];
       %sortez vector de corelatii impreuna cu vectorul de indecsi
       [vectorSimilarity, indexVector] = sortArrays(vectorSimilarity, indexVector);

       vectorK = [];
       %obtin cei top_k vecini din vectorul de corelatii
       for j = 1 : top_k
           vectorK(top_k - j + 1) = labels_train(indexVector(Dtrain - j + 1));
       end
        
       %calculez clasa majoritara
       predictions(i , 1) = majority(vectorK);

       
end
