function SOR_iter(T, x, y, nx, ny, tol, error,k1, k2, told)
    
    %Successive over-relaxtion iteration
    sor_iter = 1;
    
    omega=2/(1+sin(2*pi/nx));
    while(error > tol)
        for i=2:nx-1
            for j=2:ny-1
                T(i, j) = omega*(k1*(T(i,j-1)+T(i,j+1))+k2*(T(i-1,j)+T(i+1,j)))+(1-omega)*told(i, j);
            end
        end
        error = max(max(abs(told-T)));
        told = T;
        sor_iter = sor_iter + 1;
        
        figure(3)
        contour(x, y, T);
        [a, b] = contourf(x, y, T);
        clabel(a, b);
        xlabel('X')
        ylabel('Y')
        colorbar
        title_text = sprintf('SOR iteration = %d', sor_iter);
        title(title_text)
    end
    
end