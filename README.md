# CFD
Steady State and Transient Analysis for 2D Heat Conduction Equation

## Equation of Heat Conduction
![equation](https://latex.codecogs.com/svg.latex?%5Cfrac%7B%5Cpartial%5E2%20T%7D%7B%5Cpartial%20x%5E2%7D%20&plus;%20%5Cfrac%7B%5Cpartial%5E2%20T%7D%7B%5Cpartial%20y%5E2%7D%20%3D%200)

### Discretizing the 2D PDE by cnetral differencing method as follows

![equation](https://latex.codecogs.com/svg.latex?\frac{\partial^2&space;T}{\partial&space;x^2}&space;=&space;\frac{T_{(i,j-1)}-2T_{(i,j)}&plus;T_{(i&plus;1,&space;j)}}{\Delta&space;x^{2}})

![equation](https://latex.codecogs.com/gif.latex?%5Cfrac%7B%5Cpartial%5E2%20T%7D%7B%5Cpartial%20y%5E2%7D%20%3D%20%5Cfrac%7BT_%7B%28i%2Cj-1%29%7D-2T_%7B%28i%2Cj%29%7D&plus;T_%7B%28i%2C%20j&plus;1%29%7D%7D%7B%5CDelta%20y%5E%7B2%7D%7D)
