I used to clear all items from a ListBox using the following two lines. It does add a empty Item to the list. 
I used to simply check if the item selected on click is not empty, so it was never an issue to me.

```matlab
app.ListBox.ItemsData = [];
app.ListBox.Items=cellstr(num2str([]));
```
