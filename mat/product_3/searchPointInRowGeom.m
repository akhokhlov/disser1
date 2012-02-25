% Алгоритм:
% 1. Ищем r(2) такое, чтобы отрезок устойчивости по tau был либо пустым, либо
% второе значение было меньше tau.
% 2. Методом половинного деление отрезка [r(1), r(2)] добиваемся заданной
% точности по tau.
function [half, res] = searchPointInRowGeom(type, number, tau, phi, epsilon)
r = [0 2];
% step 1.
res = straightStabAnalizer(type, r(2)*cos(phi), r(2)*sin(phi), number, tau);
while res
    r(2) = r(2) + 1;
    res = straightStabAnalizer(type, r(2)*cos(phi), r(2)*sin(phi), number, tau);
end
% step 2.
for iter = 1:20
    %disp(' ');
    %disp(['Step ' num2str(iter) ' ========================>'])
    half = sum(r)/2;
    res = straightStabAnalizer(type, half*cos(phi), half*sin(phi), number, tau);
    
%     if length(res) >= 2 && abs(res(2) - tau) < epsilon
%         break;
%     end
    if res
        r(1) = half;
    else
        r(2) = half;
    end
    
    if abs(r(1) - r(2)) < epsilon
        %disp (['Stopped on ' num2str(iter)]);
        %return;
    end
end
end