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

%Boundary conditions
T_left = 400;
T_top = 600;
T_right = 800;
T_bottom = 900;
T = ones(n_x, n_y);

% temperature at boundary

T(1,1:n_x) = T_top;
T(n_y, 1:n_x) = T_bottom;
T(2:n_y-1, 1) = T_left;
T(2:n_y-1, n_x) = T_right;

told = T;

k1 = (dx^2)/(2*(dx^2+dy^2));
k2 = (dy^2)/(2*(dx^2+dy^2));

iterative_method = 1;
[X, Y] = meshgrid(x, y);

if iterative_method == 1
    jacobi_iter(T, x, y, n_x, n_y, tol, error, k1, k2, told);
end

if iterative_method == 2
    gauss_iter(T, x, y, n_x, n_y, tol, error, k1, k2, told);
end

if iterative_method == 3
    SOR_iter(T, x, y, n_x, n_y, tol, error, k1, k2, told);
end
