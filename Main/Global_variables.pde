int menu_check = 0, function_check = 0;
int result = 0;
PFont tetris, normal;

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
int grid_width;

//Variables for the tetris shapes.
int [] speed = {1000, 500, 200, 100};
int [] score_shape = {10, 20, 30};
int [] score_line = {100, 150, 200};

int x_pos, y_pos;
int [] shape_pick;
float start_time;

int demo_x, demo_y;

int difficulty = 0, copy_difficulty;
long score = 0, highscore;

int [][] temp_positions;

//Arraylist to store each of the objects.
ArrayList<Shape> shape_list = new ArrayList<Shape>();

//Cooldowns for the different actions in the game.
float rotate_cool, move_cool;