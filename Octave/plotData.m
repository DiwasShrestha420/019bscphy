function plotData(x, y)
%PLOTDATA Plots the data points x and y into a new figure 

figure; % open a new figure window
plot(x,y,'r.','MarkerSize',5),xlabel('a'),ylabel('b')
hold on;
plot(x,y,'bo','MarkerSize',5)
title('c')
end
