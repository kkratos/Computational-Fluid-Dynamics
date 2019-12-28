# CFD
Steady State and Transient Analysis for 2D Heat Conduction Equation

## Equation of Heat Conduction
![equation](https://latex.codecogs.com/svg.latex?%5Cfrac%7B%5Cpartial%5E2%20T%7D%7B%5Cpartial%20x%5E2%7D%20&plus;%20%5Cfrac%7B%5Cpartial%5E2%20T%7D%7B%5Cpartial%20y%5E2%7D%20%3D%200)

### Discretizing the 2D PDE by cnetral differencing method as follows
### First with respect to x
![equation](https://latex.codecogs.com/svg.latex?\frac{\partial^2&space;T}{\partial&space;x^2}&space;=&space;\frac{T_{(i-1,j)}-2T_{(i,j)}&plus;T_{(i&plus;1,&space;j)}}{\Delta&space;x^{2}})

### With respect to y
![equation](https://latex.codecogs.com/svg.latex?\frac{\partial^2&space;T}{\partial&space;y^2}&space;=&space;\frac{T_{(i,j-1)}-2T_{(i,j)}&plus;T_{(i,&space;j&plus;1)}}{\Delta&space;y^{2}})

### Since nx = ny we can take ![equation](https://latex.codecogs.com/svg.latex?\Delta&space;x^{2}&space;=&space;\Delta&space;y^{2})

### So the equation we get is 
![equation](https://latex.codecogs.com/svg.latex?T(i,&space;j)&space;=&space;\frac{1}{4}(T_{(i-1,&space;j)}&space;&plus;T_{(i&plus;1,&space;j)}&space;&plus;&space;T_{(i,&space;j-1)}&space;&plus;T_{(i,&space;j&plus;1)}&space;))
 
