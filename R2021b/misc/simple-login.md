If you want to protect certain areas in your application, or restrict some sort of access with a login prompt, this could should do it. For the sake of simplicity the
example code is more like a "proof of concept" than an actual secure solution, tho you can try making it secure yourself.

```matlab
% Setup the inputs, in this example a username and password
prompt = {'Username:','Password:'};

% A title for the message prompt
dlgtitle = 'Login';

% Store the results
answer = inputdlg(prompt, dlgtitle);

if answer(1) == "admin" && answer(2) == "password"
    % If login is correct, proceed with some code
else
    % The login was wrong, proceed with logic
    msgbox("Username or password was incorrect");
end
```
