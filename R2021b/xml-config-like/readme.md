# XML Like Config File
This example contains two functions that'll allow you to save data in a text file and retrieve it later on. 

<br>

## Saving Data
If you want to save data you need to specify a name for a tag so you can find the actual data you saved later on. 

Example: You want to save a username `joe`. This is your data. 
Now you need to specify some tag, like `username`.
In order to save this information now, all you need to do is writing the following line:
`UpdateConfig(app, "test.txt", "username", "Joe");`
