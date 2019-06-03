function jacobi_iter(T, x, y, nx, ny, tol, error, k1, k2, told)
    
    %jacobi iteration
    jacobi_iter = 1;
    while(error > tol)
        
        for i=2:nx-1
            for j=2:ny-1
                T(i, j) = k1*(told(i-1, j)+told(i+1, j))+k2*(told(i, j-1)+told(i, j+1));
            end
        end
        error = max(max(abs(told - T)));
        told = T;
        jacobi_iter = jacobi_iter + 1;

        figure(1)
        contour(x, y, T);
        [a, b] = contourf(x, y, T);
        clabel(a, b);
        xlabel('X')
        ylabel('Y')
        colorbar

        title_text = sprintf('jacobi iteration = %d', jacobi_iter);
        title(title_text)
    end
end
