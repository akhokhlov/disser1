
% Алгоритм:
% 1. Ищем r(2) такое, чтобы отрезок устойчивости по tau был либо пустым, либо
% второе значение было меньше tau.
% 2. Методом половинного деление отрезка [r(1), r(2)] добиваемся заданной
% точности по tau.
function [half, res] = searchPointInRow(number, tau, phi, epsilon)
r = [0 2];
% step 1.
res = cone_simple(r(2), phi, number);
while length(res) >= 2 && res(2) > tau
    r(2) = r(2) + 1;
    res = cone_simple(r(2), phi, number);
end
% step 2.
for iter = 1:20
    %disp(' ');
    %disp(['Step ' num2str(iter) ' ========================>'])
    half = sum(r)/2;
    res = cone_simple(half, phi, number);
    
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