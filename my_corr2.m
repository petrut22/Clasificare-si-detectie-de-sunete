function y = my_corr2(x, h)
     N = length(x);
     K = length(h);
     upperSum = 0;
     hPowerSum = sum(h.^2);
     xPowerSum = sum(x.^2);
     for k = 1 : K
        upperSum = upperSum + h(k) * x(k);
     end
     hPowerSum = sqrt(hPowerSum);
     xPowerSum = sqrt(xPowerSum);
     y = upperSum / (hPowerSum * xPowerSum);
end
