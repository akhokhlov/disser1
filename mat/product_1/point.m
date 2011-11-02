function [x,y,z] = point(m, la, tau)
    x = tau*abs(m).*cos(arg(m) + tau*imag(la));
    y = tau*abs(m).*sin(arg(m) + tau*imag(la));
    z = tau*real (la);
end