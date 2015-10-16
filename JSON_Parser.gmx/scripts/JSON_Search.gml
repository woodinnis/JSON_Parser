/*
*   Read data from a JSON file
*/

var JSONContents = "";
var decodeMap;
var list;
var size;
var map;
var curr;

var searchKey = argument0;

// Ensure search key is a string
if(!is_string(searchKey))
    string(searchKey);

// Check for valid file
if(file_exists(JSONFile))
{
    // Open file and read contents into a string   
    data = file_text_open_read(JSONFile);
    while(!file_text_eof(data))
    {
        newText = file_text_read_string(data)
        JSONContents = JSONContents + newText;
        if(file_text_eoln(data))
            file_text_readln(data);
    }
    file_text_close(data);
    
    // Enter contents of string into a ds_map, get list size
    decodeMap = json_decode(JSONContents);
    list = ds_map_find_value(decodeMap, "default");
    show_debug_message(list)
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
    ds_list_destroy(list);
    ds_map_destroy(decodeMap);
}
