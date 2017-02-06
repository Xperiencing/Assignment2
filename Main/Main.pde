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
    shape_pick [i] = int(random(0, 8));
    shape_pick [i + 1] = int(random(0,6));
  }
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
        line = new Line_shape(prim_shape_colour[shape_pick[1]], sec_shape_colour[shape_pick[1]]);
      }
      
      if(shape_pick[0] == 1)
      {
        square = new Square_shape(prim_shape_colour[shape_pick[1]], sec_shape_colour[shape_pick[1]]);
      }
      
      if(shape_pick[0] == 2)
      {
        l = new L_shape(prim_shape_colour[shape_pick[1]], sec_shape_colour[shape_pick[1]]);
      }
      
      if(shape_pick[0] == 3)
      {
        j = new J_shape(prim_shape_colour[shape_pick[1]], sec_shape_colour[shape_pick[1]]);
      }
      
      if(shape_pick[0] == 4)
      {
        tee = new Tee_shape(prim_shape_colour[shape_pick[1]], sec_shape_colour[shape_pick[1]]);
      }
      
      if(shape_pick[0] == 5)
      {
        zee = new Z_shape(prim_shape_colour[shape_pick[1]], sec_shape_colour[shape_pick[1]]);
      }
      
      if(shape_pick[0] == 6)
      {
        s = new S_shape(prim_shape_colour[shape_pick[1]], sec_shape_colour[shape_pick[1]]);
      }
    }
    
    case 1:
    {
      //Plotting the shape, drawing the grid and all the individual blocks.
      if(1 == 1)
      {
        L_shape a = new L_shape(2, 2);  
        a.plot(4, 3);
      }
      //a.plot(4, 5);
      mainGrid.draw_grid();
      mainGrid.draw_block(int(random(0, 6)));
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