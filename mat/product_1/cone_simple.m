function [result] = cone_simple(r, phi, number)

j = 1:number;

lambda = 1 + r*cos(phi)*exp(1i*2*pi.*j/number);
mu = r*sin(phi)*exp(-1i*2*pi.*j/number);

%lambda = ones (size (j));
%mu = r*(cos(phi)*exp(1i*2*pi.*j/number) + sin(phi)*exp(-1i*2*pi.*j/number));


% Contains all stability intervals.
all = [0 Inf];

for jj=1:length(lambda)
    
    % Calculation stability intervals.
    intervals = getintervals(lambda(jj), mu(jj));
	
	all = intersection(all, intervals);
end

result = all;


