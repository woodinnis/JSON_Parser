/*
*   Read data from a JSON file into a ds_map
*   and return it to a calling function
*/

var JSONContents = "";
var decodeMap;
var list;
var size;

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
    size = ds_list_size(list);

    return(decodeMap);
    ds_list_destroy(list);
    ds_map_destroy(decodeMap);
}
