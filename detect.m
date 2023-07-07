function ind = detect(x, h, plot_results)

y = my_corr(x, h);
    
if plot_results
    figure;
    hold on;
    plot(x, LineWidth=3);
    plot(h, LineWidth=3);
    plot(y, LineWidth=3);
end


[valIndice, ind] = max(y)

end