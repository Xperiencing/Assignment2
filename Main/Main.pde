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
}

void draw()
{
  //Menu Check will change depensing on what stage of the game the user is currently on.
  switch (menu_check)
  {
    case 0:
    {
      //Creating a test shape for the game.
      Square_shape a = new Square_shape(2, 2);
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