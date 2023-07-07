function feat_train = get_features(audio_train, fs, filters, plot_figs)
    [dimSignal, nrSignals] = size(audio_train);
    frameStep = floor((12/1000) * fs);
    [K, M] = size(filters);
    feat_train = [];    
    %parcurg fiecare semnal
    for currSignal = 1 : nrSignals
        frames = [];
        index = 1;
        
        %fragmentez semnalul in ferestre
        while index < dimSignal
            audioFrame = [];
            counter = 1;
            if(dimSignal >=  index && dimSignal >= index + K - 1)
                finalFrameIndex = index + K - 1;
                %stochez K esantioane de fiecare data
                for j = index : finalFrameIndex
                    audioFrame(counter) = audio_train(j , currSignal);
                    counter = counter + 1;
                end
                %la final adaug in vectorul de ferestre, fereastra obtinuta
                frames = [frames; audioFrame];
            end
            index = index + K + frameStep;
        end
        
        %matricea O obtinuta din produsul scalar dintre ferestra si filtru
        %inversat (F * M) F numarul de ferestre
        matrixO = abs(frames * fliplr(filters));
        row_feat = [];
        
        for i = 1 : M
            %media si deviatia standard a reprezentarii o 
            row_feat = [row_feat, mean(matrixO(:, i)), std(matrixO(:, i))];
        end
        %adaugam vectorul 2 * M in matricea de feat_train 
        feat_train = [feat_train; row_feat];

    end
end