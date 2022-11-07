If you want to create a message box in matlab that also has a drop down menu/listbox, this will be a nice solution. The following code also fixed "the issue"
with the prompt text being cut off, meaning you can freely type as much as you want by using this code without having to worry that your text will be
cutt off.

As always, this is just some example code and you can edit it to your needs :)

```matlab
answer = msgList(["Live", "Statisch"], ...
                        "This is a lot of text it is amazing the char limit for one line seems" + ...
                    " to be 32 characters. its amazing to be able to work around it tho", ...
                        "An interesting title");
                        
function results = msgList(list, prompt, title)
    lineBreaks = [];
    counter = 1;
    for i = 1:strlength(prompt)
        if counter == 32
            lineBreaks = [{''}, lineBreaks];
            counter = 1;
        end
        
        counter = counter + 1;
    end
    
    [index,tf] = listdlg('PromptString',[{prompt}, lineBreaks], 'ListString',list, "SelectionMode", "single", "Name", title);
    results = list{index};                              
end
```
