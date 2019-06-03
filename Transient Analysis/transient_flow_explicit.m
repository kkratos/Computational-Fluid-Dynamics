clear all
close all
clc

L = 1;
n_x = 20;
n_y = 20;
x = linspace(0, L, n_x);
y = linspace(0, L, n_y);
dx = x(2) - x(1);
dy = y(2) - y(1);
error = 9e9;
tol = 1e-4;
dt = 30;
alpha = 1.88e-5;
%boundary condition
t_l = 400;
t_t = 600;
t_r = 800;
t_b = 900;

t = ones(n_x, n_y);
t(1,2:n_x) = t_t;
t(n_x, 2:n_x) = t_b;
t(2:n_y-1, 1) = t_l;
t(2:n_y-1, n_x) = t_r;

t(1, 1) = (t_t + t_l)/2;
t(n_x, n_y) = (t_r + t_b)/2;
t(1, n_y) = (t_t + t_r)/2;
t(n_x, 1) = (t_l + t_b)/2;


k1 = (alpha*dt)/(dx^2);
k2 = (alpha*dt)/(dy^2);

[X, Y] = meshgrid(x, y);
told = t;
nt = 1000;
ctr = 1; %counter for number of iteration
for k = 1:nt
    for i=2:n_x-1
        for j=2:n_y-1
            t1 = told(i, j);
            t2 = k1*(told(i+1,j) - 2*told(i,j) + told(i-1, j));
            t3 = k1*(told(i,j+1) - 2*told(i,j) + told(i, j-1));
            t(i, j) = t1 + t2 + t3;
        end
    end
    error = max(max(abs(told - t)));
    told = t;
    ctr = ctr + 1;
    
    figure(1)
    [a, b] = contourf(X, Y, t);
    clabel(a, b);
    colormap(jet)
    %contour(x, y, t);
    xlabel('X')
    ylabel('Y')
    colorbar
    title_text = sprintf('no of iteration = %d', ctr);
    title(title_text)

end