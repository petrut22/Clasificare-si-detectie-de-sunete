function [vectorSorted, indexesSorted] = sortArrays(vector, indexes)
    flag = true;
    vectorSorted = [];
    indexesSorted = [];
    N = length(vector);
    %sortare cu BubbleSort
    while(flag)
        flag = false;
        for i = 1 : (N - 1)
            if vector(i) > vector(i + 1)
                vector([i;i+1]) = vector([i+1;i]);
                indexes([i;i+1]) = indexes([i+1;i]);
                flag = true;
            end
        end
    end
       
    vectorSorted = vector;
    indexesSorted = indexes;


end