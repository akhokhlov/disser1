function cone_art2_1
    
    cone();
    points(-1.5, 0.7, 1.4, 1);
    points(-0.5, -0.22, 2, 1);
    view(-128,40);

    function [result] = cone(maxdistanse, resolution)

    if exist('n', 'var') == false 
        n=100;
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Построение конуса.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tau_cone = 1.5;
    W = pi/tau_cone-0.5; %pi/6;

    w=-W:2*W/100:W;         %вектор для реализации основания конуса(круг)
    %z=-1/tau_cone:0.1:1.5;            %накопление вектора z
    z=-w./tan(w*tau_cone);
    [W,Z]=meshgrid(w,z);        %задание 3-х мерной матрицы(пространства)

    X=W.*sin(tau_cone*W) - Z.*cos(tau_cone*W); %задание вектора фигуры по оси x
    Y=-W.*cos(tau_cone*W) - Z.*sin(tau_cone*W);%задание вектора фигуры по оси y


    for ii=n/2+1 : n+1
    for j=1 : n+1 
    Z(ii,j)=1;%tau_cone/(tau_cone);
    X(ii,j)=1-z(50);
    Y(ii,j)=0;
    end
    for j=1:1:ii-51
    X(ii-50,j)=X(ii-50,ii-50);
    X(ii-50,102-j)=X(ii-50,ii-50);
    Y(ii-50,j)=0;
    Y(ii-50,102-j)=0;
    end
    end


    %отрисовка конуса по 3-м заданным координатам
    hold on;
    shading interp;                       
    colormap(gray);

    mesh(X, Y, Z)
    xlabel('$u_{1}$','Interpreter','latex','FontSize',30);
    ylabel('$u_{2}$','Interpreter','latex','FontSize',30);
    zlabel('$u_{3}$','Interpreter','latex','FontSize',30);

    view([-30 30]);
    %alpha(.2);
    end


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Построение точек и вычисления.
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    function points(a, b, tau, geometry)
        % Выбираем несколько (10) точек кривой и определяем находятся ли они внутри
        % конуса. Для этого находим собственные числа.

        result = [0 Inf];
        n = 100;
        t = 0:2*pi/(n-1):2*pi;
        j=1:n;
        if geometry == 1
            lambda = 1 + a*exp(1i*2*pi*j/n);
            mu = b*exp(-1i*2*pi*j/n);
        % Calculating point for displaying.
        U = [tau*b*cos(-t + a*tau*sin(t))
             tau*b*sin(-t + a*tau*sin(t))
             tau*(1 + a*cos(t))];
        elseif geometry == 2
            lambda = ones(1,n);
            mu = a*exp(1i*2*pi*j/n) + b*exp(-1i*2*pi*j/n);
        % Calculating point for displaying.
        U = [tau*abs(b+a)*cos(t)
             tau*abs(b-a)*sin(t)
             tau*ones(1, n)];
        end
        
%         for j=1:n
%             intervals = getIntervals(lambda(j), mu(j));
%             result = intersection(result, intervals);
%             % инвертируем рузультат, чтоб внешние точки отобразить красными.
%             text(U(1,j), U(2,j), U(3,j), '*', 'color', ...
%                 [~isInside(intervals, tau) 0 0], 'fontsize', 20);
%         end

        plot3(U(1,:), U(2,:), U(3,:), 'color', 'k', 'linewidth', 2);
    end
end