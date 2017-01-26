//Property of Patrick Malone. C15398146.
//This project is to make a classic game, and I have chosen to create
//tetris.

void setup()
{
  //Setting the size of the screen.
  size(400, 600);
  
  menu_check = 0;
}

int menu_check;

int i = 0;

int border = 10, spacing = 20;

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
  
  draw_grid();
  
  textAlign(CENTER);
  textSize(40);
  
  text("Play", width/2, height * 1/4);
  text("Options", width/2, height * 1/2);
  text("Exit", width/2, height * 3/4);
}

//This will draw grid for both the start menu and in game.
void draw_grid()
{
  i = 0;
  int z = 0;
  
  while (i < height) 
  {
    line(border, border + (z * spacing), width - border, border + (z * spacing));
    
    z++;
    i += spacing;
  }
  
  i = 0;
  z = 0;
  
  while (i < width) 
  {
    line(border + (z * spacing), border, border + (z * spacing), height - border);
    
    z++;
    i += spacing;
  }
  
}