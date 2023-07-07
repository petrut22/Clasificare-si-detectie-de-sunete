function y = my_corr(x, h)
     N = length(x);
     K = length(h);
    for n = 1 : (N - K)
        upperSum = 0;
        hPowerSum = sum(h.^2);
        xPowerSum = 0;
        for k = 1 : K
            upperSum = upperSum + h(k) * x(k + n);
            xPowerSum = xPowerSum + x(k + n) * x(k + n);
        end
        hPowerSum = sqrt(hPowerSum);
        xPowerSum = sqrt(xPowerSum);
        y(n) = upperSum / (hPowerSum * xPowerSum);
    end
    %primesc la final valori de Nan in vector si nu se pot pune pe grafic
    %asa ca le marcam cu 0
    yNan = isnan(y); 
    for i = 1: length(yNan)
        if(yNan(i) == 1)
            y(i) = 0;
        end
    end

end
