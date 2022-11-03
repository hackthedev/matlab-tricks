The following code will allow you to loop through all files in a directory, and is referencing to serveral other tricks here [^1][^2]
```matlab
ClearList(app, app.ThemesListBox);
            
% The path to the folder containing the files you want to get
D = string(ls("path/to/files/"));

% ls will also return these values. ".." is often a reference to the folder "above" the current one.
D = strrep(D, " ", "");
D = strrep(D, "..", "");

% For each file in the folder
for i=1:length(D)

    % If the file name isnt empty or something we dont want
    if D(i) ~= "" & D(i) ~= "."

        % Check if the ListBox does not already contain the file name to avoid duplicate entries
        str = get(app.ListBox, 'Items'); 
        str = cellstr(str);
        
        if find(ismember(str, (D(i))))
           % Duplicate Entry. Do nothing or handle it
        else 
           % The file name wasnt in the ListBox, so we can add it
           app.ListBox.Items = [D(i), app.ListBox.Items];
       end 
    end
end

fclose('all');
```

[^1]: [ClearList()](https://github.com/hackthedev/matlab-tricks/blob/main/R2021b/listbox/clear-items.md)
[^2]: [ListBox avoid duplicate entries](https://github.com/hackthedev/matlab-tricks/blob/main/R2021b/listbox/add-item-unique.md)
