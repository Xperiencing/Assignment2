//Property of Patrick Malone. C15398146.
//This project is to make a classic game, and I have chosen to create
//tetris.

void setup()
{
  //Setting the size of the screen.
  size(420, 620);
  background(0);
  
  menu_check = 0;
  
  //Calculating the number of rows and columns that are in the grid that will be drawn.
  rows = (height - (border * 2))/spacing;
  cols = (width - (border * 2))/spacing;
  
  //This creates a new object of the grid class using the rows and cols variables.
  mainGrid = new Grid(rows, cols);
  
  //Creating the array that contins the different shape options aswell as 
  //The random colours.
  shape_pick = new int [8];
  
  for(i = 0; i < 8; i+= 2)
  {
    shape_pick [i] = (int)random(0, 7);
    shape_pick [i + 1] = (int)random(0,6);
  }
  
  //Setting the start time.
  start_time = millis();
}

void draw()
{
  //Menu Check will change depensing on what stage of the game the user is currently on.
  switch (menu_check)
  {
    case 0:
    {
      //Creating a test shape for the game.
      if(shape_pick[0] == 0)
      {
        shape_list.add(new Line_shape(shape_pick[1]));
      }
      
      if(shape_pick[0] == 1)
      {
        shape_list.add(new Square_shape(shape_pick[1]));
      }
      
      if(shape_pick[0] == 2)
      {
        shape_list.add(new L_shape(shape_pick[1]));
      }
      
      if(shape_pick[0] == 3)
      {
        shape_list.add(new J_shape(shape_pick[1]));
      }
      
      if(shape_pick[0] == 4)
      {
        shape_list.add(new Tee_shape(shape_pick[1]));
      }
      
      if(shape_pick[0] == 5)
      {
        shape_list.add(new Z_shape(shape_pick[1]));
      }
      
      if(shape_pick[0] == 6)
      {
        shape_list.add(new S_shape(shape_pick[1]));
      }
      
      x_pos = (int)random(0, cols - 1);
      y_pos = 2;
      
      menu_check = 1;
    }
    
    case 1:
    {
      //Resetting the background each time.
      background(0);
      
      //Plotting the shape, drawing the grid and all the individual blocks.
      shape_list.get(0).plot(x_pos, y_pos);
      mainGrid.draw_grid();
      
      int pick_colour = shape_list.get(0).get_colour();
      mainGrid.draw_block(pick_colour);
    
      if(millis() > (start_time + 1000))
      {
        start_time = millis();
        mainGrid.clear_grid();
        y_pos++;  
      }
    }
  }
}

//This code will produce the starting menu for the game.
void display_menu()
{
  textAlign(CENTER);
  textSize(40);
  stroke(255);
  
  mainGrid.draw_grid();
  
  //text("Play", width/2, height * 1/4);
  //text("Options", width/2, height * 1/2);
  //text("Exit", width/2, height * 3/4);
}