function [distance] = distance(m, la, tau0, tau1)
    [x0, y0, z0] = point(m, la, tau0) ;
    [x1, y1, z1] = point(m, la, tau1) ;
    distance = sqrt ((x1-x0)^2 + (y1-y0)^2 + (z1-z0)^2) ;
end
