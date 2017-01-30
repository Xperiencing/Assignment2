//Property of Patrick Malone. C15398146.
//This project is to make a classic game, and I have chosen to create
//tetris.

void setup()
{
  //Setting the size of the screen.
  size(420, 620);
  background(0);
  
  menu_check = 0;
}

void draw()
{
  //Menu Check will change depensing on what stage of the game the user is currently on.
  switch (menu_check)
  {
    case 0:
    {
      display_menu();
    }
  }
  
}

//This code will produce the starting menu for the game.
void display_menu()
{
  textAlign(CENTER);
  textSize(40);
  stroke(255);
  
  draw_grid();
  
  //text("Play", width/2, height * 1/4);
  //text("Options", width/2, height * 1/2);
  //text("Exit", width/2, height * 3/4);
}

//This will draw grid for both the start menu and in game.
void draw_grid()
{
  i = 0; 
  z = 0;
  
  //Drawing horizontal lines up until the edge of the screen
  while (i < height) 
  {
    line(border, border + (z * spacing), width - border, border + (z * spacing));
    
    z++;
    i += spacing;
  }
  
  i = 0;
  z = 0;
  
  //Drawing vertical lines to complete the grid up until the end of the screen.
  while (i < width) 
  {
    line(border + (z * spacing), border, border + (z * spacing), height - border);
    
    z++;
    i += spacing;
  }
  
}