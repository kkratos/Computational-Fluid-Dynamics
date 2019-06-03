function jacobi(t, x, y, nx, ny, tol, k1, k2, nt)
    
    %jacobi iteration
    jacobi_iter = 1;
    told = t;
    t_prev_dt = told;
    term1 = (1+2*k1+2*k2)^(-1);
    term2 = k1*term1;
    term3 = k2*term1;
    
    for k = 1:nt %time-loop
        error = 9e9;
        while(error > tol) %convergence loop
            %nodal loop
            for i=2:nx-1
                for j=2:ny-1
                    H = (told(i-1,j)+told(i+1, j));
                    V = (told(i, j-1)+told(i, j+1));
                    t(i, j) = ((t_prev_dt(i,j)*term1)+(H*term2)+(V*term3));
                end
            end
            error = max(max(abs(told - t)));
            told = t;
            jacobi_iter = jacobi_iter + 1;

            %figure(1)
            %contour(x, y, t);
            %[a, b] = contourf(x, y, t);
            %clabel(a, b);
            %xlabel('X')
            %ylabel('Y')
            %colorbar

            %title_text = sprintf('jacobi iteration = %d', jacobi_iter);
            %title(title_text)
        end
        t_prev_dt = t;
    end
    figure(1)
    contour(x, y, t);
    [a, b] = contourf(x, y, t);
    clabel(a, b);
    xlabel('X')
    ylabel('Y')
    colorbar

    title_text = sprintf('jacobi iteration = %d', jacobi_iter);
    title(title_text)
end



