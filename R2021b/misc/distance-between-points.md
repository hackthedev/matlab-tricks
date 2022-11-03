If you need to calculate the distance between two points using X and Y coordinates, the following code will help you! Define `x1` and `y1` for the first 
point, and `x2` and `y2` for the second point [^1].

```matlab
% Location 1 (X, Y)
x1 = 50;
y1 = 50;

% Location 2 (X, Y)
x2 = 100;
y2 = 100;

% Calculate the distance
d=sqrt((y2-y1)^2+(x2-x1)^2);

% Result: 70.7107 Pixel
```
You can also conver the pixels to milimeter [^px2mm] as i did in my case.

[^1]: If you change `y1` and `y2` to 0, the calculated distance will return 50.
[^px2mm]: [Convert Pixel to Milimeter from Camera Image](https://github.com/hackthedev/matlab-tricks/blob/main/R2021b/misc/pixel-to-mm.md)
