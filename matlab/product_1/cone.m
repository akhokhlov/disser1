%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Строит конус устойчивости и множество точек для раличных tau.
%
% Usage: cone(lambda, mu), 
%        where lambda, mu are the eigenvalues of matrixes A, B.
% Example:
% cone ([0.06+1.8658i 0.06-1.8658i],[0.025+0.1555i 0.025-0.1555i], 7, 0.5)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [result, intervalsCell] = cone(lambda, mu, maxdistanse, resolution)
    if exist('n', 'var') == false 
        n=100;
    end

    % Построение конуса.
    tau_cone = 1;
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

    % Отрисовка конуса по 3-м заданным координатам.
    hold on;
    hold on;
    shading interp;                       
    colormap(gray);

    mesh(X, Y, Z)
    xlabel('$u_{1}$','Interpreter','latex','FontSize',30);
    ylabel('$u_{2}$','Interpreter','latex','FontSize',30);
    zlabel('$u_{3}$','Interpreter','latex','FontSize',30);

    view([-30 30]);
    alpha(.2);

    % Построение точек.
    all = [0 Inf]; 
    intervalsCell = cell(size (lambda) ) ;
    for j=1:length(lambda)
        la = lambda(j);
        m = mu(j);

        % Calculation stability intervals.
        intervals = getintervals(lambda(j), mu(j));
        intervalsCell{j} = intervals;

        all = intersection(all, intervals);

    if exist('maxdistanse', 'var') == false 
        maxdistanse = 7;
    end
    if exist('resolution', 'var') == false 
        resolution =0.5;
    end

        dist_real = distance(m, la, 0, 1) ;
        max_tau = maxdistanse/dist_real;
        dist_real = distance(m, la, max_tau, max_tau-max_tau/10) ;
        quantity = dist_real/resolution*10;
        tau = 0.001 : max_tau/quantity : max_tau;

        for jj=1:length(tau)
            x = tau*abs(m).*cos(arg(m) + tau*imag(la));
            y = tau*abs(m).*sin(arg(m) + tau*imag(la));
            z = tau*real (la);

            if isInside(intervals, tau(jj))
                color = 'b';
            else 
                color = 'r';
            end
            text(x(jj), y(jj), z(jj), '*', 'color', color, 'fontsize', 20);
        end
        text(x(jj), y(jj), z(jj), num2str(j), 'color', color, 'fontsize', 20);
    end

    result = all;
end
    
    function [x,y,z] = point(m, la, tau)
        x = tau*abs(m).*cos(arg(m) + tau*imag(la));
        y = tau*abs(m).*sin(arg(m) + tau*imag(la));
        z = tau*real (la);
    end
    
    function [distance] = distance(m, la, tau0, tau1)
        [x0, y0, z0] = point(m, la, tau0) ;
        [x1, y1, z1] = point(m, la, tau1) ;
        distance = sqrt ((x1-x0)^2 + (y1-y0)^2 + (z1-z0)^2) ;
    end


