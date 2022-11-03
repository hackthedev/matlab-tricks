If we take the code from [this example](https://github.com/hackthedev/matlab-tricks/blob/main/R2021b/misc/distance-between-points.md), where we tried to 
[calculate the distance between two points](https://github.com/hackthedev/matlab-tricks/blob/main/R2021b/misc/distance-between-points.md), we can use the
number calculated in pixel and convert it into pixels.

In my example, i tried measuring distances in an image taken from a camera. In order to get the scale right, i used to take a photo of a ruler, mark the 
distance between two marks for one milimeter on the ruler and device the number from `d` with the distance from the one milimeter of the ruler image,
which in my case was about 16 pixel for 1 milimeter.

For this to work reliable, the distance of the object i tried to measure with the camera had to be the same as good as possible, because if the object was 
closer or further away, this pixel value of about 16px per mm would change.
```
% Location 1 (X, Y)
x1 = 50;
y1 = 50;

% Location 2 (X, Y)
x2 = 100;
y2 = 100;

% Calculate the distance
d=sqrt((y2-y1)^2+(x2-x1)^2);

% Result: 70.7107 Pixel, lets change this to mm
results = d / double(16.1884); % Returns 4.3680 mm
```
