%searchPointInRowConsole(4, .5, 2*pi/41*29*180/pi, .01)
function [half, res] = searchPointInRowConsole(number, tau, phi_gradus, epsilon)
phi_gradus
r = [0 3];
phi = phi_gradus*pi/180;
% step 1.
res = cone_simple(r(2), phi, number);
while length(res) >= 2 && res(2) > tau
    r(2) = r(2) + 1;
    res = cone_simple(r(2), phi, number);
end
% step 2.
for iter = 1:18
    disp(' ');
    disp(['Step ' num2str(iter) ' ========================>'])
    half = sum(r)/2;
    res = cone_simple(half, phi, number);

    disp([sprintf('       r(1)=%1.8f, r(2)=%1.8f, tau=', r(1), r(2)) arr2str(res)]);
    
    if length(res) >= 2 && abs(res(2) - tau) < epsilon
        break;
    end
    if isempty(res) || (length(res) >=2 && res(2) < tau)
        r(2) = half;
    else
        r(1) = half;
    end
end
end