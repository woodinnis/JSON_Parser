/*
*   Search a ds_map populated with JSON data for a key
*   and return the corresponding values
*/

var JSONMap = ds_map_create();
var searchKey = "";
var list = ds_list_create();
var size = 0;
var map = ds_map_create();
var curr = ds_map_create();
var JSONData = 0;

JSONMap = argument0
searchKey = argument1;


// Ensure search key is a string
if(!is_string(searchKey))
    string(searchKey);

// Get size of ds_map
list = ds_map_find_value(JSONMap, "default");
size = ds_list_size(list);

for(i = 0; i < size; i++)
{
    // Create a new ds_map, use values in list
    map = ds_list_find_value(list, i);
    curr = ds_map_find_first(map);
    // Enter data into an array, 
    while(is_string(curr))
    {
        // Search for specified values by key
        entry = ds_map_find_value(map, searchKey)
        if(!is_undefined(entry))
            JSONData[i] = entry;
            
        curr = ds_map_find_next(map, curr);
    }
    ds_map_destroy(map);
}

// Return search results and destroy ds_map, lists
return(JSONData);
ds_list_destroy(list);
ds_map_destroy(JSONMap);
