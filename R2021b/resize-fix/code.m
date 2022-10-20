function startupFcn(app)
  % The following lines can be added to your applications
  % startup function to resize your application properly,
  % as there are still some issues with the automatic
  % resizing in the app designer.
  %
  % A Grid-Layout is required for this to work tho.
  % Screenshots will be added.
  
  % Define global variables for later use. These two
  % Values should never change.
  global originalHeight;
  global originalWidth;

  originalWidth = app.UIFigure.Position(3);
  originalHeight = app.UIFigure.Position(4);

  % Function for resizing
  betterResize(app);
end

function betterResize(app)
    % Variables defined in "OnLoad" of the Application.
    global originalHeight;
    global originalWidth;

    % In my case, i only wanted to update the size if i was on a
    % specific tab, as only this tab needed to resize properly for me.
    % You can remove the if condition.
    if app.TabGroup.SelectedTab == app.camTab
    
        try
            % Get the current size
            position = app.UIFigure.Position;

            % Pre-defining variables
            % These two variables will change the width and height of
            % a specific row/column in the Grid Layout.
            adjustedWidth = 0;
            adjustedHeight = 0;

            % Optional Spacing 
            paddingWidth = 0;
            paddingHeight = 0;

            % Current width and height
            screenWidth = position(3);
            screenHeight = position(4);

            % If the app size is bigger than it was when it started..
            % Calculate the difference in size and add it to the Grid Layout
            % Row/Column
            
            % Calculating Width
            if originalWidth < screenWidth
                adjustedWidth = screenWidth - originalWidth;
                paddingWidth = 0;
            else
                adjustedWidth = 0;
                paddingWidth = 0;
            end

            % Calculating Height
            if originalHeight < screenHeight
                adjustedHeight = screenHeight - originalHeight;
                paddingHeight = 0;
            else
                adjustedHeight = 0;
                paddingHeight = 0;
            end

            % Update the Grid Layout accordingly 
            
            % Each Column is one number. Same for Row Height. See Image in Repo
            app.GridLayout.ColumnWidth = {2,25,200,31,100,100, (80 + (abs(adjustedWidth) - paddingWidth)) / 2 ,100, (abs(adjustedWidth) - paddingWidth) / 2 ,180,40,40};
            app.GridLayout.RowHeight = {10,38,10,52,52,52,52,52,29,22,22, abs(adjustedHeight) - paddingHeight ,22,22,22,22,22};
        catch ME
            % Can cause a error from time to time but it can be ignored.
            % Happens when the size is smaller than the original one. 
        end
    end
end
