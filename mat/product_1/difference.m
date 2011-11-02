function graph1
    
    close all;

    % Create figure
    figure1 = figure('InvertHardcopy','off','Color',[1 1 1], ...
        'position', [0 0 600 570]);
    set(figure1,'PaperUnits','centimeters');
    xSize = 8; ySize = 12;
    xLeft = (21-xSize)/2; yTop = (30-ySize)/2;
    %set(figure1,'PaperPosition',[xLeft yTop xSize ySize]);
    %set(figure1,'Position',[X Y xSize*50 ySize*50]);


    

    hold on
    %axis([-1.7 1.7 -1.7 1.7]);
    axis([-2 2 -2 2]);
    
    plot([-2 0], [1 -1], 'color', 'k', 'LineWidth', 3);
    plot([0 2], [1 -1], 'color', 'k', 'LineWidth', 3);

    plot([-1 0], [0 1], 'color', 'k', 'LineWidth', 3);
    plot([0 1], [-1 0], 'color', 'k', 'LineWidth', 3);


    % Дополнительные границы
    plot([-2  2], [ 2  2], 'k', 'LineWidth', 1);
    plot([ 2  2], [-2  2], 'k', 'LineWidth', 1);

    % Экспериментальные данные для бесконечно большого числа нейронов.
    % tau = 0.5
    a = [ -1.08 -1.00 -0.80 -0.60 -0.40 -0.2 0 ];
    b = [  1.08  1.15  1.3   1.38  1.36  1.2 1 ];
    interp(a, b, true, 'b');
    
    % полученные значения для n=3
    a = [-1.8  -1.6 -1.4 -1.3 -1.20 -1.1 -1.00 -0.9 -0.80 -0.7 -0.60 -0.40 -0.20 0];
    b = [ 1.92  1.83 1.7  1.71 1.67  1.63 1.05  1.56 1.52  1.49 1.45  1.39  1.32 1];
    %interp(a, b, 'k');

    % полученные значения для n=4
    a = [-2 -1.8 -1.6 -1.4 -1.2  -1.00 -0.80 -0.6 -0.5 -0.2  0];
    b = [ 1  1.1  1.14 1.18 1.22  1.28  1.33  1.4  1.44 1.22 1];
    interp(a, b, false, 'k', 4);
    
    % полученные значения для n=5
    a = [-1.08 -1.00 -0.80 -0.60 -0.40 -0.20 0];
    b = [ 1.08  1.17  1.32  1.47  1.39  1.24 1];
    %interp(a, b, 'k', 5);
    
    % полученные значения для n=6
    a = [ -1.2  -1.00 -0.80 -0.60 -0.40  0];
    b = [  0.96  1.17  1.38  1.45  1.38 1];
    %interp(a, b, 'k',6);
    
    
    
    % полученные значения для n=7
    a = [-1.4 -1.20 -1.00 -0.80 -0.60 -0.40 0];
    b = [ 0.67  0.98  1.24  1.4  1.41  1.39 1];
    %interp(a, b, 'k', 7);

    % полученные значения для n=10
    a = [ -1.4 -1.20 -1.00 -0.80 -0.60 -0.40  0];
    b = [  0.7  1.02  1.2  1.34  1.42  1.37  1];
    %interp(a, b, 'k', 10);


    grid; 

    % Функция интерполирует экспериментальные данные
    function interp(a, b, sim, color, titleString)
        x = a(1):.001:a(end);
        y = interp1(a, b, x, 'spline' );

        if sim
            xx = [x -y(end-1:-1:1)];
            yy = [y -x(end-1:-1:1)];
        else 
            xx = x;
            yy = y;
        end

        plot(xx, yy, color, 'LineWidth', 3);
        plot(-xx, -yy, color, 'LineWidth', 3);

        aa = [a -b(end:-1:2)];
        bb = [b -a(end:-1:2)];
        %plot(aa, bb, 'ok', xx, yy, color, 'LineWidth', 1);
        %plot(-aa, -bb, 'ok', -xx, -yy, color, 'LineWidth', 1);
        if exist('titleString', 'var') 
            title(['n = ' num2str(titleString)],'FontSize',15);
        end
    end

% Autogenerated code.
% Create xlabel
xlabel({'a'}, 'FontSize',14);

% Create ylabel
ylabel({'b'}, 'FontSize',14);

% Create textbox
annotation(figure1,'textbox',...
    [0.19904017857143 0.254566473988439 0.133459821428571 0.0708202587393341],...
    'String',{'instability'},...
    'FontSize',16,...
    'FitBoxToText','off',...
    'LineStyle','none',...
    'EdgeColor',[1 1 1]);

% Create textbox
annotation(figure1,'textbox',...
    [0.654821428571429 0.783236994219653 0.133459821428571 0.0708202587393341],...
    'String',{'instability'},...
    'FontSize',16,...
    'FitBoxToText','off',...
    'LineStyle','none',...
    'EdgeColor',[1 1 1]);

% Create textbox
annotation(figure1,'textbox',...
    [0.261830357142862 0.733346957238293 0.0430133928571401 0.0446380401871719],...
    'String',{'\tau=0.5'},...
    'FontSize',16,...
    'FitBoxToText','off',...
    'LineStyle','none',...
    'EdgeColor',[1 1 1]);

% Create textbox
annotation(figure1,'textbox',...
    [0.700424107142862 0.28389837303561 0.0430133928571401 0.0446380401871719],...
    'String',{'\tau=0.5'},...
    'FontSize',16,...
    'FitBoxToText','off',...
    'LineStyle','none',...
    'EdgeColor',[1 1 1]);


% Create textbox
annotation(figure1,'textbox',[0.416071428571428 0.402380952380954 0.2 0.2],...
    'String',{'delay','independent','stability'},...
    'FontSize',16,...
    'FitBoxToText','off',...
    'LineStyle','none',...
    'EdgeColor',[1 1 1]);

end