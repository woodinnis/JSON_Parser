/*
*   Write data to a JSON File
*/

var countEntry = argument0;
var countValues = argument1;
var key = argument2;
var value = argument3;
var tempStr = "";   // Container for JSON file contents to which new data will be appended
str = "";           // Container for new JSON data

// Create a ds_map to hold the data
JSONMap = ds_map_create();

// Enter data into ds_map
for(i = 0; i < countEntry; i++)
{
    for(j = 0; j < countValues; j++)
    {
        ds_map_add(JSONMap, key[j], value[j])
    }
}

// Convert data to JSON
str = json_encode(JSONMap);

// Read current file contents into a temporary container
data = file_text_open_read(JSONFile)
while(!file_text_eof(data))
{
    tempStr = tempStr + file_text_read_string(data);
    if(file_text_eoln(data))
            file_text_readln(data);
}
file_text_close(data);

// Find any instances of closing square braces and replace them with null
// This needs to be replaced with a system to only locate the final closing quare brace in the file
if(string_pos("]", tempStr) != 0)
{
    show_debug_message(string_pos("]", tempStr))
    tempStr = string_replace_all(tempStr, "]", "");
}

str = tempStr + str;

/* Append to appropriate data file
data = file_text_open_write(JSONFile);
file_text_write_string(data, str);
file_text_write_string(data, "]");
file_text_close(data);


ds_map_destroy(JSONMap);
