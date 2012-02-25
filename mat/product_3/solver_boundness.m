function [result taus] = solver_boundness(type, number, tau, phis, epsilon)

result = zeros(1, length(phis));
taus = cell(size(length(phis)));
for j = 1:length(phis)
    
    [result(j) taus{j}] = searchPointInRowGeom(type, number, tau, phis(j), epsilon);
    
%     if j==34
%         searchPointInRowConsole(number, tau, phis(j)*180/pi, epsilon);
%     end
end
%searchPointInRow(4, .5, pi/2/10, .01)

end

