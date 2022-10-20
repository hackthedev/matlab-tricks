# App Designer Resize Fix
Its not a new issue that the App Designer and its resize behaviour is something new to the community. I was trying to find a solution for my problem, and managed to fix it in a somewhat sketchy way, tho it is working for me and thats why im fine with it. Many other people have issues too as i've read in forums, so im sharing this code too.

In order for this to work you need to use a Grid Layout, like in the screenshot, and add 1 extra row and column for resizing. In my case i used Column 9, row 12. To find out which column and row you have to change programmatically, i'd recommend copying the ColumnWidth and RowHeight Property and replacing the desired value with the variable used in the code in [here](code.m)


![image](https://user-images.githubusercontent.com/40896559/196919350-f1131964-b368-409f-95d5-d9d880ed3aca.png)
![image](https://user-images.githubusercontent.com/40896559/196933525-96922101-dd4a-417c-9c86-7158e54863b1.png)
