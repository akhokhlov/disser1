function [phi r] = solver_boundness_smart_gyp(type, tau, number, epsilon, boundness, phi0)

radius = 1*epsilon;

r = zeros(1, 1000);
phi = zeros(1, 1000);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% вычисление начального угла
phi00=phi0+0.0001;
phi11=phi00;
r11 = searchPointInRowGeom(type, number, tau, phi11, radius);
while r11*cos(phi11-phi0) > boundness
    phi11=phi11+.5;
    r11 = searchPointInRowGeom(type, number, tau, phi11, radius);
end

for k=1:10
    phi_half = (phi00+phi11)/2;
    r_half = searchPointInRowGeom(type, number, tau, phi_half, radius);
    if r_half*cos(phi_half-phi0)>boundness
        phi00 = phi_half;
    else
        phi11 = phi_half;
    end
end

phi(1) = phi_half;
r(1) = r_half;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


n=1;
while n<1000 && phi(n)<phi0+pi/4 %phi(n)<=pi/2+phi0-(phi(1)-phi0)
    [r(n+1), phi(n+1)] = searchNeighbourhoodPoint(r(n), phi(n), radius);
    n = n+1;
    if phi(n-1) - phi(n) > 1
        break
    end
end

phi = [phi(1:n) 2*phi0+pi/2-phi(n-1:-1:1)];
r = [r(1:n) r(n-1:-1:1)];




function [x y] = translate (r, phi, r1, phi1)
    x = r*cos (phi) + r1*cos (phi + phi1);
    y = r*sin(phi) + r1*sin(phi + phi1);
end

    function [r, phi] = toPolar(x, y)
        r = sqrt(x^2 + y^2);
        if x>0
            if y>=0
                phi = atan(y/x);
            else 
                phi = atan(y/x) + 2*pi;
            end
        elseif x < 0
            phi = atan(y/x) + pi;
        else %if x == 0
            if y > 0
                phi = pi/2;
            elseif y<0
                phi = 3*pi/2;
            else
                phi = 0;
            end
        end
    end

    function [rEnd phiEnd] = searchNeighbourhoodPoint(r, phi, radius)
        phi0a = 0;
        phi1 = pi;
        for jj=1:10
            phiHalf = (phi1+phi0a)/2;
            [xHalf yHalf] = translate(r, phi, radius, phiHalf);
       
            stabHalf = straightStabAnalizer(type, xHalf, yHalf, number, tau);
            if stabHalf == 1
                phi1 = phiHalf;
            else
                phi0a = phiHalf;
            end
        end
        [rEnd phiEnd] = toPolar(xHalf, yHalf);
    end

end
