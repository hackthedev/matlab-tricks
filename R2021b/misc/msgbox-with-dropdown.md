If you want to create a message box in matlab that also has a drop down menu/listbox, this will be a nice solution. The following code also fixed "the issue"
with the prompt text being cut off, meaning you can freely type as much as you want by using this code without having to worry that your text will be
cutt off.

As always, this is just some example code and you can edit it to your needs :)

```matlab
answer = msgList(["Option 1", "Option 2"], ...
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
    
    [index,tf] = listdlg('PromptString',[{prompt}, lineBreaks], 'ListString',list, ...
                "SelectionMode", "single", "Name", title, "ListSize", [160, 100]);
            
    results = list{index};                            
end
```

<br>

![image](https://user-images.githubusercontent.com/40896559/200276274-454367ab-ba62-4909-8868-ccdee34e2e1e.png)
