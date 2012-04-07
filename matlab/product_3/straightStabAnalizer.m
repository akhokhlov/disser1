function [stab] = straightStabAnalizer(type, a, b, number, tau, c)

j = 1:number;

if type == 1
    % первый тип соединения нейронов. 
    lambda = c + a*exp(1i*2*pi.*j/number);
    mu = b*exp(-1i*2*pi.*j/number);
else
    % второй тип соединения нейронов. 
    lambda = ones (size (j));
    %mu = a*exp(1i*2*pi.*j/number) + b*exp(-1i*2*pi.*j/number);
    %c=.00001;
    B = diag(b*ones(number-1,1),1) + diag(a*ones(number-1,1),-1) + diag(a*c, number-1) + diag(b*c,-(number-1));
    mu = eig(B);
end

% вычисление границы w.
PI=2*pi;
w=0:PI/100:PI;

maxW = zeros (1, number) ;
for k=j
    z = tau*real (lambda (k));
    if z < -1
        stab = false;
        return;
    end
    ycone = -z.*sin (w)- w.*cos (w) ;

    jj =1;
    while ycone (jj) <= 0
        jj = jj+1;
    end
    maxW (k) = w(jj) ;
%     if maxW (k) == 0
%         maxW (k) = 3/2*pi;
%     end
end
        
for k=j
    PI = maxW (k) ;
    w=-PI:PI/100:PI;

    m = mu (k) ;
    la = lambda (k) ;
    x = tau*abs(m).*cos(arg(m) + tau*imag(la));
    y = tau*abs(m).*sin(arg(m) + tau*imag(la));
    z = tau*real (la);

% ORIGIN    
    xcone =  w.*sin (w) - z.*cos (w);
    ycone = -w.*cos (w) - z.*sin (w) ;
    
    
    
    distArr = (x-xcone).^2 + (y-ycone).^2 ;

    minInd1 = 1;
    minInd2 = 2;
    for jj= 2:length (distArr) 
        if distArr (jj) < distArr (minInd1)
            minInd2 = minInd1;
            minInd1 = jj ;
        end
    end
    
   
    distCone = (xcone(minInd1)-1)^2 + ycone(minInd1)^2;
    distPoint = (x-1)^2 + y^2;
    
    if distPoint > distCone
        stab = 0;
        return;
    end
    
end

stab = 1;
end
