function majorityClass = majority(vectorK)
    majorityClass = 0;
    repetead = 0;
    top_k = length(vectorK);
    for i = 1 : top_k
        %cate aparitii are in vector
        repeteadElem = 0;
        for j = 1 : top_k 
            if vectorK(i) == vectorK(j)
                repeteadElem = repeteadElem + 1;
            end
        end
        %stochez clasa cu cele mai multe aparitii + cea mai mare in caz de
        %egalitate
        if(repeteadElem > repetead) 
            majorityClass = vectorK(i);
            repetead = repeteadElem;
        else if(repeteadElem == repetead && vectorK(i) > majorityClass) 
            majorityClass = vectorK(i);
            repetead = repeteadElem;
        end
    end
end