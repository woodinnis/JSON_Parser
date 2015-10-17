/*
*   Write data to a JSON File
*/

var JSONMap = ds_map_create();
var size = 0;
var countValues = argument[0];
var countArg = argument_count;
var key = "";
var value = "";
var tempStr = "";   // Container for JSON file contents to which new data will be appended
str = "";           // Container for new JSON data

// Create a ds_map to hold the data
JSONMap = JSON_Read();

size = JSON_Size(JSONMap);

//list = ds_map_find_value(JSONMap, "default");
//size = ds_list_size(list);
index = 0;
for(i = 1; i < countArg ; i++)
{
    key[index] = argument[i];
    i++;
    value[index] = argument[i];
    index++;
}

// Enter data into ds_map
for(j = 0; j < countValues; j++)
{
    ds_map_add(JSONMap, key[j], value[j])
}

// Convert data to JSON
str = json_encode(JSONMap);

// Append to appropriate data file
data = file_text_open_write(JSONFile);
file_text_write_string(data, "[")
file_text_write_string(data, str);
file_text_write_string(data, "]")
file_text_close(data);

ds_map_destroy(JSONMap);
