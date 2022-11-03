If you want to avoid adding the same item multiple times to your ListBox, look no further! The following code will check if the string you want to add does already exist in the ListBox's Items. This way, if the string you want to add wasnt found, it doesnt exist, therefore making the string unique then.

```matlab

car = "Audi";

% Get the items form the listbox
str = get(app.ListBox, 'Items'); 
str = cellstr(str);

if find(ismember(str, (car)))
   % A Item with the value of "car" does already exist
else 
   % There was no item with the value of "car" in the listbox, 
   % therefore we can add it
   app.JobauswhlenListBox.Items = [car, app.JobauswhlenListBox.Items];
end 
```
