function launcher
    addpath transition;
    
type = 1;
tau = .5;
number = 16;
c = 1;
epsilon = .05;
dir = 'graphs';
ext = 'eps';
minX = -2.5;
maxX = 2.5;

figure1 =   transition_plotter_boundness(type, tau, number, .5, epsilon, dir, ext, minX, maxX);
            transition_plotter_boundness(type, tau, number, 1, epsilon, dir, ext, minX, maxX, figure1);
            transition_plotter_boundness(type, tau, number, 2, epsilon, dir, ext, minX, maxX, figure1);

%    if type == 1
%         typeName = 'asym';
%     else
%         typeName = 'sym';
%     end
%     
%     strTau = num2str(tau);
%     if length(strTau) < 3
%         strTau = [strTau '_0'];
%     end
%     strC = num2str(c);
%     if length(strC) < 3
%         strC = [strC '_0'];
%     end
%  
%     %mkdir(dir);
%     figureName = [typeName '-' strTau '-' num2str(number) '-' num2str(strC)];
%     
%     % replace decimal point 
%     figureName = strrep(figureName, '.', '_');
%     
%     set(figure1, 'PaperPositionMode', 'auto')   % Use screen size
%     
%     if strcmp(ext, 'png')
%         saveas(figure1, [dir filesep figureName '.png'], 'png');
%     else
%         saveas(figure1, [dir filesep figureName '.eps'], 'psc2');
%     end
%     
%     
%     %close;

end