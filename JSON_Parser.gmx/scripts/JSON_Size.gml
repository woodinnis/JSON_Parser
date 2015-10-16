/*
*   Check a ds_map containing JSON data, and return information
*   about its size
*/

var JSONMap = ds_map_create();
var list = ds_list_create();
var size = 0;

// Fill ds_map
JSONMap = argument0;

// Determine size of JSON data inside ds_map
list = ds_map_find_value(JSONMap, "default")
size = ds_list_size(list);

// Return value
return(size);

// Destroy ds_map and list
ds_map_destroy(JSONMap);
ds_list_destroy(list);
