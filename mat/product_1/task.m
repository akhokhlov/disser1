%    a = [-1.8 -1.6 -1.4 -1.2  -1.00 -0.80 -0.6 -0.5 -0.2 0];
%    b = [ 1.1  1.14 1.18 1.22  1.28  1.33  1.4  1.44 1.22 1];
        
    
    
n = 4;
j = 1:n;


r = 1.99;
phi = pi/3;

a = -r*sin(phi);
b = r*cos(phi);

lambda = 1 + a*exp(1i*2*pi.*j/n);
mu = b*exp(-1i*2*pi.*j/n);
[res, int] = cone(lambda, mu, 7, 0.5);
title(res,'FontSize',15);
