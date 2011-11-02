function [r phi taus] = solver_boundness_smart(number, tau, epsilon)

dist_etalon = 0.01;
phi(1) = 0;
phi(2) = 0.01;
j = 2;

[r(1) taus{1}] = searchPointInRow(number, tau, phi(1), epsilon);
[r(2) taus{2}] = searchPointInRow(number, tau, phi(2), epsilon);
d = dist (r(1), phi (1), r (2), phi (2));
d1=d;


while phi(end) < 2*pi
    j = j + 1;
    phi(j) = phi(j-1) + 2*pi*0.01*dist_etalon/(d+d1)*2;
    [r(j) taus{j}] = searchPointInRow(number, tau, phi(j), epsilon);
    d1=d;
    d = dist (r(j-1), phi(j-1), r(j), phi(j));
    
%     if abs (r (j) -r (j-1)) >0.1
%         'achtung!!!'
%     end
end

end

function [d] = dist (r1, a, r2, b)
    d = sqrt ((r1*cos (a) - r2*cos (b))^2 + (r1*sin (a) - r2*sin (b))^2) ;
end


