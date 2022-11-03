If we take the code from this example[^1], where we tried to 
[calculate the distance between two points](https://github.com/hackthedev/matlab-tricks/blob/main/R2021b/misc/distance-between-points.md), we can use the
number calculated in pixel and convert it into milimeter.

In my example, i tried measuring distances in an image taken from a camera. In order to get the scale right, i used to take a photo of a ruler, mark the 
distance between two marks for one milimeter on the ruler and device the number from `d` with the distance from the one milimeter of the ruler image,
which in my case was about 16 pixel for 1 milimeter.

For this to work reliable, the distance of the object i tried to measure with the camera had to be the same as good as possible, because if the object was 
closer or further away, this pixel value of about 16px per mm would change.

```matlab
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

<br>

## Screenshots
Behind the ruler was the object i tried to measure
![image](https://user-images.githubusercontent.com/40896559/199663385-4f7c494a-7779-47b9-bccf-ca723e0fee65.png)

<br>

I then zoomed in to better see the lines for one milimeter (the closer you go the more accurate it will be)
![image](https://user-images.githubusercontent.com/40896559/199663613-264b3984-90b2-4554-9505-df7f52c10148.png)

<br>

After drawing a line using `drawline()` on the photo, i calculated the distance of the line i had drawn, and saved this value in a text file, as this would be my value for future calculations to convert the pixels from the camera taken to milimeter, as long as the distance of the object and the camera was the same as good as possible.
![image](https://user-images.githubusercontent.com/40896559/199664192-f035651f-dca3-49b9-bd15-6a9bf0992827.png)


[^1]: [How to calculate the distance between two points](https://github.com/hackthedev/matlab-tricks/blob/main/R2021b/misc/distance-between-points.md)
