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
t(n_x, 2:n_y-1) = t_b;
t(2:n_y-1, 1) = t_l;
t(2:n_y-1, n_x) = t_r;

t(1, 1) = (t_t + t_l)/2;
t(n_x, n_y) = (t_r + t_b)/2;
t(1, n_y) = (t_t + t_r)/2;
t(n_x, 1) = (t_l + t_b)/2;


k1 = (alpha*dt)/(dx^2);
k2 = (alpha*dt)/(dy^2);

[X, Y] = meshgrid(x, y);
nt = 1000;

iterative_method =3;

if iterative_method==1
    jacobi(t, x, y, n_x, n_y, tol, k1, k2, nt);
end

if iterative_method==2
    gs_iteration(t, x, y, n_x, n_y, tol, k1, k2, nt);
end

if iterative_method==3
    SOR_iteration(t, x, y, n_x, n_y, tol, k1, k2, nt);
end