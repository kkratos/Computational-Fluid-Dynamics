function gauss_iter(T, x, y, nx, ny, tol, error, k1, k2, told)
    %Gauss Siedel Iteration
    gs_iter = 1;

    while(error > tol)

        for i=2:nx-1
            for j=2:ny-1
                T(i, j) = k1*(T(i, j-1)+told(i, j+1))+k2*(T(i-1, j)+told(i+1, j));
            end
        end
        error = max(max(abs(told - T)));
        told = T;
        gs_iter = gs_iter + 1;

        figure(2)
        contour(x, y, T);
        [a, b] = contourf(x, y, T);
        clabel(a, b);
        xlabel('X')
        ylabel('Y')
        colorbar

        title_text = sprintf('gauss iteration = %d', gs_iter);
        title(title_text)
    end
end
