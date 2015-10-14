/*
*   Creation code for the overlord object
*/

// Set a global variable for the JSON file to be worked on
globalvar JSONFile;
JSONFile = working_directory + "\" + argument0;

// Create an array to hold the JSON data
globalvar JSONData;
JSONData = 0;


keys[0] = "Waffle"
keys[1] = "Doorknob"
keys[2] = "Apple pie"
keys[3] = "dick jokes"
values[0] = "Yes"
values[1] = "Metal"
values[2] = "cinnamon"
values[3] = 99

JSON_Write(2,4,keys,values);
