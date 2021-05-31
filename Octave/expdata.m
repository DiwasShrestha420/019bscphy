x=(0:0.5:8);y=(0:0.1875:3);
x=x';y=y';
for i=1:length(x)
  x(i,1)=exp(y(i,1))+sin(x(i,1))/4;
  endfor