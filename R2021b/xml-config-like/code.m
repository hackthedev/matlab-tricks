function results = GetConfigValue(~, file, tag)
    % This is used to get a specific value from the config text file
    %
    % Parameter:
    % ~ : app
    % file : File path to the target file
    % tag : The option you are trying to find in the text file, i.e. "CreationDate",
    % will try to find a tag like "<CreationDate>01.01.1990</CreationDate>" and will 
    % return the value between the tags, in this case "01.01.1990".

    % Folgender Regex Ausdruckt gibt uns den Wert zwischen den Klammern zurück
    filecontent = fileread(file);
    pat = regexp(filecontent, '<' + tag + '>(.*?)</' + tag + '>', 'tokens');
    s = string(pat);

    % Gibt die Zeile zurück wenn die Option in der Config Datei
    % gefunden wurde. Wird jedoch nicht verwendet
    line = false;            
    if line == true
        filecontent_split = regexp(filecontent,'\n','split');
        whichline = find(contains(filecontent_split,'<' + tag + '>' + s +'</' + tag + '>'));

        s = whichline;
    end    

    results = s;
end

function UpdateConfig(app, file, option, value)
    % Sucht einen speziellen Tag, zB <beispiel>1</beispiel>
    % und ändert den Wert zwischen den Tags, in dem Fall 1

    fid = fileread(file);
    filecontent_split = regexp(fid,'\n','split');

    % Suche nach dem String
    i = 1;
    lineFound = 0;
    for k = 1:length(filecontent_split)
        l(k) = filecontent_split(k);
        i = k;


        if filecontent_split(k) == "<" + option + ">" + GetConfigValue(app, file, option) + "</" + option + ">"
           lineFound = k;

           filecontent_split(k) = cellstr("<" + option + ">" + value + "</" + option + ">");
        end

    end

    % wenn es die zeile nicht gibt, erstelle sie
    fid = fopen(file, 'w');
    if lineFound == 0
        cellstr("<" + option + ">" + value + "</" + option + ">")
        filecontent_split(i+1) = cellstr("<" + option + ">" + value + "</" + option + ">");
    end

    % Schreibe die neue datei
    for i = 1:length(filecontent_split)                
        if i == length(filecontent_split)
            fprintf(fid,'%s', filecontent_split{i});
            break;
        else
            fprintf(fid,'%s\n', filecontent_split{i});
        end
    end
end
