function results = GetConfigValue(~, file, tag)
    % This is used to get a specific value from the config text file.
    %
    % Parameter:
    % ~ : app
    % file : File path to the target file
    % tag : The option you are trying to find in the text file, i.e. "CreationDate",
    % will try to find a tag like "<CreationDate>01.01.1990</CreationDate>" and will 
    % return the value between the tags, in this case "01.01.1990".

    % The following regex will get the text between the tags
    filecontent = fileread(file);
    pat = regexp(filecontent, '<' + tag + '>(.*?)</' + tag + '>', 'tokens');
    s = string(pat);

    % You can add an additional parameter to the function and call it, as in this 
    % exmaple "line", and when set you can then search the file for the value you're
    % looking and get the line number where it is being stored in the file.
    line = false;            
    if line == true
        filecontent_split = regexp(filecontent,'\n','split');
        whichline = find(contains(filecontent_split,'<' + tag + '>' + s +'</' + tag + '>'));

        s = whichline;
    end    

    results = s;
end

function UpdateConfig(app, file, option, value)
    % This function is looking for a tag "option" in the specified file "file" 
    % and replaces its value between the tags with "value". You can also use it
    % add new values to the file as its adding them to the file if they're not
    % already existing.
    %
    % Example:
    % file = test.txt
    % option = "Date"
    % value = "01.01.2022"
    %
    % It would look through the file test.txt to find a tag like "<Date>01.01.1990</Date>"
    % and replaces the current value in the file "01.01.1990" with "01.01.2022".

    fid = fileread(file);
    filecontent_split = regexp(fid,'\n','split');

    % Searching for the string
    i = 1;
    lineFound = 0;
    for k = 1:length(filecontent_split)
        l(k) = filecontent_split(k);
        i = k;

        % Line found!
        if filecontent_split(k) == "<" + option + ">" + GetConfigValue(app, file, option) + "</" + option + ">"
           lineFound = k;

           filecontent_split(k) = cellstr("<" + option + ">" + value + "</" + option + ">");
        end

    end

    % If the line didnt exist, add it to the file
    fid = fopen(file, 'w');
    if lineFound == 0
        cellstr("<" + option + ">" + value + "</" + option + ">")
        filecontent_split(i+1) = cellstr("<" + option + ">" + value + "</" + option + ">");
    end

    % Write the updated file
    for i = 1:length(filecontent_split)                
        if i == length(filecontent_split)
            fprintf(fid,'%s', filecontent_split{i});
            break;
        else
            fprintf(fid,'%s\n', filecontent_split{i});
        end
    end
end
