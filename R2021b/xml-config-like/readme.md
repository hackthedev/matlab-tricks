# XML Like Config File
This example contains two functions that'll allow you to save data in a text file and retrieve it later on. See [code.m](code.m)

<br>

## Saving Data
If you want to save data you need to specify a name for a tag so you can find the actual data you saved later on. You can update existing data if its already present in the file or it will automatically add it to the file.

Example: You want to save a username `joe`. This is your data. 
Now you need to specify some tag, like `username`.
In order to save this information now, all you need to do is writing the following line:
`UpdateConfig(app, "test.txt", "username", "Joe");`

<br>

## Retrieving Data
If you want to retrieve data, you need to specify a tag that already exists in the text file. If we take the above example, and you want to retrieve the `username` from the text file, `joe`, you can simply get it by executing the following:
`GetConfigValue(app, "test.txt", "username");`
