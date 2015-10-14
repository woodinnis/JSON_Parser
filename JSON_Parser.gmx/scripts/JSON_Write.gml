/*
*   Write data to a JSON File
*/

var countEntry = argument0;
var countValues = argument1;
var key = argument2;
var value = argument3;
str = "";

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

/* Append to appropriate data file
data = file_text_open_append(JSONFile)
file_text_write_string(data, str);
file_text_close(data);
