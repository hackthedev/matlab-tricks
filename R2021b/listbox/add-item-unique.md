
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
