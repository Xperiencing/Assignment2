int menu_check = 0;

//Index variables used for counters and for loops.
int i = 0, z = 0;

//These vraibales dictate the parameters of the grid.
int border = 10, spacing = 25;

//This array will hold the different colours for the blocks.
color [] prim_shape_colour = {color(255, 0 , 0),
                          color(255, 255, 0),
                          color(0, 255, 0),
                          color(0, 255, 255),
                          color(0, 0, 255),
                          color(255, 0, 255)};
                          
color [] sec_shape_colour = {color(204, 0 , 0),
                          color(204, 204, 0),
                          color(0, 204, 0),
                          color(0, 204, 204),
                          color(0, 0, 204),
                          color(204, 0, 204)};

//Variables used for the grid.
Grid mainGrid;
int rows, cols;

int speed = 5;