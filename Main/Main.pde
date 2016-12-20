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

void display_menu()
{
  
}